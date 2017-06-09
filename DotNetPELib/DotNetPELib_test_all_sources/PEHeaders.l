#import system.
#import system'text.

// -----------------------------------------------------------------
// Immediately after the PE signature is the PE File header
// consisting of the following:
// -----------------------------------------------------------------
class PEFileHeader :: HeaderBase
{
    short theMachine. // Always 0x14c (see Section 23.1).
    short theNumberOfSections. // Number of sections; indicates size of the Section Table, which immediately follows the headers.
    int theTimeDateStamp. // Time and date the file was created in seconds since January - 1st 1970 00:00:00 or 0.
    int thePointerToSymbolTable. // Always 0 (see Section 23.1).
    int theNumberOfSymbols. // Always 0 (see Section 23.1).
    short theOptionalHeaderSize. // Size of the optional header, the format is described below.
    short theCharacteristics. // Flags indicating attributes of the file, see Characteristics
    
    constructor new &bytearray:data &int:offset
        <= new &bytearray:data &int:offset;
    [
        $self readData.
    ]
        
    readData
    [
        theMachine := $self readInt16 &int:0.
        theNumberOfSections := $self readInt16 &int:2.
        theTimeDateStamp := $self readInt32 &int:4.
        thePointerToSymbolTable := $self readInt32 &int:8.
        theNumberOfSymbols := $self readInt32 &int:12.
        theOptionalHeaderSize := $self readInt16 &int:16.
        theCharacteristics := $self readInt16 &int:18.
    ]
    
    numberOfSections = theNumberOfSections.
}

// -----------------------------------------------------------------
// Immediately after the PE Header is the PE Optional Header.
// This header contains the following information:
// -----------------------------------------------------------------
class PEHeaderStandardFields :: HeaderBase
{
    short theMagic. // Always 0x10B (see Section 23.1).
    byte theLMajor. // Always 6 (see Section 23.1).
    byte theLMinor. // Always 0 (see Section 23.1).

    // Size of the code (text) section, or the sum of all code
    // sections if there are multiple sections.
    int theCodeSize.

    // Size of the initialized data section, or the sum of all such
    // sections if there are multiple data sections.
    int theInitializedDataSize.

    // Size of the uninitialized data section, or the sum of all
    // such sections if there are multiple unitinitalized data
    // sections.
    int theUninitializedDataSize.

    // RVA of entry point , needs to point to bytes 0xFF 0x25
    // followed by the RVA in a section marked execute/read for
    // EXEs or 0 for DLLs
    int theEntryPointRVA.
    
    int theBaseOfCode. // RVA of the code section, always 0x00400000 for exes and 0x10000000 for DLL.
    int theBaseOfData. // RVA of the data section.
    
    constructor new &bytearray:data &int:offset
        <= new &bytearray:data &int:offset;
    [
        $self readData.
    ]
        
    readData
    [
        theMagic := $self readInt16 &int:0.
        theLMajor := $self readByte &int:2.
        theLMinor := $self readByte &int:3.
        theCodeSize := $self readInt32 &int:4.
        theInitializedDataSize := $self readInt32 &int:8.
        theUninitializedDataSize := $self readInt32 &int:12.
        theEntryPointRVA := $self readInt32 &int:16.
        theBaseOfCode := $self readInt32 &int:20.
        theBaseOfData := $self readInt32 &int:24.
    ]
}

// -----------------------------------------------------------------
// These fields are Windows NT specific:
// -----------------------------------------------------------------
class PEHeaderWindowsNTSpecificFields :: HeaderBase
{
    int theImageBase. // Always 0x400000 (see Section 23.1).
    int theSectionAlignment. // Always 0x2000 (see Section 23.1).
    int theFileAlignment. // Either 0x200 or 0x1000.
    short theOSMajor. // Always 4 (see Section 23.1).
    short theOSMinor. // Always 0 (see Section 23.1).
    short theUserMajor. // Always 0 (see Section 23.1).
    short theUserMinor. // Always 0 (see Section 23.1).
    short theSubSysMajor. // Always 4 (see Section 23.1).
    short theSubSysMinor. // Always 0 (see Section 23.1).
    int theReserved. // Always 0 (see Section 23.1).
    
    // Size, in bytes, of image, including all headers and padding;
    // shall be a multiple of Section Alignment.
    int theImageSize.

    // Combined size of MS-DOS Header, PE Header, PE Optional
    // Header and padding; shall be a multiple of the file
    // alignment.
    int theHeaderSize.
    
    int theFileChecksum. // Always 0 (see Section 23.1).
    
    // Subsystem required to run this image. Shall be either
    // IMAGE_SUBSYSTEM_WINDOWS_CE_GUI (0x3) or
    // IMAGE_SUBSYSTEM_WINDOWS_GUI (0x2).
    short theSubSystem.
    
    short theDLLFlags. // Always 0 (see Section 23.1).
    int theStackReserveSize. // Always 0x100000 (1Mb) (see Section 23.1).
    int theStackCommitSize. // Always 0x1000 (4Kb) (see Section 23.1).
    int theHeapReserveSize. // Always 0x100000 (1Mb) (see Section 23.1).
    int theHeapCommitSize. // Always 0x1000 (4Kb) (see Section 23.1).
    int theLoaderFlags. // Always 0 (see Section 23.1)
    int theNumberOfDataDirectories. // Always 0x10 (see Section 23.1).
    
    constructor new &bytearray:data &int:offset
        <= new &bytearray:data &int:offset;
    [
        $self readData.
    ]
        
    readData
    [
        theImageBase := $self readInt32 &int:28.
        theSectionAlignment := $self readInt32 &int:32.
        theFileAlignment := $self readInt32 &int:36.
        theOSMajor := $self readInt16 &int:40.
        theOSMinor := $self readInt16 &int:42.
        theUserMajor := $self readInt16 &int:44.
        theUserMinor := $self readInt16 &int:46.
        theSubSysMajor := $self readInt16 &int:48.
        theSubSysMinor := $self readInt16 &int:50.
        theReserved := $self readInt32 &int:52.
        theImageSize := $self readInt32 &int:56.
        theHeaderSize := $self readInt32 &int:60.
        theFileChecksum := $self readInt32 &int:64.
        theSubSystem := $self readInt16 &int:68.
        theDLLFlags := $self readInt16 &int:70.
        theStackReserveSize := $self readInt32 &int:72.
        theStackCommitSize := $self readInt32 &int:76.
        theHeapReserveSize := $self readInt32 &int:80.
        theHeapCommitSize := $self readInt32 &int:84.
        theLoaderFlags := $self readInt32 &int:88.
        theNumberOfDataDirectories := $self readInt32 &int:92.
    ]
}

// -----------------------------------------------------------------
// The optional header data directories give the address and
// size of several tables that appear in the sections of the PE
// file. Each data directory entry contains the RVA and Size of
// the structure it describes.
// The tables pointed to by the directory entries are stored in
// on of the PE file's sections; these sections themselves are
// described by section headers.
// -----------------------------------------------------------------
class PEHeaderDataDirectories :: HeaderBase
{
    long theExportTable. // Always 0 (see Section 23.1).
    long theImportTable. // RVA of Import Table, (see clause 24.3.1).
    long theResourceTable. // Always 0 (see Section 23.1).
    long theExceptionTable. // Always 0 (see Section 23.1).
    long theCertificateTable. // Always 0 (see Section 23.1).
    long theBaseRelocationTable. // Relocation Table, set to 0 if unused (see clause 24.3.1).
    long theDebug. // Always 0 (see Section 23.1).
    long theCopyright. // Always 0 (see Section 23.1).
    long theGlobalPtr. // Always 0 (see Section 23.1).
    long theTLSTable. // Always 0 (see Section 23.1).
    long theLoadConfigTable. // Always 0 (see Section 23.1).
    long theBoundImport. // Always 0 (see Section 23.1).
    long theIAT. // RVA of Import Address Table, (see clause 24.3.1).
    long theDelayImportDescriptor. // Always 0 (see Section 23.1).
    long theCLIHeader. // CLI Header with directories for runtime data, (see clause 24.3.1).
    long theReserved. // Always 0 (see Section 23.1).

    constructor new &bytearray:data &int:offset
        <= new &bytearray:data &int:offset;
    [
        $self readData.
    ]
        
    readData
    [
        theExportTable := $self readInt64 &int:96.
        theImportTable := $self readInt64 &int:104.
        theResourceTable := $self readInt64 &int:112.
        theExceptionTable := $self readInt64 &int:120.
        theCertificateTable := $self readInt64 &int:128.
        theBaseRelocationTable := $self readInt64 &int:136.
        theDebug := $self readInt64 &int:144.
        theCopyright := $self readInt64 &int:152.
        theGlobalPtr := $self readInt64 &int:160.
        theTLSTable := $self readInt64 &int:168.
        theLoadConfigTable := $self readInt64 &int:176.
        theBoundImport := $self readInt64 &int:184.
        theIAT := $self readInt64 &int:192.
        theDelayImportDescriptor := $self readInt64 &int:200.
        theCLIHeader := $self readInt64 &int:208.
        theReserved := $self readInt64 &int:216.
    ]
    
    importTable = theImportTable.
    cliHeader = theCLIHeader.
}
// -----------------------------------------------------------------
// Immediately following the optional header is the Section
// Table, which contains a number of section headers. This
// positioning is required because the file header does not
// contain a direct pointer to the section table; the location
// of the section table is determined by calculating the
// location of the first byte after the headers.
// Each section header has the following format, for a total of
// 40 bytes per entry:
// -----------------------------------------------------------------
class SectionHeaders :: HeaderBase
{
    /// An 8-byte, null-padded ASCII string. There is no terminating
    /// null if the string is exactly eight characters long.
    long theName.
    
    /// Total size of the section when loaded into memory in bytes
    /// rounded to Section Alignment. If this value is greater than
    /// Size of Raw Data, the section is zero-padded.
    int theVirtualSize.
    
    /// For executable images this is the address of the first byte
    /// of the section, when loaded into memory, relative to the
    /// image base.
    int theVirtualAddress.
    
    /// Size of the initialized data on disk in bytes, shall be a
    /// multiple of FileAlignment from the PE header. If this is
    /// less than VirtualSize the remainder of the section is zero
    /// filled. Because this field is rounded while the VirtualSize
    /// field is not it is possible for this to be greater than
    /// VirtualSize as well. When a section contains only
    /// uninitialized data, this field should be 0.
    int theSizeOfRawData.
    
    /// Offset of section's first page within the PE file. This
    /// shall be a multiple of FileAlignment from the optional
    /// header. When a section contains only uninitialized data,
    /// this field should be 0.
    int thePointerToRawData.
    
    int thePointerToRelocations. // RVA of Relocation section.
    int thePointerToLinenumbers. // Always 0 (see Section 23.1).
    short theNumberOfRelocations. // Number of relocations, set to 0 if unused.
    short theNumberOfLinenumbers. // Always 0 (see Section 23.1).
    int theCharacteristics. // Flags describing section's characteristics, see below.

    constructor new &bytearray:data &int:offset
        <= new &bytearray:data &int:offset;
    [
        $self readData.
    ]
        
    readData
    [
        theName := $self readInt64 &int:0. 
		theVirtualSize := $self readInt32 &int:8.
		theVirtualAddress := $self readInt32 &int:12.
		theSizeOfRawData := $self readInt32 &int:16.
		thePointerToRawData := $self readInt32 &int:20.
		thePointerToRelocations := $self readInt32 &int:24.
		thePointerToLinenumbers := $self readInt32 &int:28.
		theNumberOfRelocations := $self readInt16 &int:32.
		theNumberOfLinenumbers := $self readInt16 &int:34.
		theCharacteristics := $self readInt32 &int:36.
    ]
    
    pointerToRawData = thePointerToRawData.
    virtualAddress = theVirtualAddress.
    name = theName.
    asciiName = Util getASCIIString &long:theName.
}

// -----------------------------------------------------------------
// The Import Table and the Import Address Table (IAT) are used
// to import the _CorExeMain (for a .exe) or _CorDllMain (for a
// .dll) entries of the runtime engine (mscoree.dll). The
// Import Table directory entry points to a one element zero
// terminated array of Import Directory entries (in a general
// PE file there is one entry for each imported DLL):
// -----------------------------------------------------------------
class ImportTable :: HeaderBase
{
    int theImportLookupTable. // RVA of the Import Lookup Table
    int theDateTimeStamp. // Always 0 (see Section 23.1).
    int theForwarderChain. // Always 0 (see Section 23.1).
    int theName. // RVA of null terminated ASCII string "mscoree.dll".
    
    // RVA of Import Address Table (this is the same as the RVA of
    // the IAT descriptor in the optional header).
    int theImportAddressTable.
    
    constructor new &bytearray:data &int:offset
        <= new &bytearray:data &int:offset;
    [
        $self readData.
    ]
        
    readData
    [
        theImportLookupTable := $self readInt32 &int:0.
        theDateTimeStamp := $self readInt32 &int:4.
        theForwarderChain := $self readInt32 &int:8.
        theName := $self readInt32 &int:12.
        theImportAddressTable := $self readInt32 &int:16.
    ]
}

// -----------------------------------------------------------------
// In a pure CIL image, a single fixup of type
// IMAGE_REL_BASED_HIGHLOW (0x3) is required for the x86
// startup stub which access the IAT to load the runtime engine
// on down level loaders. When building a mixed CIL/native
// image or when the image contains embedded RVAs in user data,
// the relocation section contains relocations for these as
// well.
// The relocations shall be in their own section, named
// ".reloc", which shall be the final section in the PE file.
// The relocation section contains a Fix-Up Table. The fixup
// table is broken into blocks of fixups. Each block represents
// the fixups for a 4K page, and each block shall start on a
// 32-bit boundary.
// Each fixup block starts with the following structure:
// -----------------------------------------------------------------
class Relocations :: HeaderBase
{
    // The RVA of the block in which the fixup needs to be applied.
	// The low 12 bits shall be zero.
	int thePageRVA.

	/// <summary>
	/// Total number of bytes in the fixup block, including the Page
	/// RVA and Block Size fields, as well as the Type/Offset fields
	/// that follow, rounded up to the next multiple of 4.
	int theBlockSize.
 
    constructor new &bytearray:data &int:offset
        <= new &bytearray:data &int:offset;
    [
        $self readData.
    ]
        
    readData
    [
        thePageRVA := $self readInt32 &int:0.
		theBlockSize := $self readInt32 &int:4.
    ]
}

// -----------------------------------------------------------------
// The CLI header contains all of the runtime-specific data
// entries and other information. The header should be placed
// in a read only, sharable section of the image. This header
// is defined as follows:
// -----------------------------------------------------------------
class CLIHeader :: HeaderBase
{
	int theCb. // Size of the header in bytes
	short theMajorRuntimeVersion. // The minimum version of the runtime required to run this program, currently 2.
	short theMinorRuntimeVersion. // The minor portion of the version, currently 0.
	long theMetaData. // RVA and size of the physical meta data (see Chapter 23).
	int theFlags. // Flags describing this runtime image. (see clause 24.3.3.1).
	int theEntryPointToken. // Token for the MethodDef or File of the entry point for the image
	long theResources. // Location of CLI resources. (See Partition V ).

	// RVA of the hash data for this PE file used by the CLI loader
	// for binding and versioning
	// </summary>
	long theStrongNameSignature.
 
	long theCodeManagerTable. // Always 0 (see Section 23.1).

	// RVA of an array of locations in the file that contain an
	// array of function pointers (e.g., vtable slots), see below.
	long theVTableFixups.

	long theExportAddressTableJumps. // Always 0 (see Section 23.1).
	long theManagedNativeHeader. // Always 0 (see Section 23.1).

	constructor new &bytearray:data &int:offset
        <= new &bytearray:data &int:offset;
    [
        $self readData.
    ]
        
    readData
    [
		theCb := $self readInt32 &int:0.
		theMajorRuntimeVersion := $self readInt16 &int:4.
		theMinorRuntimeVersion := $self readInt16 &int:6.
		theMetaData := $self readInt64 &int:8.
		theFlags := $self readInt32 &int:16.
		theEntryPointToken := $self readInt32 &int:20.
		theResources := $self readInt64 &int:24.
		theStrongNameSignature := $self readInt64 &int:32.
		theCodeManagerTable := $self readInt64 &int:40.
		theVTableFixups := $self readInt64 &int:48.
		theExportAddressTableJumps := $self readInt64 &int:56.
		theManagedNativeHeader := $self readInt64 &int:64.
	]
 
    metadata = theMetaData.
}

// -----------------------------------------------------------------
// Certain languages, which choose not to follow the common
// type system runtime model, may have virtual functions which
// need to be represented in a v-table. These v-tables are laid
// out by the compiler, not by the runtime. Finding the correct
// v-table slot and calling indirectly through the value held
// in that slot is also done by the compiler. The VtableFixups
// field in the runtime header contains the location and size
// of an array of Vtable Fixups (see clause 14.5.1). V-tables
// shall be emitted into a read-write section of the PE file.
// Each entry in this array describes a contiguous array of
// v-table slots of the specified size. Each slot starts out
// initialized to the metadata token value for the method they
// need to call. At image load time, the runtime Loader will
// turn each entry into a pointer to machine code for the CPU
// and can be called directly.
// -----------------------------------------------------------------
class VtableFixup :: HeaderBase
{
	int theVirtualAddress. // RVA of Vtable
	short theSize. // Number of entries in Vtable
	short theType. // Type of the entries, as defined in table below

    constructor new &bytearray:data &int:offset
        <= new &bytearray:data &int:offset;
    [
        $self readData.
    ]
        
    readData
    [
        theVirtualAddress := $self readInt32 &int:0.
		theSize := $self readInt16 &int:4.
		theType := $self readInt16 &int:6.
    ]
}

// -----------------------------------------------------------------
// Exception handling clauses also come in small and fat
// versions.
// The layout of fat form of exception handling clauses is as
// follows:
// -----------------------------------------------------------------
class ExceptionHandlingClauses :: HeaderBase
{
	int theFlags. // Flags, see below.
	int theTryOffset. // Offset in bytes of try block from start of the header.
	int theTryLength. // Length in bytes of the try block
	int theHandlerOffset. // Location of the handler for this try block
	int theHandlerLength. // Size of the handler code in bytes
	int theClassToken. // Meta data token for a type-based exception handler
	int theFilterOffset. // Offset in method body for filter-based exception handler

    constructor new &bytearray:data &int:offset
        <= new &bytearray:data &int:offset;
    [
        $self readData.
    ]
        
    readData
    [
		theFlags := $self readInt32 &int:0.
		theTryOffset := $self readInt32 &int:4.
		theTryLength := $self readInt32 &int:8.
		theHandlerOffset := $self readInt32 &int:12.
		theHandlerLength := $self readInt32 &int:16.
		theClassToken := $self readInt32 &int:20.
		theFilterOffset := $self readInt32 &int:20.
    ]
}

// -----------------------------------------------------------------
// The root of the physical metadata starts with a magic
// signature, several bytes of version and other miscellaneous
// information, followed by a count and an array of stream
// headers, one for each stream that is present. The actual
// encoded tables and heaps are stored in the streams, which
// immediately follow this array of headers.
// -----------------------------------------------------------------
class MetadataRoot :: HeaderBase
{
	int theSignature. // Magic signature for physical metadata : 0x424A5342.
	short theMajorVersion. // Major version, 1 (ignore on read)
	short theMinorVersion. // Minor version, 1 (ignore on read)
	int theReserved. // Reserved, always 0 (see Section 23.1).
	int theLength. // Length of version string in bytes, say m (<= 255), rounded up to a multiple of four.

    constructor new &bytearray:data &int:offset
        <= new &bytearray:data &int:offset;
    [
        $self readData.
    ]
        
    readData
    [
        theSignature := $self readInt32 &int:0.
        theMajorVersion := $self readInt16 &int:4.
        theMinorVersion := $self readInt16 &int:6.
        theReserved := $self readInt32 &int:8.
        theLength := $self readInt32 &int:12.
    ] 
    
    length = theLength.
}

// -----------------------------------------------------------------
// The "#~" streams contain the actual physical representations
// of the logical metadata tables (see Chapter 21). A "#~"
// stream has the following top-level structure:
// -----------------------------------------------------------------
class SharpTildeStream :: HeaderBase
{
	int theReserved1. // Reserved, always 0 (see Section 23.1).
	byte theMajorVersion. // Major version of table schemata, always 1 (see Section 23.1).
	byte theMinorVersion. // Minor version of table schemata, always 0 (see Section 23.1).
	byte theHeapSizes. // Bit vector for heap sizes.
	byte theReserved2. // Reserved, always 1 (see Section 23.1).
	long theValid. // Bit vector of present tables, let n be the number of bits that are 1.
	long theSorted. // Bit vector of sorted tables.
 
    constructor new &bytearray:data &int:offset
        <= new &bytearray:data &int:offset;
    [
        $self readData.
    ]
        
    readData
    [
        theReserved1 := $self readInt32 &int:0.
        theMajorVersion := $self readByte &int:4.
        theMinorVersion := $self readByte &int:5.
        theHeapSizes := $self readByte &int:6.
        theReserved2 := $self readByte &int:7.
        theValid := $self readInt64 &int:8.
        theSorted := $self readInt64 &int:16.
    ]
    
    getOffset = $self offset.
    heapSizes = theHeapSizes.
    valid = theValid.
}
