import system.

extension CorILMethod
{
    FatFormat = 3h. // Method header is fat.
    TinyFormat = 2h. // Method header is tiny.
    MoreSects = 8h. // More sections follow after this header (see Section 24.4.5).
    InitLocals = 10h. // Call default constructor on all local variables.
}

extension ELEMENT_TYPE
{
    END = 00h.
    VOID = 01h.
    BOOLEAN = 02h.
    CHAR = 03h.
    I1 = 04h.
    U1 = 05h.
    I2 = 06h.
    U2 = 07h.
    I4 = 08h.
    U4 = 09h.
    I8 = 0ah.
    U8 = 0bh.
    R4 = 0ch.
    R8 = 0dh.
    STRING = 0eh.
    
    PTR = 0fh. // Followed by <type> token
    BYREF = 10h. // Followed by <type> token
    VALUETYPE = 11h. // Followed by TypeDef or TypeRef token
    CLASS = 12h. // Followed by TypeDef or TypeRef token
    
    // <type> <rank> <boundsCount> <bound1> … <loCount> <lo1> …
    ARRAY = 14h.
    TYPEDBYREF = 16h.
    
    I = 18h. // System.IntPtr
    U = 19h. // System.UIntPtr
    FNPTR = 1bh. // Followed by full method signature
    OBJECT = 1ch. // System.Object
    SZARRAY = 1dh. // Single-dim array with 0 lower bound
    CMOD_REQD = 1fh. // Required modifier : followed by a TypeDef or TypeRef token
    CMOD_OPT = 20h. // Optional modifier : followed by a TypeDef or TypeRef token
    INTERNAL = 21h. // Implemented within the CLI
    MODIFIER = 40h. // Or'd with following element types
    SENTINEL = 41h. // Sentinel for varargs method signature
    PINNED = 45h. // Denotes a local variable that points at a pinned object
}

extension MethodFlags
{
    HASTHIS = 20h. // used to encode the keyword instance in the calling convention, see Section 14.3
    EXPLICITTHIS = 40h. // used to encode the keyword explicit in the calling convention, see Section 14.3
    DEFAULT = 0h. // used to encode the keyword default in the calling convention, see Section 14.3
    VARARG = 5h. // used to encode the keyword vararg in the calling convention, see Section 14.3
    C = 1.
    STDCALL = 2.
    THISCALL = 3.
    FASTCALL = 4.
}

extension MethodAttributes
{
    MemberAccessMask = 0007h.
    CompilerControlled = 0000h. // Member not referenceable
    Private = 0001h. // Accessible only by the parent type
    FamANDAssem = 0002h. // Accessible by sub-types only in this Assembly
    Assem = 0003h. // Accessibly by anyone in the Assembly
    Family = 0004h. // Accessible only by type and sub-types
    FamORAssem = 0005h. // Accessibly by sub-types anywhere, plus anyone in assembly
    Public = 0006h. // Accessibly by anyone who has visibility to this scope
    Static = 0010h. // Defined on type, else per instance
    Final = 0020h. // Method may not be overridden<
    Virtual = 0040h. // Method is virtual
    HideBySig = 0080h. // Method hides by name+sig, else just by name
    VtableLayoutMask = 0100h. // Use this mask to retrieve vtable attributes
    ReuseSlot = 0000h. // Method reuses existing slot in vtable
    NewSlot = 0100h. // Method always gets a new slot in the vtable
    Abstract = 0400h. // Method does not provide an implementation
    SpecialName = 0800h. // Method is special

    // Interop attributes
    PInvokeImpl = 2000h. // Implementation is forwarded through PInvoke
    UnmanagedExport = 0008h. // Reserved: shall be zero for conforming implementations

    // Additional flags
    RTSpecialName = 1000h. // CLI provides 'special' behavior, depending upon the name of the method
    HasSecurity = 4000h. // Method has security associate with it
    RequireSecObject = 8000h. // Method calls another method containing security code.
}

extension CodeTypeMask 
{
    IL = 0000h. // Method impl is CIL
    Native = 0001h. // Method impl is native
    OPTIL = 0002h. // Reserved: shall be zero in conforming implementations
    Runtime = 0003. // Method impl is provided by the runtime
}

// -----------------------------------------------------------------
//Flags specifying whether the code is managed or unmanaged.
// -----------------------------------------------------------------
extension ManagedMask
{
    Unmanaged = 0004h. //Method impl is unmanaged, otherwise managed
    Managed = 0000h. //Method impl is managed
}

// -----------------------------------------------------------------
// Implementation info and interop
// -----------------------------------------------------------------
extension MethodImplAttributes
{
    ForwardRef = 0010h. //Indicates method is defined; used primarily in merge scenarios
    PreserveSig = 0080h. //Reserved: conforming implementations may ignore
    InternalCall = 1000h. //Reserved: shall be zero in conforming implementations
    Synchronized = 0020h. //Method is single threaded through the body
    NoInlining = 0008h. //Method may not be inlined
    MaxMethodImplVal = 0ffffh. //Range check value
}

// -----------------------------------------------------------------
/// Use this mask to retrieve visibility information
// -----------------------------------------------------------------
extension VisibilityMask
{
    NotPublic = 00000000h. //Class has no public scope
    Public = 00000001h. //Class has public scope
    NestedPublic = 00000002h. //Class is nested with public visibility
    NestedPrivate = 00000003h. //Class is nested with private visibility
    NestedFamily = 00000004h. //Class is nested with family visibility
    NestedAssembly = 00000005h. //Class is nested with assembly visibility
    NestedFamANDAssem = 00000006h. //Class is nested with family and assembly visibility
    NestedFamORAssem = 00000007h. //Class is nested with family or assembly visibility
}

// -----------------------------------------------------------------
/// Use this mask to retrieve class layout information
// -----------------------------------------------------------------
extension LayoutMask
{
    AutoLayout = 00000000h. //Class fields are auto-laid out
    SequentialLayout = 00000008h. //Class fields are laid out sequentially
    ExplicitLayout = 00000010h. //Layout is supplied explicitly
}

// -----------------------------------------------------------------
/// Use this mask to retrive class semantics information
// -----------------------------------------------------------------
extension ClassSemanticsMask
{
    Class = 00000000h. //Type is a class
    Interface = 00000020h. //Type is an interface
}

extension TypeAttributes
{
    // Special semantics in addition to class semantics
    Abstract = 00000080h. //Class is abstract
    Sealed = 00000100h. //Class cannot be extended
    SpecialName = 00000400h. //Class name is special

    // Implementation Attributes
    Import = 00001000h. //Class/Interface is imported
    Serializable = 00002000h. //Class is serializable

    // String formatting Attributes
    StringFormatMask = 00030000h. //Use this mask to retrieve string information for native interop
    AnsiClass = 00000000h. //LPSTR is interpreted as ANSI
    UnicodeClass = 00010000h. //LPSTR is interpreted as Unicode
    AutoClass = 00020000h. //LPSTR is interpreted automatically

    // Class Initialization Attributes
    BeforeFieldInit = 00100000h. //Initialize the class before first static field access

    // Additional Flags
    RTSpecialName = 00000800h. //CLI provides 'special' behavior, depending upon the name of the Type
    HasSecurity = 00040000h. //Type has security associate with it
}

extension ParamAttributes
{
    In = 0001h. //Param is [In]
    Out = 0002h. //Param is [out]
    Optional = 0010h. //Param is optional
    HasDefault = 1000h. //Param has default value
    HasFieldMarshal = 2000h. //Param has FieldMarshal
    Unused = 0cfe0h. //Reserved: shall be zero in a conforming implementation
}

extension FieldAccessMask
{
    CompilerControlled = 0000h. //Member not referenceable
    Private = 0001h. //Accessible only by the parent type
    FamANDAssem = 0002h. //Accessible by sub-types only in this Assembly
    Assembly = 0003h. //Accessibly by anyone in the Assembly
    Family = 0004h. //Accessible only by type and sub-types
    FamORAssem = 0005h. //Accessibly by sub-types anywhere, plus anyone in assembly
    Public = 0006h. //Accessibly by anyone who has visibility to this scope field contract attributes
}

extension FieldAttributes
{
    Static = 0010h. //Defined on type, else per instance
    InitOnly = 0020h. //Field may only be initialized, not written to after init
    Literal = 0040h. //Value is compile time constant
    NotSerialized = 0080h. //Field does not have to be serialized when type is remoted
    SpecialName = 0200h. //Field is special

    // Interop Attributes
    PInvokeImpl = 2000h. //Implementation is forwarded through PInvoke.

    // Additional flags
    RTSpecialName = 0400h. //CLI provides 'special' behavior, depending upon the name of the field
    HasFieldMarshal = 1000h. //Field has marshalling information
    HasDefault = 8000h. //Field has default
    HasFieldRVA = 0100h. //Field has RVA
}

extension CorILMethod_Sect
{
    EHTable = 1h. //Exception handling data.
    OptILTable = 2h. //Reserved, shall be 0.
    FatFormat = 40h. //Data format is of the fat variety, meaning there is a 3 byte length.  If not set, the header is small with a  1 byte length
    MoreSects = 80h. //Another data section occurs after this current section
}


extension COR_ILEXCEPTION_CLAUSE
{
    EXCEPTION = 0000h. //A typed exception clause
    FILTER = 0001h. //An exception filter and handler clause
    FINALLY = 0002h. //A finally clause
    FAULT = 0004h. //Fault clause (finally that is called on exception only)
}

struct DoubleInt
{
    int theA.
    int theB.
    
    setA int:a [ theA := a. ]
    setB int:b [ theB := b. ]
    
    A = theA.
    B = theB.
}

struct TypeData
{
    int theSize.
    int theToken.
    
    // ELEMENT_TYPE
    int theElement.
    int theOption.
}

class OpCode { }

class ILCode
{
    int theAddress.
    object theOpCode.
    int theOpCodeLength.
    object theOperand.
    int theOperandLength.
    bool theIsBrTarget.
}

extension Children
{
    int DefNested = 0.
    int DefMethod = 1.
    int DefField  = 2.
    int RefNested = 0.
    int RefMethod = 1.
    int RefField  = 2.
}