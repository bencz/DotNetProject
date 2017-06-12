import system.
import system'text.
import system'collections.

extension Util
{
    getByte bytearray:data int:offset
    [
        ^(data@offset).
    ]
    
    getInt16 bytearray:data int:offset
    [
        ^ $self getByteArray bytearray:data int:offset int:16.
//        int b0 := data@offset.
//        int b1 := data@(offset + 1).
//        ^((b0 + (b1 shift int:-8)) toShort).
    ]
    
    getInt24 bytearray:data int:offset
    [
        ^ $self getByteArray bytearray:data int:offset int:24.
//        int b0 := data@offset.
//        int b1 := data@(offset + 1).
//        int b2 := data@(offset + 2).
//        ^(b0 + (b1 shift int:-8) + (b2 shift int:-16)).
    ]
    
    getInt32 bytearray:data int:offset
    [
//       ^ $self getByteArray bytearray:data int:offset int:32.
        int b0 := data@offset.
        int b1 := data@(offset + 1).
        int b2 := data@(offset + 2).
        int b3 := data@(offset + 3).
        ^((b0) + (b1 << 8) + (b2 << 16) + (b3 << 24)).
    ]
    
    getInt64 bytearray:data int:offset
    [
        ^ $self getByteArray bytearray:data int:offset int:64.
    ]
    
    getBytes bytearray:data int:offset 
    [
        int aSize := 0.
        while((data@(offset + aSize)) != 0) [ aSize := aSize + 1. ].
        ^ $self getBytes bytearray:data int:offset int:aSize.
    ]
    
    getBytes bytearray:data int:offset int:size
    [
        ^ByteArray new int:offset int:size bytearray:data.
    ]
    
    getASCIIString long:value
    [
        bytearray aBuffer := ByteArray new:8.
        byteArrayHelper write bytearray:aBuffer int:0 long:value.
        ^ UTF8Encoder toLiteral int:0 int:8 bytearray:aBuffer. // Change to use "literal" insented of "UTF8"
    ]
    
    isZero bytearray:data int:aOffset int:size
    [
        int offset := aOffset.
        int i := 0.
        while(i < size)
        [
            (data@(offset + i) != 0) ? [ ^false. ].
            i := i + 1.
        ].
        ^true.
    ]
    
    pad int:n
    [
        int a := n && 3.
        ^(a == 0)iif:(n):(n + 4 - a).
//        (a == 0) 
//            ? [ ^n. ]
//            ! [ ^(n + 4 - a). ].
    ]
    
    getDataSize bytearray:data int:offset
    [
        var ret := DoubleInt new.
        byte b0 := data@offset.
        
        if((b0 && 0e0h) == 0c0h)
        [
            ret setA int:4.
            ret setB int:(((b0 && 01fh) << 24) + (data@(offset + 1) << 16) + (data@(offset + 2) << 8) + (data@(offset + 3))).
            ^ret.
        ].
        if((b0 && 0c0h) == 80h)
        [
            ret setA int:2.
            ret setB int:(((b0 && 3fh) << 8) + (data@(offset + 1))).
            ^ret.
        ].
        
        ret setA int:1.
        ret setB int:b0.
        ^ret.
    ]
    
    // ---------------------------------------------------------
    // Internal usage class method
    // ---------------------------------------------------------
    getByteArray bytearray:data int:offset int:aDataSize
    [
        int size := aDataSize / 2.
        bytearray aBuffer := ByteArray new int:size.
        
        int i := size / 4.
        while(i >= 0)
        [            
            byte val := data@(offset + i).
            aBuffer@i := val.
            i := i - 1.
        ].
        
        aDataSize => 64 [
                            long aRetValue := 0.
                            byteArrayHelper read bytearray:aBuffer int:0 vlong:aRetValue.
                            ^aRetValue.
                        ];
                     32 [
                            int aRetValue := 0.
                            byteArrayHelper read bytearray:aBuffer int:0 vint:aRetValue.
                            ^aRetValue.                                                     
                        ];
                     24 [
                            int aRetValue := 0.
                            byteArrayHelper read bytearray:aBuffer int:0 vint:aRetValue.
                            ^aRetValue.   
                        ];
                     16 [
                            short aRetValue := 0.
                            byteArrayHelper read bytearray:aBuffer int:0 vshort:aRetValue.
                            ^aRetValue.   
                        ].   
    ]
}