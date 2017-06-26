import system.
import system'collections.
import extensions.

class PEData
{
    bytearray theData.
    object theRva. // RVAManager
    object theIdxm. // IndexManager
    object thePe1. // PEFileHeader
    object thePe2. // PEHeaderStandardFields
    object thePe3. // PEHeaderWindowsNTSpecificFields
    object thePe4. // PEHeaderDataDirectories
    object theImportTables. // List
    object theSectionHeaders. // array
    object theCliHeader. // CLIHeader
    object theMetadataRoot. // MetadataRoot
    object theTilde. // StreamHeader
    object theSharpTilde. // SharpTildeStream
    object theStrings. // StreamHeader
    object theUsrstr. // StreamHeader
    object theGuid. // StreamHeader
    object theBlob. // StreamHeader
    
    setData bytearray:data
    [
        theData := data.
        $self readPEHeaders.
        $self readCLIHeader.
        if((theTilde == $nil) || (theSharpTilde == $nil)) [ ^$nil. ]. 
        theIdxm makeTree pedata:($self).
    ]
    
    readPEHeaders
    [
        int offset := Util getInt32 bytearray:theData int:3ch.

        offset := offset + 4.
        thePe1 := PEFileHeader new bytearray:theData int:offset.
        
        offset := offset + 20.
        thePe2 := PEHeaderStandardFields new bytearray:theData int:offset.
        thePe3 := PEHeaderWindowsNTSpecificFields new bytearray:theData int:offset.
        thePe4 := PEHeaderDataDirectories new bytearray:theData int:offset.
        
        offset := offset + 224.
        $self readSections int:offset.
        
        int addressImportTable := RVAManagerHelper getAddress long:(thePe4 importTable).
        ifnot(addressImportTable == 0)
        [
            theImportTables := List new.
            int address := theRva convertToPhysical int:addressImportTable.
            while((Util isZero bytearray:theData int:address int:20) == false)
            [
               theImportTables append:(ImportTable new bytearray:theData int:address).
               address := address + 20.
            ].
         ].
    ]
    
    readSections int:aOffset
    [
        int offset := aOffset.
        theRva := RVAManager new.
        int numOfSections := thePe1 numberOfSections.
        theSectionHeaders := Array new int:numOfSections.
        
        int i := 0.
        while(i < numOfSections)
        [
            theSectionHeaders@i := SectionHeaders new bytearray:theData int:offset.
            offset := offset + 40.
            theRva setAddress int:((theSectionHeaders@i) pointerToRawData) int:((theSectionHeaders@i) virtualAddress).
            i := i + 1.
        ].
    ]
    
    readCLIHeader
    [
        int addressCli := RVAManagerHelper getAddress long:(thePe4 cliHeader).
        (addressCli == 0)? [ ^$nil. ].
        
        theCliHeader := CLIHeader new bytearray:theData int:(theRva convertToPhysical int:addressCli).
        int offset := theRva convertToPhysical int:(RVAManagerHelper getAddress long:(theCliHeader metadata)).
        theMetadataRoot := MetadataRoot new bytearray:theData int:offset.
        offset := offset + theMetadataRoot length + 18.
        int numberOfStreams := Util getInt16 bytearray:theData int:offset.
        offset := offset + 2.
        theIdxm := IndexManager new bytearray:theData rvaManager:theRva.
        
        int i := 0.
        while(i < numberOfStreams)
        [
            var sh := StreamHeader new bytearray:theData int:offset.
            sh setMetadataRoot metadataroot:theMetadataRoot.
            int streamSize := sh getStreamSize.
            offset := offset + streamSize.
            $self setStreamHeader streamHeader:sh.
            i := i + 1.
        ].
        $self readTilde.
    ]
    
    setStreamHeader streamHeader:aSh
    [
      (aSh name) => "#~" [
                            theTilde := aSh.
                            theSharpTilde := SharpTildeStream new bytearray:theData int:((theMetadataRoot offset) + (aSh streamOffset)).
                         ];
              "#Strings" [
                            theStrings := aSh.
                            theIdxm setStringsOffset int:(aSh getDataOffset).
                         ];
                   "#US" [
                            theUsrstr := aSh.
                            theIdxm setUSOffset int:(aSh getDataOffset).
                         ];
                 "#GUID" [
                            theGuid := aSh.
                            theIdxm setGUIDOffset int:(aSh getDataOffset).
                         ];
                 "#Blob" [
                            theBlob := aSh.
                            theIdxm setBlobOffset int:(aSh getDataOffset).
                         ].
    ]
    
    readTilde
    [
        ifnot((theTilde == $nil) || (theSharpTilde == $nil))
        [
            theIdxm setHeapSizes byte:(theSharpTilde heapSizes).
            int address := (theSharpTilde getOffset) + 24.
            long sharpTildeValid := theSharpTilde valid.
            int i := 0.
            while(i < 63)
            [
                var tmp := 1l << i.
                var r := tmp && sharpTildeValid.
                
                if(r != 0l)
                [
                    int rows := Util getInt32 bytearray:theData int:address.
                    bool isDefined := MetadataTable isDefined int:i.
                    (isDefined) ?[ theIdxm addRowToTable int:rows int:i. ].
                    address := address + 4.
                ].
                i := i + 1.
            ].
            
            i := 0.
            while(i < 63)
            [
                int rows := theIdxm getRowsOfTable int:i.
                int j := 0.
                while(j < rows)
                [
                    var tblBase := theIdxm createTable metadatatables:i bytearray:theData int:address.
                    theIdxm addTable tablebase:tblBase int:i.
                    tblBase readData.
                    tblBase setIndex int:(j + 1).
                    address := address + (tblBase getSize).
                    j := j + 1.
                ].
                i := i + 1.
            ].
        ]
    ]
    
    data = theData.
    rva = theRva.
    indexManager = theIdxm.
    cliHeader = theCliHeader. 
}