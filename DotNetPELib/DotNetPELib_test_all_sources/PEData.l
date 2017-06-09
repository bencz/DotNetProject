#import system.
#import system'collections.
#import extensions.

class PEData
{
    bytearray theData.
    object(RVAManager) theRva.
    object(IndexManager) theIdxm.
    object(PEFileHeader) thePe1.
    object(PEHeaderStandardFields) thePe2.
    object(PEHeaderWindowsNTSpecificFields) thePe3.
    object(PEHeaderDataDirectories) thePe4.
    object(List) theImportTables.
    object(array) theSectionHeaders.
    object(CLIHeader) theCliHeader.
    object(MetadataRoot) theMetadataRoot.
    object(StreamHeader) theTilde.
    object(SharpTildeStream) theSharpTilde.
    object(StreamHeader) theStrings.
    object(StreamHeader) theUsrstr.
    object(StreamHeader) theGuid.
    object(StreamHeader) theBlob.
    
    setData &bytearray:data
    [
        theData := data.
        $self readPEHeaders.
        $self readCLIHeader.
    ]
    
    readPEHeaders
    [
        int offset := Util getInt32 &bytearray:theData &int:3ch.
        
        offset += 4.
        thePe1 := PEFileHeader new &bytearray:theData &int:offset.
        
        offset += 20.
        thePe2 := PEHeaderStandardFields new &bytearray:theData &int:offset.
        thePe3 := PEHeaderWindowsNTSpecificFields new &bytearray:theData &int:offset.
        thePe4 := PEHeaderDataDirectories new &bytearray:theData &int:offset.
        
        offset += 224.
        $self readSections &int:offset.
        
        int addressImportTable := RVAManagerHelper getAddress &long:(thePe4 importTable).
        (addressImportTable == 0)
        ![
            theImportTables := List new.
            int address := theRva convertToPhysical &int:addressImportTable.
            #loop(Util isZero &bytearray:theData &int:address &int:20)
            ![
                theImportTables += ImportTable new &bytearray:theData &int:address.
                address += 20.
             ].
         ].
    ]
    
    readSections &int:aOffset
    [
        int offset := aOffset.
        theRva := RVAManager new.
        int numOfSections := thePe1 numberOfSections.
        theSectionHeaders := Array new &int:numOfSections.
        
        int i := 0.
        #loop(i < numOfSections)?
        [
            theSectionHeaders@i := SectionHeaders new &bytearray:theData &int:offset.
            offset += 40.
            theRva setAddress &int:((theSectionHeaders@i) pointerToRawData) &int:((theSectionHeaders@i) virtualAddress).
            i += 1.
        ].
    ]
    
    readCLIHeader
    [
        int addressCli := RVAManagerHelper getAddress &long:(thePe4 cliHeader).
        (addressCli == 0)? [ ^$nil. ].
        
        theCliHeader := CLIHeader new &bytearray:theData &int:(theRva convertToPhysical &int:addressCli).
        int offset := theRva convertToPhysical &int:(RVAManagerHelper getAddress &long:(theCliHeader metadata)).
        theMetadataRoot := MetadataRoot new &bytearray:theData &int:offset.
        offset := offset + theMetadataRoot length + 18.
        int numberOfStreams := Util getInt16 &bytearray:theData &int:offset.
        offset += 2.
        theIdxm := IndexManager new &bytearray:theData &rvaManager:theRva.
        
        int i := 0.
        #loop(i < numberOfStreams)?
        [
            var sh := StreamHeader new &bytearray:theData &int:offset.
            sh setMetadataRoot &metadataroot:theMetadataRoot.
            int streamSize := sh getStreamSize.
            offset += streamSize.
            $self setStreamHeader &streamHeader:sh.
            i += 1.
        ].
        $self readTilde.
    ]
    
    setStreamHeader &streamHeader:aSh
    [
        aSh name => "#~" [
                            theTilde := aSh.
                            theSharpTilde := SharpTildeStream new &bytearray:theData &int:((theMetadataRoot offset) + aSh streamOffset).
                         ];
              "#Strings" [
                            theStrings := aSh.
                            theIdxm setStringsOffset &int:(aSh streamOffset).
                         ];
                   "#US" [
                            theUsrstr := aSh.
                            theIdxm setUSOffset &int:(aSh streamOffset).
                         ];
                 "#GUID" [
                            theGuid := aSh.
                            theIdxm setGUIDOffset &int:(aSh streamOffset).
                         ];
                 "#Blob" [
                            theBlob := aSh.
                            theIdxm setBlobOffset &int:(aSh streamOffset).
                         ].
    ]
    
    readTilde
    [
        ((theTilde == $nil) || (theSharpTilde == $nil))!
        [
            theIdxm setHeapSizes &byte:(theSharpTilde heapSizes).
            int address := (theSharpTilde getOffset) + 24.
            int i := 0.
            #loop(i < 63)?
            [
                var tx := (1l << i).
                console writeLine:tx:" -- ":i.
                    
                (((theSharpTilde valid) && (1l << i)) == 0)!
                [
                    int rows := Util getInt32 &bytearray:theData &int:address.
                    bool isDefined := MetadataTables isDefined &int:i.
                    (isDefined) ?[ theIdxm addRowToTable &int:rows &int:i. ].
                    address += 4.
                ].
                i += 1.
            ].
            
            i := 0.
            #loop(i < 63)?
            [
                int rows := theIdxm getRowsOfTable &int:i.
                int j := 0.
                #loop(j < rows)?
                [
                    var tblBase := theIdxm createTable &metadatatables:i.
                    theIdxm addTable &tablebase:tblBase &int:i.
                    tblBase readData &bytearray:theData &int:address.
                ].
                i += 1.
            ].
        ]
    ]
}