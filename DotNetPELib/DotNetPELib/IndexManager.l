#import system.
#import system'collections.

class IndexManager
{
    object(RVAManager) rva.
    bytearray data. 
    bool strings.
    int stringsOffset.
    int uSOffset.
    bool guid.
    int guidOffset.
    bool blob.
    int blobOffset.
    object(List) tables.
    intarray tableRows.
    
    constructor new &bytearray:content &rvaManager:rvaMng
    [
        rva := rvaMng.
        data := content.
        
        strings := false.
        guid := false.
        blob := false.
        
        stringsOffset := 0.
        uSOffset := 0.
        guidOffset := 0.
        blobOffset := 0.
        
        tables := Array new &int:64.
        tableRows := IntArray new &int:64.
        
        int i := 0.
        #loop(i < 64)?
        [
            tables@i := List new.
            tableRows@i := 0.
            i += 1.
        ].
    ]
}