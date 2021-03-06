import system.
import system'text.

class StreamHeader :: HeaderBase
{
    int theStreamOffset.
    int theSize.
    literal theName.
    object theMetadataRoot.
    
    constructor new bytearray:data int:offset
        <= new bytearray:data int:offset;
    [
        $self readData.
    ]
    
    readData
    [
        theStreamOffset := $self readInt32 int:0.
        theSize := $self readInt32 int:4.
        
        var bytesName := Util getBytes bytearray:(theData) int:(theOffset + 8).
        theName := UTF8Encoder toLiteral int:0 int:(bytesName length) bytearray:bytesName.
    ]
    
    getStreamSize
    [
        int pd := Util pad int:(theName length + 1).
        ^(8 + pd).
    ]
    
    getDataOffset
    [
        ^((theMetadataRoot offset) + theStreamOffset).
    ]
    
    getDataSize int:aOffset
    [
        ^(Util getDataSize bytearray:theData int:aOffset).
    ]
        
    setMetadataRoot metadataroot:aMetadataroot [ theMetadataRoot := aMetadataroot. ]

    name = theName.
    size = theSize.
    streamOffset = theStreamOffset.
}