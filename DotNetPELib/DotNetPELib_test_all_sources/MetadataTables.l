#import system.
#import system'collections.

extension MetadataTables
{
    module = 00h.
    typeRef = 01h.
    typeDef = 02h.
    field = 04h.
    methodDef = 06h.
    param = 08h.
    interfaceImpl = 09h.
    memberRef = 0Ah.
    constant = 0Bh.
    customAttribute = 0Ch.
    fieldMarshal = 0Dh.
    declSecurity = 0Eh.
    classLayout = 0Fh.
    fieldLayout = 10h.
    standAloneSig = 11h.
    eventMap = 12h.
    event = 14h.
    propertyMap = 15h.
    property = 17h.
    methodSemantics = 18h.
    methodImpl = 19h.
    moduleRef = 1Ah.
    typeSpec = 1Bh.
    implMap = 1Ch.
    fieldRVA = 1Dh.
    assembly = 20h.
    assemblyProcessor = 21h.
    assemblyOS = 22h.
    assemblyRef = 23h.
    assemblyRefProcessor = 24h.
    assemblyRefOS = 25h.
    file = 26h.
    exportedType = 27h.
    manifestResource = 28h.
    nestedClass = 29h.
    notUsed = 3fh.
    
    isDefined &int:aType
    [
        (aType == 00h)? [ ^true. ].
        (aType == 01h)? [ ^true. ].
        (aType == 02h)? [ ^true. ].
        (aType == 04h)? [ ^true. ].
        (aType == 06h)? [ ^true. ].
        (aType == 08h)? [ ^true. ].
        (aType == 09h)? [ ^true. ].
        (aType == 0Ah)? [ ^true. ].
        (aType == 0Bh)? [ ^true. ].
        (aType == 0Ch)? [ ^true. ].
        (aType == 0Dh)? [ ^true. ].
        (aType == 0Eh)? [ ^true. ].
        (aType == 0Fh)? [ ^true. ].
        (aType == 10h)? [ ^true. ].
        (aType == 11h)? [ ^true. ].
        (aType == 12h)? [ ^true. ].
        (aType == 14h)? [ ^true. ].
        (aType == 15h)? [ ^true. ].
        (aType == 17h)? [ ^true. ].
        (aType == 18h)? [ ^true. ].
        (aType == 19h)? [ ^true. ].
        (aType == 1Ah)? [ ^true. ].
        (aType == 1Bh)? [ ^true. ].
        (aType == 1Ch)? [ ^true. ].
        (aType == 1Dh)? [ ^true. ].
        (aType == 20h)? [ ^true. ].
        (aType == 21h)? [ ^true. ].
        (aType == 22h)? [ ^true. ].
        (aType == 23h)? [ ^true. ].
        (aType == 24h)? [ ^true. ].
        (aType == 25h)? [ ^true. ].
        (aType == 26h)? [ ^true. ].
        (aType == 27h)? [ ^true. ].
        (aType == 28h)? [ ^true. ].
        (aType == 29h)? [ ^true. ].
        (aType == 3fh)? [ ^true. ].
    ]
}

extension MetadataTableCreator
{
    create &metadatatables:aTable
    [
        (aTable == MetadataTables assembly)? [ ^AssemblyTable new. ].
//        (aTable == MetadataTables assemblyOS)? [ ^AssemblyOSTable new. ].
//        (aTable == MetadataTables assemblyProcessor)? [ ^AssemblyProcessorTable new. ].
//        (aTable == MetadataTables assemblyRef)? [ ^AssemblyRefTable new. ].
//        (aTable == MetadataTables assemblyRefOS)? [ ^AssemblyRefOSTable new. ].
//        (aTable == MetadataTables assemblyRefProcessor)? [ ^AssemblyRefProcessorTable new. ].
//        (aTable == MetadataTables classLayout)? [ ^ClassLayoutTable new. ].
//        (aTable == MetadataTables constant)? [ ^ConstantTable new. ].
//        (aTable == MetadataTables customAttribute)? [ ^CustomAttributeTable new. ].
//        (aTable == MetadataTables declSecurity)? [ ^DeclSecurityTable new. ].
//        (aTable == MetadataTables eventMap)? [ ^EventMapTable new. ].
//        (aTable == MetadataTables event)? [ ^EventTable new. ].
//        (aTable == MetadataTables exportedType)? [ ^ExportedTypeTable new. ].
//        (aTable == MetadataTables field)? [ ^FieldTable new. ].
//        (aTable == MetadataTables fieldLayout)? [ ^FieldLayoutTable new. ].
//        (aTable == MetadataTables fieldMarshal)? [ ^FieldMarshalTable new. ].
//        (aTable == MetadataTables fieldRVA)? [ ^FieldRVATable new. ].
//        (aTable == MetadataTables file)? [ ^FileTable new. ].
//        (aTable == MetadataTables implMap)? [ ^ImplMapTable new. ].
//        (aTable == MetadataTables interfaceImpl)? [ ^InterfaceImplTable new. ].
//        (aTable == MetadataTables manifestResource)? [ ^ManifestResourceTable new. ].
//        (aTable == MetadataTables memberRef)? [ ^MemberRefTable new. ].
//        (aTable == MetadataTables methodDef)? [ ^MethodDefTable new. ].
//        (aTable == MetadataTables methodImpl)? [ ^MethodImplTable new. ].
//        (aTable == MetadataTables methodSemantics)? [ ^MethodSemanticsTable new. ].
//        (aTable == MetadataTables module)? [ ^ModuleTable new. ].
//        (aTable == MetadataTables moduleRef)? [ ^ModuleRefTable new. ].
//        (aTable == MetadataTables nestedClass)? [ ^NestedClassTable new. ].
//        (aTable == MetadataTables param)? [ ^ParamTable new. ].
//        (aTable == MetadataTables property)? [ ^PropertyTable new. ].
//        (aTable == MetadataTables propertyMap)? [ ^PropertyMapTable new. ].
//        (aTable == MetadataTables standAloneSig)? [ ^StandAloneSigTable new. ].
//        (aTable == MetadataTables typeDef)? [ ^TypeDefTable new. ].
//        (aTable == MetadataTables typeRef)? [ ^TypeRefTable new. ].
//        (aTable == MetadataTables typeSpec)? [ ^TypeSpecTable new. ].
    ]
}

// -----------------------------------------------------------------
// The Assembly table is defined using the .assembly directive
// (see Section 6.2); its columns are obtained from the
// respective .hash algorithm, .ver, .publickey, and .culture
// (see clause 6.2.1 For an example see Section 6.2.
// -----------------------------------------------------------------
class AssemblyTable :: TableBase
{
    int theHashAlgId. // a 4 byte constant of type AssemblyHashAlgorithm, clause 22.1.1
    short theMajorVersion. // 2 byte constants
    short theMinorVersion. // 2 byte constants
    short theBuildNumber. // 2 byte constants
    short theRevisionNumber. // 2 byte constants
    int theFlags. // a 4 byte bitmask of type AssemblyFlags, clause 22.1.2
    int thePublicKey. // index into Blob heap
    int theName. // index into String heap
    int theCulture. // index into String heap
    
    readData &bytearray:data &int:offset
    [
        $self readData &bytearray:data &int:offset.
        
        theHashAlgId := $self readInt32.
        theMajorVersion := $self readInt16.
        theMinorVersion := $self readInt16.
        theBuildNumber := $self readInt16.
        theRevisionNumber := $self readInt16.
        theFlags := $self readInt32.
        thePublicKey := $self readBlobIndex.
        theName := $self readStringsIndex.
        theCulture := $self readStringsIndex.
    ]
}

// -----------------------------------------------------------------
// These records should not be emitted into any PE file. If
// present in a PE file, they should be treated as-if their
// fields were zero. They should be ignored by the CLI.
// -----------------------------------------------------------------
class AssemblyRefOSTable :: TableBase
{
    int theOSPlatformId. // 4 byte constant
    int theOSMajorVersion. // 4 byte constant
    int theOSMinorVersion. // 4 byte constant
    int theAssemblyRef. // index into the AssemblyRef table
    
    constructor new &bytearray:data &int:offset
        <= new &bytearray:data &int:offset;
    [
        $self readData.
    ]
       
    readData
    [
        theOSPlatformId := $self readInt32.
        theOSMajorVersion := $self readInt32.
        theOSMinorVersion := $self readInt32.
        //theAssemblyRef := $self ReadIndex(MetadataTables.AssemblyRef).
    ]
}
