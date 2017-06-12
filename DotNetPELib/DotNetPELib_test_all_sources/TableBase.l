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
        //^(theIndexManager strings)iif:($self readInt32):($self readInt16).
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
        ^(theIndexManager isInt32 metadatatables:aTable)iif:($self readInt32):($self readInt16).
    ]
    
    setIndexManager indexManager:aIdxManager
    [
        theIndexManager := aIdxManager.
    ] 
    
    setIndex int:aIndex [ theIndex := aIndex. ]
}