import system.
import system'routines.
import system'collections.

class IndexManager
{
    object theRva.
    bytearray theData. 
    bool theStrings.
    int theStringsOffset.
    int theUSOffset.
    bool theGuid.
    int theGuidOffset.
    bool theBlob.
    int theBlobOffset.
    array theTables.
    intarray theTableRows.
    
    constructor new bytearray:aData rvaManager:aRva
    [
        theRva := aRva.
        theData := aData.
        
        theStrings := false.
        theGuid := false.
        theBlob := false.
        
        theStringsOffset := 0.
        theUSOffset := 0.
        theGuidOffset := 0.
        theBlobOffset := 0.
        
        theTables := Array new int:64.
        theTableRows := IntArray new int:64.
        
        int i := 0.
        while(i < 64)
        [
            theTables@i := List new.
            theTableRows@i := 0.
            i := i + 1.
        ].
    ]
    
    setHeapSizes byte:aSize
    [
        theStrings := (aSize && 1) != 0.
        theGuid := (aSize && 2) != 0.
        theBlob := (aSize && 4) != 0. 
    ]
    
    createTable metadatatables:aTable bytearray:aData int:aAddress
    [
        var ret := MetadataTableCreator create metadatatables:aTable bytearray:aData int:aAddress.
        ret setIndexManager indexManager:($self).
        ^ ret.
    ]
    
    getStringsString int:aOffset
    [
        var bytes := Util getBytes bytearray:theData int:(theStringsOffset + aOffset).
        // return a UTF8 String
        
    ]
    
    getUSString int:aOffset
    [
        int address := theUSOffset + aOffset.
        var dataSize := Util getDataSize bytearray:theData int:address.
        byte bytes := Util getBytes bytearray:theData int:((dataSize getA) + address) int:(dataSize getB).
        // return a unicode string 
    ]
    
    getBlobBytes int:aOffset
    [
        int address := theBlobOffset + aOffset.
        var dataSize := Util getDataSize bytearray:theData int:address.
        
        int dtsA := dataSize A.
        int dtsB := dataSize B.
        
        ^ Util getBytes bytearray:theData int:(dtsA + address) int:dtsB.        
    ]
    
    getTable int:aToken
    [
        if(aToken == 0) [ ^$nil. ].
        int tkS := aToken >> 24.
        int tkA := aToken && 0ffffffh.
        ^ theTables@(tkS)@(tkA - 1).
    ]
    
    getToken codedIndices:aCdIdc int:aValue
    [
        int size := $self getTagSize codedIndices:aCdIdc.
        int vv := aValue >> size.
        var cdIdcData := codedIndexMetaDataTables eval.
        int pos := (aValue - (vv << size)).
        int tt := cdIdcData@aCdIdc@pos.
        ^ ((tt << 24) or: vv).
    ]
    
    getIndex codedIndices:aCdIdc int:aValue
    [
        ^(aValue >> ( $self getTagSize codedIndices:aCdIdc )).
    ]
    
    getIndexType codedIndices:aCdIdc int:aValue
    [
        int size := $self getTagSize codedIndices:aCdIdc.
        int v := aValue >> size.
        var tbl := codedIndexMetaDataTables eval.
        ^(tbl@aCdIdc@(aValue - 1)).
    ]
    
    isInt32 metadatatables:aMdt [ ^((theTableRows@aMdt) > ShortNumber max). ]
    
    isInt32 codedIndices:aCodIdc 
    [
        int max := 0.
        var tbl := (codedIndexMetaDataTables eval)@aCodIdc.
//        (tbl@aCodIdc) run each:(:obj)
//        [
//            int tblSize := theTableRows@obj.
//            if(max < tblSize) [ max := tblSize. ].
//        ].

        int i := 0.
        while(i < tbl length)
        [
            int tblSize := theTableRows@i.
            if(max < tblSize) [ max := tblSize. ].
            i := i + 1.
        ].
        
        int tagSize := $self getTagSize codedIndices:aCodIdc.
        ^((max << tagSize) > ShortNumber max).
    ]
    
    getTagSize codedIndices:aCodIdc
    [
        int rt := 0.
        int i := (((codedIndexMetaDataTables eval)@aCodIdc) length) - 1.
        while(i > 0)
        [
            rt := rt + 1.
            i := i >> 1.
        ].
        ^rt.
    ]
    
    makeTree pedata:aPeData
    [
        var listType := (theTables@mdtTypeDef).
        var size := listType length. 
        
//        int i := 0.
//        while(i < size)
//        [
//            var t2 := $nil.
//            if((i + 1) < size) [ t2 := listType@(i + 1). ].
//            
//            $self makeTree typeDefTbl:(listType@i) typeDefTbl:t2.
//            i := i + 1.
//        ].
        
        (theTables@mdtAssemblyRef) run each:(:obj)
        [
            var tmp := Array new int:1.
            tmp@0 := List new.
            obj setChildren children:tmp.
        ].
        
        (theTables@mdtTypeRef) run each:(:obj)
        [
            var tmp := Array new int:3.
            int i := 0.
            while(i < (tmp length)) [ tmp@i := List new. i := i + 1.].
            obj setChildren children:tmp.
        ].
        
        (theTables@mdtTypeRef) run each:(:obj)
        [
            if((obj resolutionScope) != 0)
            [
                var tk := $self getToken codedIndices:cdIdcResolutionScope int:(obj resolutionScope).
                obj setParentTable table:($self getTable int:tk).
                obj appendChildren children:obj int:(Children RefNested).
            ].
        ].
        
        (theTables@mdtMethodDef) run each:(:obj)
        [
            obj setTag tag:(MethodData new pedata:aPeData methodDefTable:obj).
        ].
        
        (theTables@mdtMemberRef) run each:(:obj) [ ].
        (theTables@mdtImplMap) run each:(:obj) [ ].
        (theTables@mdtNestedClass) run each:(:obj) [ ].
    ]
    
    makeTree typeDefTbl:aT1 typeDefTbl:aT2
    [
        int i := 0.
        array aT1Children := Array new int:3.
        while(i < 3) [ aT1Children@i := List new. i := i + 1.].
        
        aT1 setChildren children:aT1Children.
        
        var listField := (theTables@mdtField).
        var listMethod := (theTables@mdtMethodDef).
        int f1 := aT1 fieldList.
        int f2 := (listField length) + 1.
        if(aT2 != $nil) [ f2 := aT2 fieldList. ].
        
        i := f1.
        while(i < f2)
        [
            var ft := listMethod@(i - 1).
            aT1 appendChildren children:ft int:(Children DefField).
            ft setParentTable := aT1.
            i := i + 1.
        ].
        
        int method1 := aT1 methodList.
        int method2 := (listMethod length) + 1.
        if(aT2 != $nil) [ method2 := aT2 methodList. ].
        i := method1.
        while(i < method2)
        [
            var method := listMethod@(i - 1).
            aT1 appendChildren children:method int:(Children DefMethod).
            method setParentTable table:aT1. 
            $self makeTree methodDefTbl:method.
            i := i + 1.
        ].
    ]
    
    makeTree methodDefTbl:aMd
    [
        array aMdChildren := Array new int:1.
        aMdChildren@0 := List new.
        aMd setChildren children:aMdChildren.
        
        var paramList := theTables@mdtParam.
        int paramCount := ($self getBlobBytes int:(aMd signature))@1.
        
        int i := 0.
        while(i < paramCount)
        [
            var pt := paramList@((aMd paramList) + i - 1).
            aMd appendChildren children:pt int:0.
            pt setParentTable table:aMd. 
            i := i + 1.
        ].
    ]
    
    addRowToTable int:aRow int:aPos [ theTableRows@aPos := aRow. ]
    getRowsOfTable int:aPos [ ^theTableRows@aPos. ]
    addTable tablebase:aTableBase int:aPos [ (theTables@aPos) append:aTableBase. ]
    
    setStringsOffset int:aOffset [ theStringsOffset := aOffset. ]
    setUSOffset int:aOffset [ theUSOffset := aOffset. ]
    setGUIDOffset int:aOffset [ theGuidOffset := aOffset. ]
    setBlobOffset int:aOffset [ theBlobOffset := aOffset. ]
    
    strings = theStrings.
    guid = theGuid.
    blob = theBlob.
}