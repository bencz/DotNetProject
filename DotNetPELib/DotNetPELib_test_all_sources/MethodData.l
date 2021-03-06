import system.
import system'text.
import system'routines.
import system'collections.
import extensions.

class MethodData
{
    object thePeData.
    object theTableBase.
    int theFlags.
    int theSize.
    object theReturnType.
    int theMaxStack.
    int theCodeSize.
    int theLocalVariableSigToken.
    object theLocalVariablesSig.
    list theLocalVariables.
    list theIlCodes.
    int theIlAddress.
    int theSignatureFlags.
    int theParametersCount.
    object theImplMap.
    int theKind.
    int theDataSize.
    list theEHTable.
    object theOpCodesTable.
    
    constructor new pedata:aPeData table:aMethodDefTable
    [
        $self init pedata:aPeData table:aMethodDefTable.
        $self parse.
    ]
    
    init pedata:aPeData table:aTableBase
    [
        thePeData := aPeData.
        theTableBase := aTableBase.
        theFlags := 0.
        theSize := 0.
        theMaxStack := 0.
        theCodeSize := 0.
        theLocalVariableSigToken := 0.
        theIlCodes := $nil.
        theIlAddress := 0.
        theLocalVariablesSig := $nil.
        theLocalVariables := $nil.
        theImplMap := $nil.
        theKind := 0.
        theDataSize := 0.
        theEHTable := $nil.
        
        theOpCodesTable := Opcodes getAllOpCodes.
    ]
    
    parse 
    [
        $self readSignatures.
        int address := $self RVA.
        if(address == 0) [ ^$nil. ].
        
        int mtType := (thePeData data)@address.
        if((mtType && 3h) == (CorILMethod TinyFormat))
        [
            theCodeSize := mtType >> 2.
            address := address + 1.
        ];
        [
            mtType := Util getInt16 bytearray:(thePeData data) int:address.
            theFlags := mtType && 0fffh.
            theSize := (mtType >> 12) * 4.
            address := address + 2.   
            theMaxStack := Util getInt16 bytearray:(thePeData data) int:address.
            address := address + 2.
            theCodeSize := Util getInt32 bytearray:(thePeData data) int:address.
            address := address + 4.
            theLocalVariableSigToken := Util getInt32 bytearray:(thePeData data) int:address.
            address := address + 4.
            $self readLocalVariables.
        ].
        
        theIlAddress := address.
        address := address + theCodeSize.
        if((theFlags && (CorILMethod MoreSects)) == 0) [ ^$nil. ].
        
        // has more sections to parse...
        int pad := 4 - (address && 3).
        if(pad < 4) [ address := address + pad. ].
        int end := address.
        theKind := (thePeData data)@(address).
        //
        address := address + 1.
        bool isFat := (theKind && (CorILMethod_Sect FatFormat)) != 0.
        if(isFat == false) 
        [
            theDataSize := (thePeData data)@(address).
        ];
        [
            theDataSize := Util getInt24 bytearray:(thePeData data) int:address.
        ].
        
        address := address + 3.
        end := end + theDataSize.
        
        theEHTable := List new.
        while(address < end)
        [
            var ex := ExceptionHandlingClauses new.
            if(isFat == false)
            [
                ex setFlags int:(Util getInt16 bytearray:(thePeData data) int:address).
                address := address + 2.
                ex setTryOffset int:(Util getInt16 bytearray:(thePeData data) int:address).
                address := address + 2.
                ex setTryLength int:((thePeData data)@address).
                address := address + 1.
                ex setHandlerOffset int:(Util getInt16 bytearray:(thePeData data) int:address).
                address := address + 2.
                ex setHandlerLength int:((thePeData data)@address).
                address := address + 1.
            ];
            [
                ex setFlags int:(Util getInt32 bytearray:(thePeData data) int:address).
                address := address + 4.
                ex setTryOffset int:(Util getInt32 bytearray:(thePeData data) int:address).
                address := address + 4.
                ex setTryLength int:(Util getInt32 bytearray:(thePeData data) int:address).
                address := address + 4.
                ex setHandlerOffset int:(Util getInt32 bytearray:(thePeData data) int:address).
                address := address + 4.
                ex setHandlerLength int:(Util getInt32 bytearray:(thePeData data) int:address).
                address := address + 4.
            ].
            
            if((ex flags) == (COR_ILEXCEPTION_CLAUSE EXCEPTION))
            [
                ex setClassToken int:(Util getInt32 bytearray:(thePeData data) int:address).
            ];
            [
                ex setFilterOffset int:(Util getInt32 bytearray:(thePeData data) int:address).
            ].
            
            address := address + 4.
            theEHTable append:ex.
        ].
    ]
    
    readSignatures
    [
        int sig := 0.
        
        if((theTableBase class_ref) == MethodDefTable)
        [
            sig := theTableBase signature.
        ].
        if((theTableBase class_ref) == MemberRefTable)
        [
            sig := theTableBase signature.
            if($nil == (theTableBase children))
            [
                var lst := Array new int:1.
                lst@0 := List new.
                
                theTableBase setChildren children:lst.
            ].
        ].
        
        int address := ((thePeData indexManager) blobOffset) + sig.
        var dtSize := Util getDataSize bytearray:(thePeData data) int:address.
        address := address + (dtSize A).
        theSignatureFlags := (thePeData data)@(address).
        address := address + 1.
        if($self isField)
        [
            theReturnType := (thePeData indexManager) readType int:address.
            ^$nil.
        ].
        
        var count := Util getDataSize bytearray:(thePeData data) int:address.
        theParametersCount := count B.
        address := address + (count A).
        theReturnType := (thePeData indexManager) readType int:address.
        address := address + (theReturnType size).
        
        int i := 0.
        while(i < theParametersCount)
        [
            var tp := (thePeData indexManager) readType int:address.
            
            if((theTableBase class_ref) == MethodDefTable)
            [
                (theTableBase getChildren int:0 int:i) setTag tag:tp.
            ];
            [
                theTableBase appendChildren children:tp int:0.
            ].
            
            address := address + (tp size).
            i := i + 1.
        ].
    ]
    
    readLocalVariables
    [
        theLocalVariablesSig := (thePeData indexManager) getTable int:theLocalVariableSigToken.
        if($nil == theLocalVariablesSig) [ ^$nil. ].
        int address := ((thePeData indexManager) blobOffset) + (theLocalVariablesSig signature).
        var dataSize := Util getDataSize bytearray:(thePeData data) int:address.
        address := address + (dataSize A).
        address := address + 1.
        var count := Util getDataSize bytearray:(thePeData data) int:address.
        address := address + (dataSize A).
        theLocalVariables := List new.
        int i := 0.
        while(i < (count B))
        [
            var ds := (thePeData indexManager) readType int:address.
            theLocalVariables append:(ds).
            address := address + (ds size).
            i := i + 1.
        ].
    ]
    
    getILCodes
    [
        if($nil != theIlCodes)
            [ ^theIlCodes. ].
        if($nil == theIlAddress)
            [ ^$nil. ].
            
        int address := theIlAddress.
        int end := address + theCodeSize.
        list lst := List new.
        while(address < end)
        [
            var il := $self readIL int:address.
            lst append:il.
            address := address + (il opCodeLength) + (il operandLength). 
        ].
        
        theIlCodes := lst.
        
        lst run each:(:il)
        [
            int addr := Util getBrTarget ilCode:il. 
            if(addr != 0)
            [        
                int i := 0.
                bool continue := true.
                while((continue == true) && (i < (theIlCodes length)))
                [
                    var il2 := theIlCodes@i.
                    if((il2 address) == addr)
                    [
                        il2 setIsBrTarget bool:true.
                        continue := false.
                    ].
                    i := i + 1.
                ].
            ].
        ].
        
        ^lst.
    ]
    
    readIL int:aAddress
    [
        int ad := aAddress.
        var il := ILCode new.
        il setAddress int:ad.
        
        int v := (thePeData data)@ad.
        ad := ad + 1.
        
        il setOpCodeLength int:1.
        
        if(v == 0FEh)
        [
            v := 0100h + ((thePeData data)@ad).
            ad := ad + 1.
            il setOpCodeLength int:2.
        ].
        
        il setOpCode opcode:(theOpCodesTable@v).
        
        var ilOpType := (il opCode) operandType.
        if(ilOpType == OpOperTypeInlineNone)
        [
            il setOperand operand:$nil.
            il setOperandLength int:0.
            ^il.
        ]. 
        
        if((ilOpType == OpOperTypeShortInlineBrTarget) || 
           (ilOpType == OpOperTypeShortInlineVar) || 
           (ilOpType == OpOperTypeShortInlineI))
        [
            il setOperand operand:((thePeData data)@ad).
            il setOperandLength int:1.
            ^il.
        ].
        
        if(ilOpType == OpOperTypeInlineVar)
        [
            il setOperand operand:(Util getInt16 bytearray:(thePeData data) int:ad).
            il setOperandLength int:2.
            ^il.
        ].
        
        if((ilOpType == OpOperTypeInlineBrTarget) || (ilOpType == OpOperTypeInlineField) || 
           (ilOpType == OpOperTypeInlineI) || (ilOpType == OpOperTypeInlineMethod) || 
           (ilOpType == OpOperTypeInlineSig) || (ilOpType == OpOperTypeInlineString) || 
           (ilOpType == OpOperTypeInlineTok) || (ilOpType == OpOperTypeInlineType) || 
           (ilOpType == OpOperTypeShortInlineR))
        [
            il setOperand operand:(Util getInt32 bytearray:(thePeData data) int:ad).
            il setOperandLength int:4.
            ^il.
        ].
        
        if((ilOpType == OpOperTypeInlineI8) ||
           (ilOpType == OpOperTypeInlineR))
        [
            il setOperand operand:(Util getInt64 bytearray:(thePeData data) int:ad).
            il setOperandLength int:8.
            ^il.
        ].
        
        if(ilOpType == OpOperTypeInlineSwitch)
        [
            il setOperand operand:(Util getInt32 bytearray:(thePeData data) int:ad).
            
            int ilo := il operand.
            int tst := (4 + ilo * 4).
            il setOperandLength int:(4 + ilo * 4).
            ^il.
        ].
    ]
    
    RVA
    [
        if((theTableBase class_ref) == MethodDefTable)
        [
            if((theTableBase RVA) == 0) [ ^0. ].
            ^ (thePeData rva) convertToPhysical int:(theTableBase RVA).
        ]; [ ^0. ].
    ]
    
    isField
    [
        if((theTableBase class_ref) != MemberRefTable)
            [ ^false. ];
            [
                if(theSignatureFlags == 6) [ ^true. ].
            ].
        ^false.
    ]
    
    hasThis
    [
        ^((theSignatureFlags && (MethodFlags HASTHIS)) != 0).
    ]
    
    name
    [
        if((theTableBase class_ref) == MethodDefTable)
        [
            ^(thePeData indexManager) getName methodDefTable:theTableBase.
        ].
        if((theTableBase class_ref) == MemberRefTable)
        [
            ^(thePeData indexManager) getName memberRefTable:theTableBase.
        ].
        ^$nil.
    ]
    
    fullName
    [
        textbuffer rt := TextBuilder new.
        if($self hasThis) [ rt append:"instance ". ].
        rt append:((thePeData indexManager) getName typeData:theReturnType).
        rt append:" ".
        rt append:($self name).
        if($self isField) 
            [ ^rt literal. ].
        rt append:"(".
        int i := 0.
        while(i < theParametersCount)
        [
            if(i > 0) [ rt append:", ". ].
            var obj := theTableBase getChildren int:0 int:i.
            bool continue := false.
            if($nil != obj)
            [
                if((obj class_ref) == ParamTable)
                [
                    rt append:((thePeData indexManager) getName typeData:(obj getTag)).
                    continue := true.
                ].
                if((obj class_ref) == TypeData)
                [
                    rt append:((thePeData indexManager) getName typeData:obj).
                    continue := true.
                ].
                if(continue == false)
                [
                    rt append:"???".
                ].
            ].
            i := i + 1.
        ].
        rt append:")".
        ^(rt literal).  
    ]
    
    setImplMap implMap:aImplMap [ theImplMap := aImplMap. ]
    
    localVariablesSig = theLocalVariablesSig.
}