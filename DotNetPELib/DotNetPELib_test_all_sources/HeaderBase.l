import system.

class HeaderBase
{
    int theOffset.
    bytearray theData.
    
    constructor new bytearray:data int:offset
    [
        theData := data.
        theOffset := offset.
    ]
    
    readData bytearray:data int:offset
    [
        theData := data.
        theOffset := offset.
    ]
    
    readByte int:offset
    [
        ^ theData@(theOffset + offset).
    ]
    
    readInt16 int:offset
    [
        ^ Util getInt16 bytearray:theData int:(theOffset + offset). 
    ] 
    
    readInt32 int:offset
    [
        ^ Util getInt32 bytearray:theData int:(theOffset + offset). 
    ] 
    
    readInt64 int:offset
    [
        ^ Util getInt64 bytearray:theData int:(theOffset + offset). 
    ] 
    
    readBytes int:offset int:size
    [
        ^ Util getBytes bytearray:theData int:(theOffset + offset) int:size.
    ]
    
    offset = theOffset.
}