#import system.

class PEData
{
    bytearray theData.
    object(RVAManager) theRva.
    object(IndexManager) theIdxm.
    object(PEFileHeader) thePe1.
    object(PEHeaderStandardFields) thePe2.
    object(PEHeaderWindowsNTSpecificFields) thePe3.
    object(PEHeaderDataDirectories) thePe4.
    object(array) theImportTables.
    object(array) theSectionHeaders.
    
    setData &bytearray:data
    [
        theData := data.
        $self readPEHeaders.
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
            var sectionName := Util getASCIIString &long:((theSectionHeaders@i) name).
            i += 1.
        ].
    ]
}