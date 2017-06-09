#import system.
#import system'io.
#import system'text.
#import system'routines.
#import system'collections.
#import extensions.
#import extensions'routines.

#import dotnetpelib.

testUtilClass =
[
    var br := BinaryFileReader new &path:"..\TestExecutables\Test1.exe".
    int exeSize := br stream length.
    var exeBytes := ByteArray new:exeSize.
    br read &bytearray:exeBytes &int:exeSize.
    br close.
    
    var a1 := Util getInt16 &bytearray:exeBytes &int:3ch. // 0x80
    var a2 := Util getInt16 &bytearray:exeBytes &int:84h. // 0x14C
    
    var b1 := Util getInt32 &bytearray:exeBytes &int:9ch. // 0xC00

    var c1 := Util getInt64 &bytearray:exeBytes &int:100h. // 0x0000004f000029d8
    var c2 := Util getInt64 &bytearray:exeBytes &int:108h. // 0x0000058c00004000
    var c3 := Util getInt64 &bytearray:exeBytes &int:128h. // 0x0000001c000028a0
    var c4 := Util getInt64 &bytearray:exeBytes &int:168h. // 0x0000004800002008
    var c5 := Util getInt64 &bytearray:exeBytes &int:178h. // expected -> 0x000000747865742e
    
    var d1 := Util getBytes &bytearray:exeBytes &int:0c1ah.
    var d1_text := UTF8Encoding toLiteral &int:0 &int:(d1 length) &bytearray:d1. // mscoree.dll 
    
    var d2 := Util getBytes &bytearray:exeBytes &int:07f9h.
    var d2_text := UTF8Encoding toLiteral &int:0 &int:(d1 length) &bytearray:d2. // Test1.exe
    
    var e1 := Util getASCIIString &long:500236121134l.
].

testPeFileHeader =
[
    var br := BinaryFileReader new &path:"..\TestExecutables\Test1.exe".
    int exeSize := br stream length.
    var exeBytes := ByteArray new:exeSize.
    br read &bytearray:exeBytes &int:exeSize.
    br close.
    
    var pe1 := PEFileHeader new &bytearray:exeBytes &int:84h.
].

program =
[    
    //testUtilClass eval.
    //testPeFileHeader eval.
    
    var br := BinaryFileReader new &path:"..\TestExecutables\Test1.exe".
    int exeSize := br stream length.
    var exeBytes := ByteArray new:exeSize.
    br read &bytearray:exeBytes &int:exeSize.
    br close.

    var peData := PEData new.
    peData setData &bytearray:exeBytes.
].