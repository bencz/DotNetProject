import system.
import system'collections.

const module = 00h.
const typeRef = 01h.
const typeDef = 02h.
const field = 04h.
const methodDef = 06h.
const param = 08h.
const interfaceImpl = 09h.
const memberRef = 0Ah.
const constant = 0Bh.
const customAttribute = 0Ch.
const fieldMarshal = 0Dh.
const declSecurity = 0Eh.
const classLayout = 0Fh.
const fieldLayout = 10h.
const standAloneSig = 11h.
const eventMap = 12h.
const event = 14h.
const propertyMap = 15h.
const property = 17h.
const methodSemantics = 18h.
const methodImpl = 19h.
const moduleRef = 1Ah.
const typeSpec = 1Bh.
const implMap = 1Ch.
const fieldRVA = 1Dh.
const assembly = 20h.
const assemblyProcessor = 21h.
const assemblyOS = 22h.
const assemblyRef = 23h.
const assemblyRefProcessor = 24h.
const assemblyRefOS = 25h.
const file = 26h.
const exportedType = 27h.
const manifestResource = 28h.
const nestedClass = 29h.
const notUsed = 3fh.

extension MetadataTables
{
    isDefined int:aType
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
    create metadatatables:aTable
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
    
    readData bytearray:data int:offset
    [
        $self readData bytearray:data int:offset.
        
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
    
    constructor new bytearray:data int:offset
        <= new bytearray:data int:offset;
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
