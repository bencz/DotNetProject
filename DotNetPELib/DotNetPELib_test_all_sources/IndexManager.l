import system.
import system'text.
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
        ^UTF8Encoding toLiteral int:0 int:(bytes length) bytearray:bytes
        
    ]
    
    getUSString int:aOffset
    [
        int address := theUSOffset + aOffset.
        var dataSize := Util getDataSize bytearray:theData int:address.
        byte bytes := Util getBytes bytearray:theData int:((dataSize getA) + address) int:(dataSize getB).
        // FIX THIS... THIS NOT WORK....
        ^Encoder toLiteral int:0 int:(bytes length) bytearray:bytes // return a unicode string ???
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
        int tagSize := $self getTagSize codedIndices:aCdIdc.
        ^(aValue >> tagSize).
    ]
    
    getIndexType codedIndices:aCdIdc int:aValue
    [
        int size := $self getTagSize codedIndices:aCdIdc.
        int v := (aValue >> size) << size.
        var tbl := codedIndexMetaDataTables eval.
        ^(tbl@aCdIdc@(aValue - v)).
    ]
    
    isInt32 metadatatables:aMdt [ ^((theTableRows@aMdt) > ShortNumber max). ]
    
    isInt32 codedIndices:aCodIdc 
    [
        int max := 0.
        var tbl := (codedIndexMetaDataTables eval)@aCodIdc.
//        (tbl@aCodIdc) run each:(:obj)
//        [
//            int tblSize := theTableRows@obj.
//            if(max < tblSize) [ self max := tblSize. ].
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
        
        int i := 0.
        while(i < size)
        [
            var t2 := $nil.
            if((i + 1) < size) [ t2 := listType@(i + 1). ].
            
            $self makeTree typeDefTbl:(listType@i) typeDefTbl:t2.
            i := i + 1.
        ].
        
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
            obj setTag tag:(MethodData new pedata:aPeData table:obj).
        ].
        
        (theTables@mdtMemberRef) run each:(:obj) 
        [
            var md := MethodData new pedata:aPeData table:obj.
            obj setTag tag:md.
            if(obj _class != 0)
            [
                var tokenTable := $self getToken codedIndices:cdIdcMemberRefParent int:(obj _class).
                var tableToken := $self getTable int:tokenTable.
                obj setParentTable table:tableToken.
                if(md isField)
                [
                    (obj getParentTable) appendChildren children:obj int:(Children RefField).
                ];
                [
                    var pt := obj getParentTable. 
                    pt appendChildren children:obj int:(Children RefMethod).
                ].
            ].
        ].
        
        (theTables@mdtImplMap) run each:(:obj)
        [
            var token := $self getToken codedIndices:cdIdcMemberForwarded int:(obj memberForwarded).
            var methodDefTbl := $self getTable int:token.
            if($nil != methodDefTbl)
            [
                methodDefTbl setImplMap implMap:obj.
            ].
        ].
        
        (theTables@mdtNestedClass) run each:(:obj)
        [
            var nst := listType@((obj nestedClass) - 1). // TypeDefTable
            var enc := listType@((obj enclosingClass) - 1). // TypeDefTable
            nst setParentTable table:enc.
            enc appendChildren children:nst int:(Children DefNested).
        ].
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
        if(nil != aT2) [ f2 := aT2 fieldList. ].
        
        i := f1.
        while(i < f2)
        [
            var ft := listField@(i - 1).
            aT1 appendChildren children:ft int:(Children DefField).
            ft setParentTable table:aT1.
            i := i + 1.
        ].
        
        int method1 := aT1 methodList.
        int method2 := (listMethod length) + 1.
        if(nil != aT2) [ method2 := aT2 methodList. ].
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
    
    readType int:aOffset
    [
        var ret := TypeData new.
        ret setSize int:1.
        ret setToken int:0.
        var elType := ELEMENT_TYPE new.
        ret setElement int:(elType END).
        ret setOption int:(elType END).
        int b := theData@aOffset.
        if((elType isDefined int:b) == false) [ ^ret. ].
        
        if((elType SZARRAY) == b)
        [
            ret := $self readType int:(aOffset + 1).
            ret setSize int:((ret size) + 1).
            ret setOption int:b.
            ^ret.
        ].
        if(((elType VALUETYPE) == b) || ((elType CLASS) == b))
        [
            var dblInt := Util getDataSize bytearray:theData int:(aOffset + 1).
            ret setToken int:($self getToken codedIndices:cdIdcTypeDefOrRef int:(dblInt B)).
            ret setSize int:(1 + (dblInt A)).
            ^ret.
        ].
        
        ret setElement int:b.
        ^ret.
        
    ]
    
    getName typeDefTable:aDefTable
    [
        var rt := $self getStringsString int:(aDefTable name).
        var parentTable := aDefTable getParentTable.
        
        if($nil != parentTable)
        [
            if((parentTable class_ref) == TypeDefTable)
            [
                ^(($self getName typeDefTable:parentTable) + "." + rt).
            ].
        ].
        
        if((aDefTable namespace) != 0)
        [
            rt := $self getStringsString int:(aDefTable namespace) + "." + rt.
        ].
        ^rt.
    ]
    
    getName typeRefTable:aRegTable
    [
        var rt := $self getStringsString int:(aRegTable name).
        var tbl := aRegTable getParentTable.
        if((tbl class_ref) == TypeRefTable)
        [
            ^(($self getName typeRefTable:tbl) + "." + rt).
        ].
        if((aRegTable namespace) != 0)
        [
            rt := ($self getStringsString int:(aRegTable namespace)) + "." + rt.
        ].
        if((tbl class_ref) == AssemblyRefTable)
        [
            var asm := $self getStringsString int:(tbl name).
            ^("[" + asm + "]" + rt).
        ].
        ^rt.
    ]
    
    getName typeData:aTypeData
    [
        textbuffer rt := TextBuilder new.
        rt append:"???".
        if((aTypeData token) == 0)
        [
            rt clear.
            rt append:($self getName elementType:(aTypeData element)).
        ];
        [
            rt clear.
            
            var tbl := $self getTable int:(aTypeData token).
            if((tbl class_ref) == TypeDefTable)
            [
                rt append:($self getName typeDefTable:tbl).
            ].
            if((tbl class_ref) == TypeRefTable)
            [
                rt append:($self getName typeRefTable:tbl).
            ].
        ].
        var tmp := ELEMENT_TYPE new.
        if((aTypeData option) == (tmp SZARRAY)) [ rt append:"[]". ].
        ^(rt literal).
    ]
    
    getName elementType:aElementType
    [
        var tmp := ELEMENT_TYPE new.
        ^tmp getName int:aElementType.
    ]
    
    getName methodDefTable:aTable
    [
        var rt := $self getStringsString int:(aTable name).
        if($nil == (aTable getParentTable)) [ ^rt. ].
        ^(($self getName typeDefTable:(aTable getParentTable)) + "::" + rt).
    ]
    
    getName memberRefTable:aTable
    [
        var rt := $self getStringsString int:(aTable name).
        if($nil == (aTable getParentTable)) [ ^rt. ].
        ^(($self getName typeRefTable:(aTable getParentTable)) + "::" + rt).
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
    
    blobOffset = theBlobOffset.
    
    tables = theTables.
}