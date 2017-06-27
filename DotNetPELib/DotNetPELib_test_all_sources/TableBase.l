import system.

class TableBase :: HeaderBase
{
    int thePointer.
    int theIndex.
    //literal theName.
    object theParentTable.
    object theChildren.
    object theTag.
    object theIndexManager.
    
    readTData bytearray:data int:offset
    [
        $self readData bytearray:data int:offset.
        thePointer := theOffset.
    ]
    
    getSize 
    [
        ^(thePointer - theOffset).
    ]
    
    readByte
    [
        byte ret := theData@thePointer.
        thePointer := thePointer + 1.
        ^ret.
    ]
    
    readInt16
    [
        short ret := Util getInt16 bytearray:theData int:thePointer.
        thePointer := thePointer + 2.
        ^ ret.
    ]
    
    readInt32
    [
        int ret := Util getInt32 bytearray:theData int:thePointer.
        thePointer := thePointer + 4.
        ^ ret.
    ]
    
    readStringsIndex
    [
        (theIndexManager strings == true)
            ? [ ^$self readInt32. ]
            ! [ ^$self readInt16. ].
    ]
    
    readGuidIndex
    [
        (theIndexManager guid == true)
            ? [ ^$self readInt32. ]
            ! [ ^$self readInt16. ].
    ]
    
    readBlobIndex
    [
        (theIndexManager blob == true)
            ? [ ^$self readInt32. ]
            ! [ ^$self readInt16. ].
    ]
    
    readIndex metadatatables:aTable
    [
        ((theIndexManager isInt32 metadatatables:aTable) == true)
            ? [ ^$self readInt32. ]
            ! [ ^$self readInt16. ].
    ]
    
    readIndex codedIndices:aTable
    [
        ((theIndexManager isInt32 codedIndices:aTable) == true)
            ? [ ^$self readInt32. ]
            ! [ ^$self readInt16. ].
    ]
    
    setIndexManager indexManager:aIdxManager
    [
        theIndexManager := aIdxManager.
    ] 
    indexManager = theIndexManager.
    
    
    setIndex int:aIndex [ theIndex := aIndex. ]
    
    setChildren children:aChild [ theChildren := aChild. ]
    getChildren int:aAt [ ^ theChildren@aAt. ]
    getChildren int:aAt int:aSAt [ ^ theChildren@aAt@aSAt. ]
    children = theChildren.
    appendChildren children:aChild int:aAt [ (theChildren@aAt) append:aChild. ]
    
    setParentTable table:aTypeDefTable [ theParentTable := aTypeDefTable. ]
    getParentTable = theParentTable.
    
    setTag tag:aTag [ theTag := aTag. ]
    getTag = theTag.
    
    pointer = thePointer.
}