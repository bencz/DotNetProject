import system.
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
        ^ Util getBytes bytearray:theData int:((dataSize getA) + address) int:(dataSize getB).        
    ]
    
    isInt32 metadatatables:aMdt [ ^((theTableRows@aMdt) > ShortNumber max). ]
    
    isInt32 codedIndices:aCodIdc 
    [
        int max := 0.
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
        var listType := (theTables@mdTtypeDef).
        var size := listType length. 
        
        int i := 0.
        while(i < size)
        [
            var t2 := ((i + 1) < size)iif:(listType@(i + 1)):$nil.
            $self makeTree typeDefTbl:(listType@i) typeDefTbl:t2.
            i := i + 1.
        ].
    ]
    
    makeTree typeDefTbl:aT1 typeDefTbl:aT2
    [
        int i := 0.
        array aT1Children := Array new int:3.
        while(i < 3) [ aT1Children@i := List new. i := i + 1.].
        
        aT1 setChildren children:aT1Children.
        
        var listField := (theTables@mdTfield).
        var listMethod := (theTables@mdTmethodDef).
        int f1 := aT1 fieldList.
        int f2 := (aT2 != $nil)iif:(aT2 fieldList):((listField length) + 1).
        
        i := f1.
        console writeLine:f1.
    ]
    
    makeTree methodDefTbl:aMd
    [
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