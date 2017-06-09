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
    object theTables.
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
    
    createTable metadatatables:aTable
    [
        var ret := MetadataTableCreator create; metadatatables:aTable.
        ret setIndexManager; indexManager:($self).
        ^ ret.
    ]
    
    getStringsString int:aOffset
    [
        var bytes := Util getBytes bytearray:theData int:(theStringsOffset + aOffset).
        
    ]
    
    addRowToTable int:aRow int:aPos [ theTableRows@aPos := aRow. ]
    getRowsOfTable int:aPos [ ^theTableRows@aPos. ]
    
    addTable tablebase:aTableBase int:aPos [ theTables@aPos := aTableBase. ]
    
    setStringsOffset int:aOffset [ theStringsOffset := aOffset. ]
    setUSOffset int:aOffset [ theUSOffset := aOffset. ]
    setGUIDOffset int:aOffset [ theGuidOffset := aOffset. ]
    setBlobOffset int:aOffset [ theBlobOffset := aOffset. ]
    
    strings = theStrings.
    guid = theGuid.
    blob = theBlob.
}