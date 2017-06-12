import system.
import system'collections.

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
    create metadatatables:aTable bytearray:aData int:aOffset
    [
        (aTable == mdTassembly)? [ ^AssemblyTable new bytearray:aData int:aOffset. ].
        (aTable == mdTassemblyOS)? [ ^AssemblyOSTable new bytearray:aData int:aOffset. ].
        (aTable == mdTassemblyProcessor)? [ ^AssemblyProcessorTable new bytearray:aData int:aOffset. ].
        (aTable == mdTassemblyRef)? [ ^AssemblyRefTable new bytearray:aData int:aOffset. ].
        (aTable == mdTassemblyRefOS)? [ ^AssemblyRefOSTable new bytearray:aData int:aOffset. ].
        (aTable == mdTassemblyRefProcessor)? [ ^AssemblyRefProcessorTable new bytearray:aData int:aOffset. ].
        (aTable == mdTclassLayout)? [ ^ClassLayoutTable new bytearray:aData int:aOffset. ].
        (aTable == mdTconstant)? [ ^ConstantTable new bytearray:aData int:aOffset. ].
        (aTable == mdTcustomAttribute)? [ ^CustomAttributeTable new bytearray:aData int:aOffset. ].
        (aTable == mdTdeclSecurity)? [ ^DeclSecurityTable new bytearray:aData int:aOffset. ].
        (aTable == mdTeventMap)? [ ^EventMapTable new bytearray:aData int:aOffset. ].
        (aTable == mdTevent)? [ ^EventTable new bytearray:aData int:aOffset. ].
        (aTable == mdTexportedType)? [ ^ExportedTypeTable new bytearray:aData int:aOffset. ].
        (aTable == mdTfield)? [ ^FieldTable new bytearray:aData int:aOffset. ].
        (aTable == mdTfieldLayout)? [ ^FieldLayoutTable new bytearray:aData int:aOffset. ].
        (aTable == mdTfieldMarshal)? [ ^FieldMarshalTable new bytearray:aData int:aOffset. ].
        (aTable == mdTfieldRVA)? [ ^FieldRVATable new bytearray:aData int:aOffset. ].
        (aTable == mdTfile)? [ ^FileTable new bytearray:aData int:aOffset. ].
        (aTable == mdTimplMap)? [ ^ImplMapTable new bytearray:aData int:aOffset. ].
        (aTable == mdTinterfaceImpl)? [ ^InterfaceImplTable new bytearray:aData int:aOffset. ].
        (aTable == mdTmanifestResource)? [ ^ManifestResourceTable new bytearray:aData int:aOffset. ].
        (aTable == mdTmemberRef)? [ ^MemberRefTable new bytearray:aData int:aOffset. ].
        (aTable == mdTmethodDef)? [ ^MethodDefTable new bytearray:aData int:aOffset. ].
        (aTable == mdTmethodImpl)? [ ^MethodImplTable new bytearray:aData int:aOffset. ].
        (aTable == mdTmethodSemantics)? [ ^MethodSemanticsTable new bytearray:aData int:aOffset. ].
        (aTable == mdTmodule)? [ ^ModuleTable new bytearray:aData int:aOffset. ].
        (aTable == mdTmoduleRef)? [ ^ModuleRefTable new bytearray:aData int:aOffset. ].
        (aTable == mdTnestedClass)? [ ^NestedClassTable new bytearray:aData int:aOffset. ].
        (aTable == mdTparam)? [ ^ParamTable new bytearray:aData int:aOffset. ].
        (aTable == mdTproperty)? [ ^PropertyTable new bytearray:aData int:aOffset. ].
        (aTable == mdTpropertyMap)? [ ^PropertyMapTable new bytearray:aData int:aOffset. ].
        (aTable == mdTstandAloneSig)? [ ^StandAloneSigTable new bytearray:aData int:aOffset. ].
        (aTable == mdTtypeDef)? [ ^TypeDefTable new bytearray:aData int:aOffset. ].
        (aTable == mdTtypeRef)? [ ^TypeRefTable new bytearray:aData int:aOffset. ].
        (aTable == mdTtypeSpec)? [ ^TypeSpecTable new bytearray:aData int:aOffset. ].
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
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]
    
    readData
    [        
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
// This record should not be emitted into any PE file. If
// present in a PE file, it should be treated as if all its
// fields were zero. It should be ignored by the CLI.
// -----------------------------------------------------------------
class AssemblyOSTable :: TableBase
{
    int theOSPlatformID. // a 4 byte constant
    int theOSMajorVersion. // a 4 byte constant
    int theOSMinorVersion. // a 4 byte constant
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        theOSPlatformID := $self readInt32.
        theOSMajorVersion := $self readInt32.
        theOSMinorVersion := $self readInt32.
    ]
}

// -----------------------------------------------------------------
// This record should not be emitted into any PE file. If
// present in a PE file, it should be treated as if its field
// were zero. It should be ignored by the CLI.
// -----------------------------------------------------------------
class AssemblyProcessorTable :: TableBase
{
    int theProcessor. // a 4 byte constant
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        theProcessor := $self readInt32.
    ]
}

// -----------------------------------------------------------------
// The table is defined by the .assembly extern directive (see
// Section 6.3). Its columns are filled using directives
// similar to those of the Assembly table except for the
// PublicKeyOrToken column which is defined using the
// .publickeytoken directive. For an example see Section 6.3.
// -----------------------------------------------------------------
class AssemblyRefTable :: TableBase
{
    short theMajorVersion. // 2 byte constants
    short theMinorVersion. // 2 byte constants
    short theBuildNumber. // 2 byte constants
    short theRevisionNumber. // 2 byte constants
    int theFlags. // a 4 byte bitmask of type AssemblyFlags, clause 22.1.2
    int thePublicKeyOrToken. // index into Blob heap -- the public key or token that identifies the author of this Assembly
    int theName. // index into String heap
    int theCulture. // index into String heap
    int theHashValue. // index into Blob heap
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        theMajorVersion := $self readInt16.
        theMinorVersion := $self readInt16.
        theBuildNumber := $self readInt16.
        theRevisionNumber := $self readInt16.
        theFlags := $self readInt32.
        thePublicKeyOrToken := $self readBlobIndex.
        theName := $self readStringsIndex.
        theCulture := $self readStringsIndex.
        theHashValue := $self readBlobIndex.
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
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        theOSPlatformId := $self readInt32.
        theOSMajorVersion := $self readInt32.
        theOSMinorVersion := $self readInt32.
        //theAssemblyRef = ReadIndex(MetadataTables.AssemblyRef);
    ]
}

// -----------------------------------------------------------------
// These records should not be emitted into any PE file. If
// present in a PE file, they should be treated as-if their
// fields were zero. They should be ignored by the CLI.
// -----------------------------------------------------------------
class AssemblyRefProcessorTable :: TableBase
{
    int theProcessor. // 4 byte constant
    int theAssemblyRef. // index into the AssemblyRef table
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        theProcessor := $self readInt32.
        //theAssemblyRef = ReadIndex(MetadataTables.AssemblyRef);
    ]
}

// -----------------------------------------------------------------
// The ClassLayout table is used to define how the fields of a
// class or value type shall be laid out by the CLI (normally,
// the CLI is free to reorder and/or insert gaps between the
// fields defined for a class or value type).
// The rows of the ClassLayout table are defined by placing
// .pack and .size directives on the body of a parent type
// declaration (see Section 9.2). For an example see Section
// 9.7.
// -----------------------------------------------------------------
class ClassLayoutTable :: TableBase
{
    short thePackingSize. // a 2 byte constant
    int theClassSize. // a 4 byte constant
    int theParent. // index into TypeDef table
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        thePackingSize := $self readInt16.
        theClassSize := $self readInt32.
        //theParent = $self readIndex(MetadataTables.TypeDef).
    ]
}

// -----------------------------------------------------------------
// The Constant table is used to store compile-time, constant
// values for fields, parameters and properties.
// Note that Constant information does not directly influence
// runtime behavior, although it is visible via Reflection (and
// hence may be used to implement functionality such as that
// provided by System.Enum.ToString). Compilers inspect this
// information, at compile time, when importing metadata; but
// the value of the constant itself, if used, becomes embedded
// into the CIL stream the compiler emits. There are no CIL
// instructions to access the Constant table at runtime.
// A row in the Constant table for a parent is created whenever
// a compile-time value is specified for that parent, for an
// example see Section 15.2.
// -----------------------------------------------------------------
class ConstantTable :: TableBase
{
    byte theType. // a 1 byte constant, followed by a 1-byte padding zero
    int theParent. // index into the Param or Field or Property table; more precisely, a HasConstant coded index
    int theValue. // index into Blob heap
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        bool doIncrease := false.
        
        if(theOffset == thePointer) [ doIncrease := true. ].
        theType := $self readByte. 
        theParent := $self readIndex metadatatables:cdIdcHasConstant.
        theValue := $self readBlobIndex.
        
        // need to increase the offset for readByte in this case
        if(doIncrease) [ thePointer := thePointer + 1. ].
    ]
}

// -----------------------------------------------------------------
// The CustomAttribute table stores data that can be used to
// instantiate a Custom Attribute (more precisely, an object of
// the specified Custom Attribute class) at runtime. The column
// called Type is slightly misleading -- it actually indexes a
// constructor method -- the owner of that constructor method
// is the Type of the Custom Attribute.
// A row in the CustomAttribute table for a parent is created
// by the .custom attribute, which gives the value of the Type
// column and optionally that of the Value column (see Chapter
// 20)
// -----------------------------------------------------------------
class CustomAttributeTable :: TableBase
{
    // index into any metadata table, except the CustomAttribute
    // table itself; more precisely, a HasCustomAttribute coded
    // index
    int theParent.

    // index into the MethodDef or MethodRef table; more precisely,
    // a CustomAttributeType coded index
    int theType.

    int theValue. // index into Blob heap

    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        theParent := $self readIndex metadatatables:cdIdcHasCustomAttribute.
        theType := $self readIndex metadatatables:cdIdcCustomAttributeType.
        theValue := $self readBlobIndex.
    ]
}

// -----------------------------------------------------------------
// The rows of the DeclSecurity table are filled by attaching a
// .permission or .permissionset directive that specifies the
// Action and PermissionSet on a parent assembly (see Section
// 6.6) or parent type or method (see Section 9.2).
// -----------------------------------------------------------------
class DeclSecurityTable :: TableBase
{
    short theAction. // 2 byte value
    int theParent. // index into the TypeDef, MethodDef or Assembly table
    int thePermissionSet. // index into Blob heap
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        theAction := $self readInt16.
        //theParent = ReadIndex(MetadataTables.MethodDef);
        thePermissionSet := $self readBlobIndex.
    ]
}

// -----------------------------------------------------------------
// Note that EventMap info does not directly influence runtime
// behavior; what counts is the info stored for each method
// that the event comprises.
// -----------------------------------------------------------------
class EventMapTable :: TableBase
{
    int theParent. // index into the TypeDef table
    int theEventList. // index into Event table
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        //theParent = ReadIndex(MetadataTables.TypeDef);
        //theEventList = ReadIndex(MetadataTables.Event);
    ]
}

// -----------------------------------------------------------------
// Events are treated within metadata much like Properties -- a
// way to associate a collection of methods defined on given
// class. There are two required methods -- add_ and remove_,
// plus optional raise_ and others. All of the methods gathered
// together as an Event shall be defined on the class.
// Note that Event information does not directly influence
// runtime behavior; what counts is the information stored for
// each method that the event comprises.
// The EventMap and Event tables result from putting the .event
// directive on a class (see Chapter 17).
// -----------------------------------------------------------------
class EventTable :: TableBase
{
    short theEventFlags. // a 2 byte bitmask of type EventAttribute, clause 22.1.4
    int theName. // index into String heap

    // index into TypeDef, TypeRef or TypeSpec tables; more recisely, a TypeDefOrRef coded index
    int theEventType.
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        theEventFlags := $self readInt16.
        theName := $self readStringsIndex.
        theEventType := $self readIndex metadatatables:cdIdcTypeDefOrRef.
    ]
}

// -----------------------------------------------------------------
// The ExportedType table holds a row for each type, defined
// within other modules of this Assembly, that is exported out
// of this Assembly. In essence, it stores TypeDef row numbers
// of all types that are marked in other modules that
// this Assembly comprises.
// The rows in the ExportedType table are the result of the
// .class extern directive (see Section 6.7).
// -----------------------------------------------------------------
class ExportedTypeTable :: TableBase
{
    int theFlags. // a 4 byte bitmask of type TypeAttributes, clause 22.1.14
    int theTypeDefId. // 4 byte index into a TypeDef table of another module in this Assembly
    int theTypeName. // index into the String heap
    int theTypeNamespace. // index into the String heap
    int theImplementation. // This can be an index (more precisely, an Implementation coded index) into one of 2 tables.
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        theFlags := $self readInt32.
        //theTypeDefId = ReadIndex(MetadataTables.TypeDef);
        theTypeName := $self readStringsIndex.
        theTypeNamespace := $self readStringsIndex.
        theImplementation := $self readIndex metadatatables:cdIdcImplementation.
    ]
}

// -----------------------------------------------------------------
// Each row in the Field table results from a toplevel .field
// directive (see Section 5.10), or a .field directive inside a
// Type (see Section 9.2). For an example see Section 13.5.
// -----------------------------------------------------------------
class FieldTable :: TableBase
{
    short theFlags. // a 2 byte bitmask of type FieldAttributes, clause 22.1.5
    int theName. // index into String heap
    int theSignature. // index into Blob heap
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        theFlags := $self readInt16.
        theName := $self readStringsIndex.
        theSignature := $self readBlobIndex.
    ]
}

// -----------------------------------------------------------------
// A row in the FieldLayout table is created if the .field
// directive for the parent field has specified a field offset
// (see Section 9.7).
// -----------------------------------------------------------------
class FieldLayoutTable :: TableBase
{
    int theFieldOffset. // a 4 byte constant
    int theField. // index into the Field table
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        theFieldOffset := $self readInt32.
        //theField = ReadIndex(MetadataTables.Field);
    ]
}

// -----------------------------------------------------------------
// A row in the FieldMarshal table is created if the .field
// directive for the parent field has specified a .marshall
// attribute (see Section 15.1).
// -----------------------------------------------------------------
class FieldMarshalTable :: TableBase
{
    int theParent. // index into Field or Param table; more precisely, a HasFieldMarshal coded index
    int theNativeType. // index into the Blob heap
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        theParent := $self readIndex metadatatables:cdIdcHasFieldMarshal.
        theNativeType := $self readBlobIndex.
    ]
}

// -----------------------------------------------------------------
// A row in the FieldRVA table is created for each static
// parent field that has specified the optional data label (see
// Chapter 15). The RVA column is the relative virtual address
// of the data in the PE file (see Section 15.3).
// -----------------------------------------------------------------
class FieldRVATable :: TableBase
{
    int theRVA. // a 4 byte constant
    int theField. // index into Field table
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        theRVA := $self readInt32.
        //theField = ReadIndex(MetadataTables.Field);
    ]
}

// -----------------------------------------------------------------
// The rows of the File table result from .file directives in
// an Assembly (see clause 6.2.3)
// -----------------------------------------------------------------
class FileTable :: TableBase
{
    int theFlags. // a 4 byte bitmask of type FileAttributes, clause 22.1.6
    int theName. // index into String heap
    int theHashValue. // index into Blob heap
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        theFlags := $self readInt32.
        theName := $self readStringsIndex.
        theHashValue := $self readBlobIndex.
    ]
}

// -----------------------------------------------------------------
// A row is entered in the ImplMap table for each parent Method
// (see Section 14.5) that is defined with a .pinvokeimpl
// interoperation attribute specifying the MappingFlags,
// ImportName and ImportScope. For an example see Section 14.5.
// -----------------------------------------------------------------
class ImplMapTable :: TableBase
{
    short theMappingFlags. // a 2 byte bitmask of type PInvokeAttributes, clause 22.1.7
    int theMemberForwarded. // index into the Field or MethodDef table; more precisely, a MemberForwarded coded index
    int theImportName. // index into the String heap
    int theImportScope. // index into the ModuleRef table
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        theMappingFlags := $self readInt16.
        theMemberForwarded := $self readIndex metadatatables:cdIdcMemberForwarded.
        theImportName := $self readStringsIndex.
//        theImportScope = ReadIndex(MetadataTables.ModuleRef);
    ]
}

// -----------------------------------------------------------------
// The InterfaceImpl table records which interfaces a Type
// implements. Conceptually, each row in the InterfaceImpl
// table says that Class implements Interface.
// -----------------------------------------------------------------
class InterfaceImplTable :: TableBase
{
    int theClass. // index into the TypeDef table
    int theInterface. // index into the TypeDef, TypeRef or TypeSpec table; more precisely, a TypeDefOrRef coded index
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        //theClass = ReadIndex(MetadataTables.TypeDef);
        theInterface := $self readIndex metadatatables:cdIdcTypeDefOrRef.
    ]
}

// -----------------------------------------------------------------
// The Offset specifies the byte offset within the referenced
// file at which this resource record begins. The
// Implementation specifies which file holds this resource. The
// rows in the table result from .mresource directives on the
// Assembly (see clause 6.2.2).
// -----------------------------------------------------------------
class ManifestResourceTable :: TableBase
{
    int theManifestResourceOffset. // a 4 byte constant
    int theFlags. // a 4 byte bitmask of type ManifestResourceAttributes, clause 22.1.8
    int theName. // index into the String heap
    int theImplementation. // index into File table, or AssemblyRef table, or null; more precisely, an Implementation coded index
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        theManifestResourceOffset := $self readInt32.
        theFlags := $self readInt32.
        theName := $self readStringsIndex.
        theImplementation := $self readIndex metadatatables:cdIdcImplementation.
    ]
}

// -----------------------------------------------------------------
// An entry is made into the MemberRef table whenever a
// reference is made, in the CIL code, to a method or field
// which is defined in another module or assembly. (Also, an
// entry is made for a call to a method with a VARARG
// signature, even when it is defined in the same module as the
// callsite)
// -----------------------------------------------------------------
class MemberRefTable :: TableBase
{
    // index into the TypeRef, ModuleRef, MethodDef, TypeSpec or
    // TypeDef tables; more precisely, a MemberRefParent coded index
    int theClass.
    
    int theName. // index into String heap
    int theSignature. // index into Blob heap
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        theClass := $self readIndex metadatatables:cdIdcMemberRefParent.
        theName := $self readStringsIndex.
        theSignature := $self readBlobIndex.
    ]
}

// -----------------------------------------------------------------
// The rows in the MethodDef table result from .method
// directives (see Chapter 14). The RVA column is computed when
// the image for the PE file is emitted and points to the
// COR_ILMETHOD structure for the body of the method (see
// Chapter 24.4)
// -----------------------------------------------------------------
class MethodDefTable :: TableBase
{
    int theRVA. // a 4 byte constant
    short theImplFlags. // a 2 byte bitmask of type MethodImplAttributes, clause 22.1.9
    short theFlags. // a 2 byte bitmask of type MethodAttribute, clause 22.1.9
    int theName. // index into String heap
    int theSignature. // index into Blob heap
    int theParamList. // index into Param table

    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        theRVA := $self readInt32.
        theImplFlags := $self readInt16.
        theFlags := $self readInt16.
        theName := $self readStringsIndex.
        theSignature := $self readBlobIndex.
        //theParamList = ReadIndex(MetadataTables.Param);
    ]
}

// -----------------------------------------------------------------
// ilasm uses the .override directive to specify the rows of
// the MethodImpl table (see clause 9.3.2).
// -----------------------------------------------------------------
class MethodImplTable :: TableBase
{
    int theClass. // index into TypeDef table
    int theMethodBody. // index into MethodDef or MemberRef table; more precisely, a MethodDefOrRef coded index
    int theMethodDeclaration. // index into MethodDef or MemberRef table; more precisely, a MethodDefOrRef coded index
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        //theClass = ReadIndex(MetadataTables.TypeDef);
        theMethodBody := $self readIndex metadatatables:cdIdcMethodDefOrRef.
        //theMethodDeclaration = ReadIndex(MetadataTables.MethodDef);
    ]
}

// -----------------------------------------------------------------
// The rows of the MethodSemantics table are filled by
// .property (see Chapter 16) and .event directives (see
// Chapter 17). See clause 21.13 for more information.
// -----------------------------------------------------------------
class MethodSemanticsTable :: TableBase
{
    short theSemantics. // a 2 byte bitmask of type MethodSemanticsAttributes, clause 22.1.11
    int theMethod. // index into the MethodDef table
    int theAssociation. // index into the Event or Property table; more precisely, a HasSemantics coded index
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData
    ]

    readData
    [
        theSemantics := $self readInt16.
        //theMethod = ReadIndex(MetadataTables.MethodDef);
        theAssociation := $self readIndex metadatatables:cdIdcHasSemantics.
    ]
}

// -----------------------------------------------------------------
// The Generation, EncId and EncBaseId columns can be written
// as zero, and can be ignored by conforming implementations of
// the CLI. The rows in the Module table result from .module
// directives in the Assembly (see Section 6.4).
// -----------------------------------------------------------------
class ModuleTable :: TableBase
{
    short theGeneration. // 2 byte value, reserved, shall be zero
    int theName. // index into String heap
    int theMvid. // index into Guid heap; simply a Guid used to distinguish between two versions of the same module
    int theEncId. // index into Guid heap, reserved, shall be zero
    int theEncBaseId. // index into Guid heap, reserved, shall be zero
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        theGeneration := $self readInt16.
        theName := $self readStringsIndex.
        theMvid := $self readGuidIndex.
        theEncId := $self readGuidIndex.
        theEncBaseId := $self readGuidIndex.
    ]
}

// -----------------------------------------------------------------
// The rows in the ModuleRef table result from .module extern
// directives in the Assembly (see Section 6.5).
// -----------------------------------------------------------------
class ModuleRefTable :: TableBase
{
    int theName. // index into String heap
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        theName := $self readStringsIndex.
    ]
}

// -----------------------------------------------------------------
// The NestedClass table records which Type definitions are
// nested within which other Type definition. In a typical
// high-level language, including ilasm, the nested class is
// defined as lexically 'inside' the text of its enclosing
// Type.
// -----------------------------------------------------------------
class NestedClassTable :: TableBase
{
    int theNestedClass. // index into the TypeDef table
    int theEnclosingClass. // index into the TypeDef table
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]
 
    readData
    [
        //theNestedClass = ReadIndex(MetadataTables.TypeDef);
        //theEnclosingClass = ReadIndex(MetadataTables.TypeDef);
    ]
}

// -----------------------------------------------------------------
// The rows in the Param table result from the parameters in a
// method declaration (see Section 14.4), or from a .param
// attribute attached to a method (see clause 14.4.1).
// -----------------------------------------------------------------
class ParamTable :: TableBase
{
    short theFlags. // a 2 byte bitmask of type ParamAttributes, clause 22.1.12
    short theSequence. // a 2 byte constant
    int theName. // index into String heap
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        theFlags := $self readInt16.
        theSequence := $self readInt16.
        theName := $self readStringsIndex.
    ]
}

// -----------------------------------------------------------------
// Properties within metadata are best viewed as a means to
// gather together collections of methods defined on a class,
// give them a name, and not much else. The methods are
// typically get_ and set_ methods, already defined on the
// class, and inserted like any other methods into the
// MethodDef table.
// -----------------------------------------------------------------
class PropertyTable :: TableBase
{
    short theFlags. // a 2 byte bitmask of type PropertyAttributes, clause 22.1.13
    int theName. // index into String heap
    int theType. // index into Blob heap
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        theFlags := $self readInt16.
        theName := $self readStringsIndex.
        theType := $self readBlobIndex.
    ]
}

// -----------------------------------------------------------------
// The PropertyMap and Property tables result from putting the
// .property directive on a class (see Chapter 16).
// -----------------------------------------------------------------
class PropertyMapTable :: TableBase
{
    int theParent. // index into the TypeDef table
    int thePropertyList. // index into Property table
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        //theParent = ReadIndex(MetadataTables.TypeDef);
        //thePropertyList = ReadIndex(MetadataTables.Property);
    ]
}

// -----------------------------------------------------------------
// Signatures are stored in the metadata Blob heap. In most
// cases, they are indexed by a column in some table --
// Field.Signature, Method.Signature, MemberRef.Signature, etc.
// However, there are two cases that require a metadata token
// for a signature that is not indexed by any metadata table.
// The StandAloneSig table fulfils this need. It has just one
// column, that points to a Signature in the Blob heap.
// -----------------------------------------------------------------
class StandAloneSigTable :: TableBase
{
    int theSignature. // index into the Blob heap
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        theSignature := $self readBlobIndex.
    ]
}

class TypeDefTable :: TableBase
{
    int theFlags. // a 4 byte bitmask of type TypeAttributes, clause 22.1.14
    int theName. // index into String heap
    int theNamespace. // index into String heap
    int theExtends. // index into TypeDef, TypeRef or TypeSpec table; more precisely, a TypeDefOrRef coded index
    int theFieldList. // index into Field table; it marks the first of a continguous run of Fields owned by this Type
    int theMethodList. // index into MethodDef table
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        theFlags := $self readInt32.
        theName := $self readStringsIndex.
        theNamespace := $self readStringsIndex.
        theExtends := $self readIndex metadatatables:cdIdcTypeDefOrRef.
        theFieldList := $self readIndex metadatatables:mdTfield.
        //theMethodList := ReadIndex(MetadataTables.MethodDef);
    ]
    
    setChildren children:aChild [ theChildren := aChild. ]
    fieldList = theFieldList.
}

class TypeRefTable :: TableBase
{
    // index into Module, ModuleRef, AssemblyRef or TypeRef tables,
    // or null; more precisely, a ResolutionScope coded index
    int theResolutionScope.

    int theName. // index into String heap
    int theNamespace. // index into String heap
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        theResolutionScope := $self readIndex metadatatables:cdIdcResolutionScope.
        theName := $self readStringsIndex.
        theNamespace := $self readStringsIndex.
    ]
}

// -----------------------------------------------------------------
// The TypeSpec table has just one column, which indexes the
// specification of a Type, stored in the Blob heap. This
// provides a metadata token for that Type (rather than simply
// an index into the Blob heap) -- this is required, typically,
// for array operations ・creating, or calling methods on the
// array class.
// -----------------------------------------------------------------
class TypeSpecTable :: TableBase
{
    int theSignature. // index into the Blob heap, where the blob is formatted as specified in clause 22.2.14
    
    constructor new bytearray:data int:offset
    [
        $self readTData bytearray:data int:offset.
        //$self readData.
    ]

    readData
    [
        theSignature := $self readBlobIndex.
    ]
}
