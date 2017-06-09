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
    
    readData bytearray:data int:offset
    [
        
        thePointer := theOffset.
    ]
    
    getSize 
    [
        ^(thePointer - theOffset).
    ]
    
    readByte
    [
        byte ret := theData@thePointer.
        ^$nil.
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
    
    readStringIndex
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
    
    setIndexManager indexManager:aIdxManager
    [
        theIndexManager := aIdxManager.
    ] 
}