#import system.
#import system'text.
#import system'collections.

extension Util
{
    getByte &bytearray:data &int:offset
    [
        ^(data@offset).
    ]
    
    getInt16 &bytearray:data &int:offset
    [
        ^ $self getByteArray &bytearray:data &int:offset &int:16.
//        int b0 := data@offset.
//        int b1 := data@(offset + 1).
//        ^((b0 + (b1 shift &int:-8)) toShort).
    ]
    
    getInt24 &bytearray:data &int:offset
    [
        ^ $self getByteArray &bytearray:data &int:offset &int:24.
//        int b0 := data@offset.
//        int b1 := data@(offset + 1).
//        int b2 := data@(offset + 2).
//        ^(b0 + (b1 shift &int:-8) + (b2 shift &int:-16)).
    ]
    
    getInt32 &bytearray:data &int:offset
    [
//       ^ $self getByteArray &bytearray:data &int:offset &int:32.
        int b0 := data@offset.
        int b1 := data@(offset + 1).
        int b2 := data@(offset + 2).
        int b3 := data@(offset + 3).
        ^(b0 + (b1 shift &int:-8) + (b2 shift &int:-16) + (b3 shift &int:-24)).
    ]
    
    getInt64 &bytearray:data &int:offset
    [
        ^ $self getByteArray &bytearray:data &int:offset &int:64.
        
//        int b0 := data@offset.         // 0xd8
//        int b1 := data@(offset + 1).   // 0x29
//        int b2 := data@(offset + 2).   // 0x00
//        int b3 := data@(offset + 3).   // 0x00
//        int b4 := data@(offset + 4).   // 0x4f
//        int b5 := data@(offset + 5).   // 0x00
//        int b6 := data@(offset + 6).   // 0x00
//        int b7 := data@(offset + 7).   // 0x00
//        
//        var x1 := (b1 shift &int: -8).  // expected: 0x0000000000002900 -> result: 0x1480
//        var x2 := (b2 shift &int:-16).  // expected: 0x0000000000000000 -> result: 0x0000
//        var x3 := (b3 shift &int:-24).  // expected: 0x0000000000000000 -> result: 0x0000
//        var x4 := (b4 shift &int:-32).  // expected: 0x0000004f00000000 -> result: 0x80000000
//        var x5 := (b5 shift &int:-40).  // expected: 0x0000000000000000 -> result: 0x0000
//        var x6 := (b6 shift &int:-48).  // expected: 0x0000000000000000 -> result: 0x0000
//        var x7 := (b7 shift &int:-56).  // expected: 0x0000000000000000 -> result: 0x0000
//        
//        bytearray aBuffer := ByteArray new &int:16.
//        byteArrayHelper write &bytearray:aBuffer &int:0 &int:(b0 + x1).
//        byteArrayHelper write &bytearray:aBuffer &int:2 &int:(x2 + x3).
//        byteArrayHelper write &bytearray:aBuffer &int:4 &int:(x4 + x5).
//        byteArrayHelper write &bytearray:aBuffer &int:6 &int:(x6 + x7).
//        
//        long result := 0.
//        byteArrayHelper read &bytearray:aBuffer &int:0 &vlong:result.
//        
//        ^result.
        
        // expected return: 0x0000004f000029d8
        //^(b0 + (b1 shift &int:-8) + (b2 shift &int:-16) + (b3 shift &int:-24) + 
        //       (b4 shift &int:-32) + (b5 shift &int:-40) + (b6 shift &int:-48) + (b7 shift &int:-56)).
    ]
    
    getBytes &bytearray:data &int:offset 
    [
        int aSize := 0.
        #loop((data@(offset + aSize)) != 0) ?[ aSize += 1. ].
        ^ $self getBytes &bytearray:data &int:offset &int:aSize.
    ]
    
    getBytes &bytearray:data &int:offset &int:size
    [
        ^ByteArray new &int:offset &int:size &bytearray:data.
    ]
    
    getASCIIString &long:value
    [
        bytearray aBuffer := ByteArray new:8.
        byteArrayHelper write &bytearray:aBuffer &int:0 &long:value.
        //^ LiteralValue $new &int:0 &int:8 &bytearray:aBuffer.
        ^ UTF8Encoder toLiteral &int:0 &int:8 &bytearray:aBuffer. // Change to use "literal" insented of "UTF8"
    ]
    
    // ---------------------------------------------------------
    // Internal usage class method
    // ---------------------------------------------------------
    getByteArray &bytearray:data &int:offset &int:aDataSize
    [
        int size := aDataSize / 2.
        bytearray aBuffer := ByteArray new &int:size.
        
        int i := size / 4.
        #loop(i >= 0)?
        [            
            byte val := data@(offset + i).
            aBuffer@i := val.
            i -= 1.
        ].
        
        
        
//        int aSize := dataSize / 2.
//        bytearray aBuffer := ByteArray new &int:aSize.
//        list aList := List new.    
//        
//        int i := 0.
//        int aLoopMax := aSize / 4.
//        #loop(i < aSize / 4)?
//        [
//            aList += (data@(offset + i) << (8 * i)).
//            i += 1.
//        ].
//        
//        i := 0.
//        #loop(i < aList length)?
//        [
//            byteArrayHelper write &bytearray:aBuffer &int:i &int:((aList@i) + (aList@(i+1))).
//            i += 2.
//        ].
//        
        aDataSize => 64 [
                            long aRetValue := 0.
                            byteArrayHelper read &bytearray:aBuffer &int:0 &vlong:aRetValue.
                            ^aRetValue.
                        ];
                     32 [
                            int aRetValue := 0.
                            byteArrayHelper read &bytearray:aBuffer &int:0 &vint:aRetValue.
                            ^aRetValue.                                                     
                        ];
                     24 [
                            int aRetValue := 0.
                            byteArrayHelper read &bytearray:aBuffer &int:0 &vint:aRetValue.
                            ^aRetValue.   
                        ];
                     16 [
                            short aRetValue := 0.
                            byteArrayHelper read &bytearray:aBuffer &int:0 &vshort:aRetValue.
                            ^aRetValue.   
                        ].   
    ]
}