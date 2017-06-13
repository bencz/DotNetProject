import system.

class MethodData
{
    constructor new pedata:aPeData methodDefTable:aMethodDefTable
    [
        $self parse pedata:aPeData methoddeftable:aMethodDefTable.
    ]
    
    constructor new pedata:aPeData methodRefTable:aMethodRefTable
    [
        $self parse pedata:aPeData memberreftable:aMethodRefTable.
    ]
    
    parse pedata:aPeData methoddeftable:mDef
    [
    ]
    
    parse pedata:aPeData memberreftable:mRef
    [
    ]
}