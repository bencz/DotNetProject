import system.
import system'collections.

class OpCode
{
    int theOperandType.
    int theFlowControl.
    int theOpCodeType.
    int theStackBehaviourPop.
    int theStackBehaviourPush.
    int theSize.
    short theValue.
    literal theName.
    
    constructor new literal:aName
    [
        theName := aName.
    ]
    
    setOperandType int:aOperandType [ theOperandType := aOperandType. ]
    setFlowControl int:aFlowControl [ theFlowControl := aFlowControl. ]
    setOpCodeType int:aOpCodeType [ theOpCodeType := aOpCodeType. ]
    setStackBehaviourPop int:aStackBehaviourPop [ theStackBehaviourPop := aStackBehaviourPop. ]
    setStackBehaviourPush int:aStackBehaviourPush [ theStackBehaviourPush := aStackBehaviourPush. ]
    setSize int:aSize [ theSize := aSize. ]
    setValue short:aValue [ theValue := aValue. ]
    
    operandType = theOperandType.
    flowControl = theFlowControl.
    opCodeType = theOpCodeType.
    stackBehaviourPop = theStackBehaviourPop.
    stackBehaviourPush = theStackBehaviourPush.
    size = theSize.
    value = theValue.
    name = theName.
}

extension Opcodes
{
    getAllOpCodes
    [
        var ret := Dictionary new.
        
        // Create instance of opcode: nop
        ret@0 := OpCode new literal:"nop".
        (ret@0) setOperandType int:OpOperTypeInlineNone.
        (ret@0) setFlowControl int:OpFlowNext.
        (ret@0) setOpCodeType int:OpTypePrimitive.
        (ret@0) setStackBehaviourPop int:IlBPop0.
        (ret@0) setStackBehaviourPush int:IlBPush0.
        (ret@0) setSize int:1.
        (ret@0) setValue short:00h.

        // Create instance of opcode: break
        ret@1 := OpCode new literal:"break".
        (ret@1) setOperandType int:OpOperTypeInlineNone.
        (ret@1) setFlowControl int:OpFlowBreak.
        (ret@1) setOpCodeType int:OpTypePrimitive.
        (ret@1) setStackBehaviourPop int:IlBPop0.
        (ret@1) setStackBehaviourPush int:IlBPush0.
        (ret@1) setSize int:1.
        (ret@1) setValue short:01h.

        // Create instance of opcode: ldarg.0
        ret@2 := OpCode new literal:"ldarg.0".
        (ret@2) setOperandType int:OpOperTypeInlineNone.
        (ret@2) setFlowControl int:OpFlowNext.
        (ret@2) setOpCodeType int:OpTypeMacro.
        (ret@2) setStackBehaviourPop int:IlBPop0.
        (ret@2) setStackBehaviourPush int:IlBPush1.
        (ret@2) setSize int:1.
        (ret@2) setValue short:02h.

        // Create instance of opcode: ldarg.1
        ret@3 := OpCode new literal:"ldarg.1".
        (ret@3) setOperandType int:OpOperTypeInlineNone.
        (ret@3) setFlowControl int:OpFlowNext.
        (ret@3) setOpCodeType int:OpTypeMacro.
        (ret@3) setStackBehaviourPop int:IlBPop0.
        (ret@3) setStackBehaviourPush int:IlBPush1.
        (ret@3) setSize int:1.
        (ret@3) setValue short:03h.

        // Create instance of opcode: ldarg.2
        ret@4 := OpCode new literal:"ldarg.2".
        (ret@4) setOperandType int:OpOperTypeInlineNone.
        (ret@4) setFlowControl int:OpFlowNext.
        (ret@4) setOpCodeType int:OpTypeMacro.
        (ret@4) setStackBehaviourPop int:IlBPop0.
        (ret@4) setStackBehaviourPush int:IlBPush1.
        (ret@4) setSize int:1.
        (ret@4) setValue short:04h.

        // Create instance of opcode: ldarg.3
        ret@5 := OpCode new literal:"ldarg.3".
        (ret@5) setOperandType int:OpOperTypeInlineNone.
        (ret@5) setFlowControl int:OpFlowNext.
        (ret@5) setOpCodeType int:OpTypeMacro.
        (ret@5) setStackBehaviourPop int:IlBPop0.
        (ret@5) setStackBehaviourPush int:IlBPush1.
        (ret@5) setSize int:1.
        (ret@5) setValue short:05h.

        // Create instance of opcode: ldloc.0
        ret@6 := OpCode new literal:"ldloc.0".
        (ret@6) setOperandType int:OpOperTypeInlineNone.
        (ret@6) setFlowControl int:OpFlowNext.
        (ret@6) setOpCodeType int:OpTypeMacro.
        (ret@6) setStackBehaviourPop int:IlBPop0.
        (ret@6) setStackBehaviourPush int:IlBPush1.
        (ret@6) setSize int:1.
        (ret@6) setValue short:06h.

        // Create instance of opcode: ldloc.1
        ret@7 := OpCode new literal:"ldloc.1".
        (ret@7) setOperandType int:OpOperTypeInlineNone.
        (ret@7) setFlowControl int:OpFlowNext.
        (ret@7) setOpCodeType int:OpTypeMacro.
        (ret@7) setStackBehaviourPop int:IlBPop0.
        (ret@7) setStackBehaviourPush int:IlBPush1.
        (ret@7) setSize int:1.
        (ret@7) setValue short:07h.

        // Create instance of opcode: ldloc.2
        ret@8 := OpCode new literal:"ldloc.2".
        (ret@8) setOperandType int:OpOperTypeInlineNone.
        (ret@8) setFlowControl int:OpFlowNext.
        (ret@8) setOpCodeType int:OpTypeMacro.
        (ret@8) setStackBehaviourPop int:IlBPop0.
        (ret@8) setStackBehaviourPush int:IlBPush1.
        (ret@8) setSize int:1.
        (ret@8) setValue short:08h.

        // Create instance of opcode: ldloc.3
        ret@9 := OpCode new literal:"ldloc.3".
        (ret@9) setOperandType int:OpOperTypeInlineNone.
        (ret@9) setFlowControl int:OpFlowNext.
        (ret@9) setOpCodeType int:OpTypeMacro.
        (ret@9) setStackBehaviourPop int:IlBPop0.
        (ret@9) setStackBehaviourPush int:IlBPush1.
        (ret@9) setSize int:1.
        (ret@9) setValue short:09h.

        // Create instance of opcode: stloc.0
        ret@10 := OpCode new literal:"stloc.0".
        (ret@10) setOperandType int:OpOperTypeInlineNone.
        (ret@10) setFlowControl int:OpFlowNext.
        (ret@10) setOpCodeType int:OpTypeMacro.
        (ret@10) setStackBehaviourPop int:IlBPop1.
        (ret@10) setStackBehaviourPush int:IlBPush0.
        (ret@10) setSize int:1.
        (ret@10) setValue short:0Ah.

        // Create instance of opcode: stloc.1
        ret@11 := OpCode new literal:"stloc.1".
        (ret@11) setOperandType int:OpOperTypeInlineNone.
        (ret@11) setFlowControl int:OpFlowNext.
        (ret@11) setOpCodeType int:OpTypeMacro.
        (ret@11) setStackBehaviourPop int:IlBPop1.
        (ret@11) setStackBehaviourPush int:IlBPush0.
        (ret@11) setSize int:1.
        (ret@11) setValue short:0Bh.

        // Create instance of opcode: stloc.2
        ret@12 := OpCode new literal:"stloc.2".
        (ret@12) setOperandType int:OpOperTypeInlineNone.
        (ret@12) setFlowControl int:OpFlowNext.
        (ret@12) setOpCodeType int:OpTypeMacro.
        (ret@12) setStackBehaviourPop int:IlBPop1.
        (ret@12) setStackBehaviourPush int:IlBPush0.
        (ret@12) setSize int:1.
        (ret@12) setValue short:0Ch.

        // Create instance of opcode: stloc.3
        ret@13 := OpCode new literal:"stloc.3".
        (ret@13) setOperandType int:OpOperTypeInlineNone.
        (ret@13) setFlowControl int:OpFlowNext.
        (ret@13) setOpCodeType int:OpTypeMacro.
        (ret@13) setStackBehaviourPop int:IlBPop1.
        (ret@13) setStackBehaviourPush int:IlBPush0.
        (ret@13) setSize int:1.
        (ret@13) setValue short:0Dh.

        // Create instance of opcode: ldarg.s
        ret@14 := OpCode new literal:"ldarg.s".
        (ret@14) setOperandType int:OpOperTypeShortInlineVar.
        (ret@14) setFlowControl int:OpFlowNext.
        (ret@14) setOpCodeType int:OpTypeMacro.
        (ret@14) setStackBehaviourPop int:IlBPop0.
        (ret@14) setStackBehaviourPush int:IlBPush1.
        (ret@14) setSize int:1.
        (ret@14) setValue short:0Eh.

        // Create instance of opcode: ldarga.s
        ret@15 := OpCode new literal:"ldarga.s".
        (ret@15) setOperandType int:OpOperTypeShortInlineVar.
        (ret@15) setFlowControl int:OpFlowNext.
        (ret@15) setOpCodeType int:OpTypeMacro.
        (ret@15) setStackBehaviourPop int:IlBPop0.
        (ret@15) setStackBehaviourPush int:IlBPushi.
        (ret@15) setSize int:1.
        (ret@15) setValue short:0Fh.

        // Create instance of opcode: starg.s
        ret@16 := OpCode new literal:"starg.s".
        (ret@16) setOperandType int:OpOperTypeShortInlineVar.
        (ret@16) setFlowControl int:OpFlowNext.
        (ret@16) setOpCodeType int:OpTypeMacro.
        (ret@16) setStackBehaviourPop int:IlBPop1.
        (ret@16) setStackBehaviourPush int:IlBPush0.
        (ret@16) setSize int:1.
        (ret@16) setValue short:010h.

        // Create instance of opcode: ldloc.s
        ret@17 := OpCode new literal:"ldloc.s".
        (ret@17) setOperandType int:OpOperTypeShortInlineVar.
        (ret@17) setFlowControl int:OpFlowNext.
        (ret@17) setOpCodeType int:OpTypeMacro.
        (ret@17) setStackBehaviourPop int:IlBPop0.
        (ret@17) setStackBehaviourPush int:IlBPush1.
        (ret@17) setSize int:1.
        (ret@17) setValue short:011h.

        // Create instance of opcode: ldloca.s
        ret@18 := OpCode new literal:"ldloca.s".
        (ret@18) setOperandType int:OpOperTypeShortInlineVar.
        (ret@18) setFlowControl int:OpFlowNext.
        (ret@18) setOpCodeType int:OpTypeMacro.
        (ret@18) setStackBehaviourPop int:IlBPop0.
        (ret@18) setStackBehaviourPush int:IlBPushi.
        (ret@18) setSize int:1.
        (ret@18) setValue short:012h.

        // Create instance of opcode: stloc.s
        ret@19 := OpCode new literal:"stloc.s".
        (ret@19) setOperandType int:OpOperTypeShortInlineVar.
        (ret@19) setFlowControl int:OpFlowNext.
        (ret@19) setOpCodeType int:OpTypeMacro.
        (ret@19) setStackBehaviourPop int:IlBPop1.
        (ret@19) setStackBehaviourPush int:IlBPush0.
        (ret@19) setSize int:1.
        (ret@19) setValue short:013h.

        // Create instance of opcode: ldnull
        ret@20 := OpCode new literal:"ldnull".
        (ret@20) setOperandType int:OpOperTypeInlineNone.
        (ret@20) setFlowControl int:OpFlowNext.
        (ret@20) setOpCodeType int:OpTypePrimitive.
        (ret@20) setStackBehaviourPop int:IlBPop0.
        (ret@20) setStackBehaviourPush int:IlBPushref.
        (ret@20) setSize int:1.
        (ret@20) setValue short:014h.

        // Create instance of opcode: ldc.i4.m1
        ret@21 := OpCode new literal:"ldc.i4.m1".
        (ret@21) setOperandType int:OpOperTypeInlineNone.
        (ret@21) setFlowControl int:OpFlowNext.
        (ret@21) setOpCodeType int:OpTypeMacro.
        (ret@21) setStackBehaviourPop int:IlBPop0.
        (ret@21) setStackBehaviourPush int:IlBPushi.
        (ret@21) setSize int:1.
        (ret@21) setValue short:015h.

        // Create instance of opcode: ldc.i4.0
        ret@22 := OpCode new literal:"ldc.i4.0".
        (ret@22) setOperandType int:OpOperTypeInlineNone.
        (ret@22) setFlowControl int:OpFlowNext.
        (ret@22) setOpCodeType int:OpTypeMacro.
        (ret@22) setStackBehaviourPop int:IlBPop0.
        (ret@22) setStackBehaviourPush int:IlBPushi.
        (ret@22) setSize int:1.
        (ret@22) setValue short:016h.

        // Create instance of opcode: ldc.i4.1
        ret@23 := OpCode new literal:"ldc.i4.1".
        (ret@23) setOperandType int:OpOperTypeInlineNone.
        (ret@23) setFlowControl int:OpFlowNext.
        (ret@23) setOpCodeType int:OpTypeMacro.
        (ret@23) setStackBehaviourPop int:IlBPop0.
        (ret@23) setStackBehaviourPush int:IlBPushi.
        (ret@23) setSize int:1.
        (ret@23) setValue short:017h.

        // Create instance of opcode: ldc.i4.2
        ret@24 := OpCode new literal:"ldc.i4.2".
        (ret@24) setOperandType int:OpOperTypeInlineNone.
        (ret@24) setFlowControl int:OpFlowNext.
        (ret@24) setOpCodeType int:OpTypeMacro.
        (ret@24) setStackBehaviourPop int:IlBPop0.
        (ret@24) setStackBehaviourPush int:IlBPushi.
        (ret@24) setSize int:1.
        (ret@24) setValue short:018h.

        // Create instance of opcode: ldc.i4.3
        ret@25 := OpCode new literal:"ldc.i4.3".
        (ret@25) setOperandType int:OpOperTypeInlineNone.
        (ret@25) setFlowControl int:OpFlowNext.
        (ret@25) setOpCodeType int:OpTypeMacro.
        (ret@25) setStackBehaviourPop int:IlBPop0.
        (ret@25) setStackBehaviourPush int:IlBPushi.
        (ret@25) setSize int:1.
        (ret@25) setValue short:019h.

        // Create instance of opcode: ldc.i4.4
        ret@26 := OpCode new literal:"ldc.i4.4".
        (ret@26) setOperandType int:OpOperTypeInlineNone.
        (ret@26) setFlowControl int:OpFlowNext.
        (ret@26) setOpCodeType int:OpTypeMacro.
        (ret@26) setStackBehaviourPop int:IlBPop0.
        (ret@26) setStackBehaviourPush int:IlBPushi.
        (ret@26) setSize int:1.
        (ret@26) setValue short:01Ah.

        // Create instance of opcode: ldc.i4.5
        ret@27 := OpCode new literal:"ldc.i4.5".
        (ret@27) setOperandType int:OpOperTypeInlineNone.
        (ret@27) setFlowControl int:OpFlowNext.
        (ret@27) setOpCodeType int:OpTypeMacro.
        (ret@27) setStackBehaviourPop int:IlBPop0.
        (ret@27) setStackBehaviourPush int:IlBPushi.
        (ret@27) setSize int:1.
        (ret@27) setValue short:01Bh.

        // Create instance of opcode: ldc.i4.6
        ret@28 := OpCode new literal:"ldc.i4.6".
        (ret@28) setOperandType int:OpOperTypeInlineNone.
        (ret@28) setFlowControl int:OpFlowNext.
        (ret@28) setOpCodeType int:OpTypeMacro.
        (ret@28) setStackBehaviourPop int:IlBPop0.
        (ret@28) setStackBehaviourPush int:IlBPushi.
        (ret@28) setSize int:1.
        (ret@28) setValue short:01Ch.

        // Create instance of opcode: ldc.i4.7
        ret@29 := OpCode new literal:"ldc.i4.7".
        (ret@29) setOperandType int:OpOperTypeInlineNone.
        (ret@29) setFlowControl int:OpFlowNext.
        (ret@29) setOpCodeType int:OpTypeMacro.
        (ret@29) setStackBehaviourPop int:IlBPop0.
        (ret@29) setStackBehaviourPush int:IlBPushi.
        (ret@29) setSize int:1.
        (ret@29) setValue short:01Dh.

        // Create instance of opcode: ldc.i4.8
        ret@30 := OpCode new literal:"ldc.i4.8".
        (ret@30) setOperandType int:OpOperTypeInlineNone.
        (ret@30) setFlowControl int:OpFlowNext.
        (ret@30) setOpCodeType int:OpTypeMacro.
        (ret@30) setStackBehaviourPop int:IlBPop0.
        (ret@30) setStackBehaviourPush int:IlBPushi.
        (ret@30) setSize int:1.
        (ret@30) setValue short:01Eh.

        // Create instance of opcode: ldc.i4.s
        ret@31 := OpCode new literal:"ldc.i4.s".
        (ret@31) setOperandType int:OpOperTypeShortInlineI.
        (ret@31) setFlowControl int:OpFlowNext.
        (ret@31) setOpCodeType int:OpTypeMacro.
        (ret@31) setStackBehaviourPop int:IlBPop0.
        (ret@31) setStackBehaviourPush int:IlBPushi.
        (ret@31) setSize int:1.
        (ret@31) setValue short:01Fh.

        // Create instance of opcode: ldc.i4
        ret@32 := OpCode new literal:"ldc.i4".
        (ret@32) setOperandType int:OpOperTypeInlineI.
        (ret@32) setFlowControl int:OpFlowNext.
        (ret@32) setOpCodeType int:OpTypePrimitive.
        (ret@32) setStackBehaviourPop int:IlBPop0.
        (ret@32) setStackBehaviourPush int:IlBPushi.
        (ret@32) setSize int:1.
        (ret@32) setValue short:020h.

        // Create instance of opcode: ldc.i8
        ret@33 := OpCode new literal:"ldc.i8".
        (ret@33) setOperandType int:OpOperTypeInlineI8.
        (ret@33) setFlowControl int:OpFlowNext.
        (ret@33) setOpCodeType int:OpTypePrimitive.
        (ret@33) setStackBehaviourPop int:IlBPop0.
        (ret@33) setStackBehaviourPush int:IlBPushi8.
        (ret@33) setSize int:1.
        (ret@33) setValue short:021h.

        // Create instance of opcode: ldc.r4
        ret@34 := OpCode new literal:"ldc.r4".
        (ret@34) setOperandType int:OpOperTypeShortInlineR.
        (ret@34) setFlowControl int:OpFlowNext.
        (ret@34) setOpCodeType int:OpTypePrimitive.
        (ret@34) setStackBehaviourPop int:IlBPop0.
        (ret@34) setStackBehaviourPush int:IlBPushr4.
        (ret@34) setSize int:1.
        (ret@34) setValue short:022h.

        // Create instance of opcode: ldc.r8
        ret@35 := OpCode new literal:"ldc.r8".
        (ret@35) setOperandType int:OpOperTypeInlineR.
        (ret@35) setFlowControl int:OpFlowNext.
        (ret@35) setOpCodeType int:OpTypePrimitive.
        (ret@35) setStackBehaviourPop int:IlBPop0.
        (ret@35) setStackBehaviourPush int:IlBPushr8.
        (ret@35) setSize int:1.
        (ret@35) setValue short:023h.

        // Create instance of opcode: dup
        ret@37 := OpCode new literal:"dup".
        (ret@37) setOperandType int:OpOperTypeInlineNone.
        (ret@37) setFlowControl int:OpFlowNext.
        (ret@37) setOpCodeType int:OpTypePrimitive.
        (ret@37) setStackBehaviourPop int:IlBPop1.
        (ret@37) setStackBehaviourPush int:IlBPush1_push1.
        (ret@37) setSize int:1.
        (ret@37) setValue short:025h.

        // Create instance of opcode: pop
        ret@38 := OpCode new literal:"pop".
        (ret@38) setOperandType int:OpOperTypeInlineNone.
        (ret@38) setFlowControl int:OpFlowNext.
        (ret@38) setOpCodeType int:OpTypePrimitive.
        (ret@38) setStackBehaviourPop int:IlBPop1.
        (ret@38) setStackBehaviourPush int:IlBPush0.
        (ret@38) setSize int:1.
        (ret@38) setValue short:026h.

        // Create instance of opcode: jmp
        ret@39 := OpCode new literal:"jmp".
        (ret@39) setOperandType int:OpOperTypeInlineMethod.
        (ret@39) setFlowControl int:OpFlowCall.
        (ret@39) setOpCodeType int:OpTypePrimitive.
        (ret@39) setStackBehaviourPop int:IlBPop0.
        (ret@39) setStackBehaviourPush int:IlBPush0.
        (ret@39) setSize int:1.
        (ret@39) setValue short:027h.

        // Create instance of opcode: call
        ret@40 := OpCode new literal:"call".
        (ret@40) setOperandType int:OpOperTypeInlineMethod.
        (ret@40) setFlowControl int:OpFlowCall.
        (ret@40) setOpCodeType int:OpTypePrimitive.
        (ret@40) setStackBehaviourPop int:IlBVarpop.
        (ret@40) setStackBehaviourPush int:IlBVarpush.
        (ret@40) setSize int:1.
        (ret@40) setValue short:028h.

        // Create instance of opcode: calli
        ret@41 := OpCode new literal:"calli".
        (ret@41) setOperandType int:OpOperTypeInlineSig.
        (ret@41) setFlowControl int:OpFlowCall.
        (ret@41) setOpCodeType int:OpTypePrimitive.
        (ret@41) setStackBehaviourPop int:IlBVarpop.
        (ret@41) setStackBehaviourPush int:IlBVarpush.
        (ret@41) setSize int:1.
        (ret@41) setValue short:029h.

        // Create instance of opcode: ret
        ret@42 := OpCode new literal:"ret".
        (ret@42) setOperandType int:OpOperTypeInlineNone.
        (ret@42) setFlowControl int:OpFlowReturn.
        (ret@42) setOpCodeType int:OpTypePrimitive.
        (ret@42) setStackBehaviourPop int:IlBVarpop.
        (ret@42) setStackBehaviourPush int:IlBPush0.
        (ret@42) setSize int:1.
        (ret@42) setValue short:02Ah.

        // Create instance of opcode: br.s
        ret@43 := OpCode new literal:"br.s".
        (ret@43) setOperandType int:OpOperTypeShortInlineBrTarget.
        (ret@43) setFlowControl int:OpFlowBranch.
        (ret@43) setOpCodeType int:OpTypeMacro.
        (ret@43) setStackBehaviourPop int:IlBPop0.
        (ret@43) setStackBehaviourPush int:IlBPush0.
        (ret@43) setSize int:1.
        (ret@43) setValue short:02Bh.

        // Create instance of opcode: brfalse.s
        ret@44 := OpCode new literal:"brfalse.s".
        (ret@44) setOperandType int:OpOperTypeShortInlineBrTarget.
        (ret@44) setFlowControl int:OpFlowCond_Branch.
        (ret@44) setOpCodeType int:OpTypeMacro.
        (ret@44) setStackBehaviourPop int:IlBPopi.
        (ret@44) setStackBehaviourPush int:IlBPush0.
        (ret@44) setSize int:1.
        (ret@44) setValue short:02Ch.

        // Create instance of opcode: brtrue.s
        ret@45 := OpCode new literal:"brtrue.s".
        (ret@45) setOperandType int:OpOperTypeShortInlineBrTarget.
        (ret@45) setFlowControl int:OpFlowCond_Branch.
        (ret@45) setOpCodeType int:OpTypeMacro.
        (ret@45) setStackBehaviourPop int:IlBPopi.
        (ret@45) setStackBehaviourPush int:IlBPush0.
        (ret@45) setSize int:1.
        (ret@45) setValue short:02Dh.

        // Create instance of opcode: beq.s
        ret@46 := OpCode new literal:"beq.s".
        (ret@46) setOperandType int:OpOperTypeShortInlineBrTarget.
        (ret@46) setFlowControl int:OpFlowCond_Branch.
        (ret@46) setOpCodeType int:OpTypeMacro.
        (ret@46) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@46) setStackBehaviourPush int:IlBPush0.
        (ret@46) setSize int:1.
        (ret@46) setValue short:02Eh.

        // Create instance of opcode: bge.s
        ret@47 := OpCode new literal:"bge.s".
        (ret@47) setOperandType int:OpOperTypeShortInlineBrTarget.
        (ret@47) setFlowControl int:OpFlowCond_Branch.
        (ret@47) setOpCodeType int:OpTypeMacro.
        (ret@47) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@47) setStackBehaviourPush int:IlBPush0.
        (ret@47) setSize int:1.
        (ret@47) setValue short:02Fh.

        // Create instance of opcode: bgt.s
        ret@48 := OpCode new literal:"bgt.s".
        (ret@48) setOperandType int:OpOperTypeShortInlineBrTarget.
        (ret@48) setFlowControl int:OpFlowCond_Branch.
        (ret@48) setOpCodeType int:OpTypeMacro.
        (ret@48) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@48) setStackBehaviourPush int:IlBPush0.
        (ret@48) setSize int:1.
        (ret@48) setValue short:030h.

        // Create instance of opcode: ble.s
        ret@49 := OpCode new literal:"ble.s".
        (ret@49) setOperandType int:OpOperTypeShortInlineBrTarget.
        (ret@49) setFlowControl int:OpFlowCond_Branch.
        (ret@49) setOpCodeType int:OpTypeMacro.
        (ret@49) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@49) setStackBehaviourPush int:IlBPush0.
        (ret@49) setSize int:1.
        (ret@49) setValue short:031h.

        // Create instance of opcode: blt.s
        ret@50 := OpCode new literal:"blt.s".
        (ret@50) setOperandType int:OpOperTypeShortInlineBrTarget.
        (ret@50) setFlowControl int:OpFlowCond_Branch.
        (ret@50) setOpCodeType int:OpTypeMacro.
        (ret@50) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@50) setStackBehaviourPush int:IlBPush0.
        (ret@50) setSize int:1.
        (ret@50) setValue short:032h.

        // Create instance of opcode: bne.un.s
        ret@51 := OpCode new literal:"bne.un.s".
        (ret@51) setOperandType int:OpOperTypeShortInlineBrTarget.
        (ret@51) setFlowControl int:OpFlowCond_Branch.
        (ret@51) setOpCodeType int:OpTypeMacro.
        (ret@51) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@51) setStackBehaviourPush int:IlBPush0.
        (ret@51) setSize int:1.
        (ret@51) setValue short:033h.

        // Create instance of opcode: bge.un.s
        ret@52 := OpCode new literal:"bge.un.s".
        (ret@52) setOperandType int:OpOperTypeShortInlineBrTarget.
        (ret@52) setFlowControl int:OpFlowCond_Branch.
        (ret@52) setOpCodeType int:OpTypeMacro.
        (ret@52) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@52) setStackBehaviourPush int:IlBPush0.
        (ret@52) setSize int:1.
        (ret@52) setValue short:034h.

        // Create instance of opcode: bgt.un.s
        ret@53 := OpCode new literal:"bgt.un.s".
        (ret@53) setOperandType int:OpOperTypeShortInlineBrTarget.
        (ret@53) setFlowControl int:OpFlowCond_Branch.
        (ret@53) setOpCodeType int:OpTypeMacro.
        (ret@53) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@53) setStackBehaviourPush int:IlBPush0.
        (ret@53) setSize int:1.
        (ret@53) setValue short:035h.

        // Create instance of opcode: ble.un.s
        ret@54 := OpCode new literal:"ble.un.s".
        (ret@54) setOperandType int:OpOperTypeShortInlineBrTarget.
        (ret@54) setFlowControl int:OpFlowCond_Branch.
        (ret@54) setOpCodeType int:OpTypeMacro.
        (ret@54) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@54) setStackBehaviourPush int:IlBPush0.
        (ret@54) setSize int:1.
        (ret@54) setValue short:036h.

        // Create instance of opcode: blt.un.s
        ret@55 := OpCode new literal:"blt.un.s".
        (ret@55) setOperandType int:OpOperTypeShortInlineBrTarget.
        (ret@55) setFlowControl int:OpFlowCond_Branch.
        (ret@55) setOpCodeType int:OpTypeMacro.
        (ret@55) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@55) setStackBehaviourPush int:IlBPush0.
        (ret@55) setSize int:1.
        (ret@55) setValue short:037h.

        // Create instance of opcode: br
        ret@56 := OpCode new literal:"br".
        (ret@56) setOperandType int:OpOperTypeInlineBrTarget.
        (ret@56) setFlowControl int:OpFlowBranch.
        (ret@56) setOpCodeType int:OpTypePrimitive.
        (ret@56) setStackBehaviourPop int:IlBPop0.
        (ret@56) setStackBehaviourPush int:IlBPush0.
        (ret@56) setSize int:1.
        (ret@56) setValue short:038h.

        // Create instance of opcode: brfalse
        ret@57 := OpCode new literal:"brfalse".
        (ret@57) setOperandType int:OpOperTypeInlineBrTarget.
        (ret@57) setFlowControl int:OpFlowCond_Branch.
        (ret@57) setOpCodeType int:OpTypePrimitive.
        (ret@57) setStackBehaviourPop int:IlBPopi.
        (ret@57) setStackBehaviourPush int:IlBPush0.
        (ret@57) setSize int:1.
        (ret@57) setValue short:039h.

        // Create instance of opcode: brtrue
        ret@58 := OpCode new literal:"brtrue".
        (ret@58) setOperandType int:OpOperTypeInlineBrTarget.
        (ret@58) setFlowControl int:OpFlowCond_Branch.
        (ret@58) setOpCodeType int:OpTypePrimitive.
        (ret@58) setStackBehaviourPop int:IlBPopi.
        (ret@58) setStackBehaviourPush int:IlBPush0.
        (ret@58) setSize int:1.
        (ret@58) setValue short:03Ah.

        // Create instance of opcode: beq
        ret@59 := OpCode new literal:"beq".
        (ret@59) setOperandType int:OpOperTypeInlineBrTarget.
        (ret@59) setFlowControl int:OpFlowCond_Branch.
        (ret@59) setOpCodeType int:OpTypeMacro.
        (ret@59) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@59) setStackBehaviourPush int:IlBPush0.
        (ret@59) setSize int:1.
        (ret@59) setValue short:03Bh.

        // Create instance of opcode: bge
        ret@60 := OpCode new literal:"bge".
        (ret@60) setOperandType int:OpOperTypeInlineBrTarget.
        (ret@60) setFlowControl int:OpFlowCond_Branch.
        (ret@60) setOpCodeType int:OpTypeMacro.
        (ret@60) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@60) setStackBehaviourPush int:IlBPush0.
        (ret@60) setSize int:1.
        (ret@60) setValue short:03Ch.

        // Create instance of opcode: bgt
        ret@61 := OpCode new literal:"bgt".
        (ret@61) setOperandType int:OpOperTypeInlineBrTarget.
        (ret@61) setFlowControl int:OpFlowCond_Branch.
        (ret@61) setOpCodeType int:OpTypeMacro.
        (ret@61) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@61) setStackBehaviourPush int:IlBPush0.
        (ret@61) setSize int:1.
        (ret@61) setValue short:03Dh.

        // Create instance of opcode: ble
        ret@62 := OpCode new literal:"ble".
        (ret@62) setOperandType int:OpOperTypeInlineBrTarget.
        (ret@62) setFlowControl int:OpFlowCond_Branch.
        (ret@62) setOpCodeType int:OpTypeMacro.
        (ret@62) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@62) setStackBehaviourPush int:IlBPush0.
        (ret@62) setSize int:1.
        (ret@62) setValue short:03Eh.

        // Create instance of opcode: blt
        ret@63 := OpCode new literal:"blt".
        (ret@63) setOperandType int:OpOperTypeInlineBrTarget.
        (ret@63) setFlowControl int:OpFlowCond_Branch.
        (ret@63) setOpCodeType int:OpTypeMacro.
        (ret@63) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@63) setStackBehaviourPush int:IlBPush0.
        (ret@63) setSize int:1.
        (ret@63) setValue short:03Fh.

        // Create instance of opcode: bne.un
        ret@64 := OpCode new literal:"bne.un".
        (ret@64) setOperandType int:OpOperTypeInlineBrTarget.
        (ret@64) setFlowControl int:OpFlowCond_Branch.
        (ret@64) setOpCodeType int:OpTypeMacro.
        (ret@64) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@64) setStackBehaviourPush int:IlBPush0.
        (ret@64) setSize int:1.
        (ret@64) setValue short:040h.

        // Create instance of opcode: bge.un
        ret@65 := OpCode new literal:"bge.un".
        (ret@65) setOperandType int:OpOperTypeInlineBrTarget.
        (ret@65) setFlowControl int:OpFlowCond_Branch.
        (ret@65) setOpCodeType int:OpTypeMacro.
        (ret@65) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@65) setStackBehaviourPush int:IlBPush0.
        (ret@65) setSize int:1.
        (ret@65) setValue short:041h.

        // Create instance of opcode: bgt.un
        ret@66 := OpCode new literal:"bgt.un".
        (ret@66) setOperandType int:OpOperTypeInlineBrTarget.
        (ret@66) setFlowControl int:OpFlowCond_Branch.
        (ret@66) setOpCodeType int:OpTypeMacro.
        (ret@66) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@66) setStackBehaviourPush int:IlBPush0.
        (ret@66) setSize int:1.
        (ret@66) setValue short:042h.

        // Create instance of opcode: ble.un
        ret@67 := OpCode new literal:"ble.un".
        (ret@67) setOperandType int:OpOperTypeInlineBrTarget.
        (ret@67) setFlowControl int:OpFlowCond_Branch.
        (ret@67) setOpCodeType int:OpTypeMacro.
        (ret@67) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@67) setStackBehaviourPush int:IlBPush0.
        (ret@67) setSize int:1.
        (ret@67) setValue short:043h.

        // Create instance of opcode: blt.un
        ret@68 := OpCode new literal:"blt.un".
        (ret@68) setOperandType int:OpOperTypeInlineBrTarget.
        (ret@68) setFlowControl int:OpFlowCond_Branch.
        (ret@68) setOpCodeType int:OpTypeMacro.
        (ret@68) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@68) setStackBehaviourPush int:IlBPush0.
        (ret@68) setSize int:1.
        (ret@68) setValue short:044h.

        // Create instance of opcode: switch
        ret@69 := OpCode new literal:"switch".
        (ret@69) setOperandType int:OpOperTypeInlineSwitch.
        (ret@69) setFlowControl int:OpFlowCond_Branch.
        (ret@69) setOpCodeType int:OpTypePrimitive.
        (ret@69) setStackBehaviourPop int:IlBPopi.
        (ret@69) setStackBehaviourPush int:IlBPush0.
        (ret@69) setSize int:1.
        (ret@69) setValue short:045h.

        // Create instance of opcode: ldind.i1
        ret@70 := OpCode new literal:"ldind.i1".
        (ret@70) setOperandType int:OpOperTypeInlineNone.
        (ret@70) setFlowControl int:OpFlowNext.
        (ret@70) setOpCodeType int:OpTypePrimitive.
        (ret@70) setStackBehaviourPop int:IlBPopi.
        (ret@70) setStackBehaviourPush int:IlBPushi.
        (ret@70) setSize int:1.
        (ret@70) setValue short:046h.

        // Create instance of opcode: ldind.u1
        ret@71 := OpCode new literal:"ldind.u1".
        (ret@71) setOperandType int:OpOperTypeInlineNone.
        (ret@71) setFlowControl int:OpFlowNext.
        (ret@71) setOpCodeType int:OpTypePrimitive.
        (ret@71) setStackBehaviourPop int:IlBPopi.
        (ret@71) setStackBehaviourPush int:IlBPushi.
        (ret@71) setSize int:1.
        (ret@71) setValue short:047h.

        // Create instance of opcode: ldind.i2
        ret@72 := OpCode new literal:"ldind.i2".
        (ret@72) setOperandType int:OpOperTypeInlineNone.
        (ret@72) setFlowControl int:OpFlowNext.
        (ret@72) setOpCodeType int:OpTypePrimitive.
        (ret@72) setStackBehaviourPop int:IlBPopi.
        (ret@72) setStackBehaviourPush int:IlBPushi.
        (ret@72) setSize int:1.
        (ret@72) setValue short:048h.

        // Create instance of opcode: ldind.u2
        ret@73 := OpCode new literal:"ldind.u2".
        (ret@73) setOperandType int:OpOperTypeInlineNone.
        (ret@73) setFlowControl int:OpFlowNext.
        (ret@73) setOpCodeType int:OpTypePrimitive.
        (ret@73) setStackBehaviourPop int:IlBPopi.
        (ret@73) setStackBehaviourPush int:IlBPushi.
        (ret@73) setSize int:1.
        (ret@73) setValue short:049h.

        // Create instance of opcode: ldind.i4
        ret@74 := OpCode new literal:"ldind.i4".
        (ret@74) setOperandType int:OpOperTypeInlineNone.
        (ret@74) setFlowControl int:OpFlowNext.
        (ret@74) setOpCodeType int:OpTypePrimitive.
        (ret@74) setStackBehaviourPop int:IlBPopi.
        (ret@74) setStackBehaviourPush int:IlBPushi.
        (ret@74) setSize int:1.
        (ret@74) setValue short:04Ah.

        // Create instance of opcode: ldind.u4
        ret@75 := OpCode new literal:"ldind.u4".
        (ret@75) setOperandType int:OpOperTypeInlineNone.
        (ret@75) setFlowControl int:OpFlowNext.
        (ret@75) setOpCodeType int:OpTypePrimitive.
        (ret@75) setStackBehaviourPop int:IlBPopi.
        (ret@75) setStackBehaviourPush int:IlBPushi.
        (ret@75) setSize int:1.
        (ret@75) setValue short:04Bh.

        // Create instance of opcode: ldind.i8
        ret@76 := OpCode new literal:"ldind.i8".
        (ret@76) setOperandType int:OpOperTypeInlineNone.
        (ret@76) setFlowControl int:OpFlowNext.
        (ret@76) setOpCodeType int:OpTypePrimitive.
        (ret@76) setStackBehaviourPop int:IlBPopi.
        (ret@76) setStackBehaviourPush int:IlBPushi8.
        (ret@76) setSize int:1.
        (ret@76) setValue short:04Ch.

        // Create instance of opcode: ldind.i
        ret@77 := OpCode new literal:"ldind.i".
        (ret@77) setOperandType int:OpOperTypeInlineNone.
        (ret@77) setFlowControl int:OpFlowNext.
        (ret@77) setOpCodeType int:OpTypePrimitive.
        (ret@77) setStackBehaviourPop int:IlBPopi.
        (ret@77) setStackBehaviourPush int:IlBPushi.
        (ret@77) setSize int:1.
        (ret@77) setValue short:04Dh.

        // Create instance of opcode: ldind.r4
        ret@78 := OpCode new literal:"ldind.r4".
        (ret@78) setOperandType int:OpOperTypeInlineNone.
        (ret@78) setFlowControl int:OpFlowNext.
        (ret@78) setOpCodeType int:OpTypePrimitive.
        (ret@78) setStackBehaviourPop int:IlBPopi.
        (ret@78) setStackBehaviourPush int:IlBPushr4.
        (ret@78) setSize int:1.
        (ret@78) setValue short:04Eh.

        // Create instance of opcode: ldind.r8
        ret@79 := OpCode new literal:"ldind.r8".
        (ret@79) setOperandType int:OpOperTypeInlineNone.
        (ret@79) setFlowControl int:OpFlowNext.
        (ret@79) setOpCodeType int:OpTypePrimitive.
        (ret@79) setStackBehaviourPop int:IlBPopi.
        (ret@79) setStackBehaviourPush int:IlBPushr8.
        (ret@79) setSize int:1.
        (ret@79) setValue short:04Fh.

        // Create instance of opcode: ldind.ref
        ret@80 := OpCode new literal:"ldind.ref".
        (ret@80) setOperandType int:OpOperTypeInlineNone.
        (ret@80) setFlowControl int:OpFlowNext.
        (ret@80) setOpCodeType int:OpTypePrimitive.
        (ret@80) setStackBehaviourPop int:IlBPopi.
        (ret@80) setStackBehaviourPush int:IlBPushref.
        (ret@80) setSize int:1.
        (ret@80) setValue short:050h.

        // Create instance of opcode: stind.ref
        ret@81 := OpCode new literal:"stind.ref".
        (ret@81) setOperandType int:OpOperTypeInlineNone.
        (ret@81) setFlowControl int:OpFlowNext.
        (ret@81) setOpCodeType int:OpTypePrimitive.
        (ret@81) setStackBehaviourPop int:IlBPopi_popi.
        (ret@81) setStackBehaviourPush int:IlBPush0.
        (ret@81) setSize int:1.
        (ret@81) setValue short:051h.

        // Create instance of opcode: stind.i1
        ret@82 := OpCode new literal:"stind.i1".
        (ret@82) setOperandType int:OpOperTypeInlineNone.
        (ret@82) setFlowControl int:OpFlowNext.
        (ret@82) setOpCodeType int:OpTypePrimitive.
        (ret@82) setStackBehaviourPop int:IlBPopi_popi.
        (ret@82) setStackBehaviourPush int:IlBPush0.
        (ret@82) setSize int:1.
        (ret@82) setValue short:052h.

        // Create instance of opcode: stind.i2
        ret@83 := OpCode new literal:"stind.i2".
        (ret@83) setOperandType int:OpOperTypeInlineNone.
        (ret@83) setFlowControl int:OpFlowNext.
        (ret@83) setOpCodeType int:OpTypePrimitive.
        (ret@83) setStackBehaviourPop int:IlBPopi_popi.
        (ret@83) setStackBehaviourPush int:IlBPush0.
        (ret@83) setSize int:1.
        (ret@83) setValue short:053h.

        // Create instance of opcode: stind.i4
        ret@84 := OpCode new literal:"stind.i4".
        (ret@84) setOperandType int:OpOperTypeInlineNone.
        (ret@84) setFlowControl int:OpFlowNext.
        (ret@84) setOpCodeType int:OpTypePrimitive.
        (ret@84) setStackBehaviourPop int:IlBPopi_popi.
        (ret@84) setStackBehaviourPush int:IlBPush0.
        (ret@84) setSize int:1.
        (ret@84) setValue short:054h.

        // Create instance of opcode: stind.i8
        ret@85 := OpCode new literal:"stind.i8".
        (ret@85) setOperandType int:OpOperTypeInlineNone.
        (ret@85) setFlowControl int:OpFlowNext.
        (ret@85) setOpCodeType int:OpTypePrimitive.
        (ret@85) setStackBehaviourPop int:IlBPopi_popi8.
        (ret@85) setStackBehaviourPush int:IlBPush0.
        (ret@85) setSize int:1.
        (ret@85) setValue short:055h.

        // Create instance of opcode: stind.r4
        ret@86 := OpCode new literal:"stind.r4".
        (ret@86) setOperandType int:OpOperTypeInlineNone.
        (ret@86) setFlowControl int:OpFlowNext.
        (ret@86) setOpCodeType int:OpTypePrimitive.
        (ret@86) setStackBehaviourPop int:IlBPopi_popr4.
        (ret@86) setStackBehaviourPush int:IlBPush0.
        (ret@86) setSize int:1.
        (ret@86) setValue short:056h.

        // Create instance of opcode: stind.r8
        ret@87 := OpCode new literal:"stind.r8".
        (ret@87) setOperandType int:OpOperTypeInlineNone.
        (ret@87) setFlowControl int:OpFlowNext.
        (ret@87) setOpCodeType int:OpTypePrimitive.
        (ret@87) setStackBehaviourPop int:IlBPopi_popr8.
        (ret@87) setStackBehaviourPush int:IlBPush0.
        (ret@87) setSize int:1.
        (ret@87) setValue short:057h.

        // Create instance of opcode: add
        ret@88 := OpCode new literal:"add".
        (ret@88) setOperandType int:OpOperTypeInlineNone.
        (ret@88) setFlowControl int:OpFlowNext.
        (ret@88) setOpCodeType int:OpTypePrimitive.
        (ret@88) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@88) setStackBehaviourPush int:IlBPush1.
        (ret@88) setSize int:1.
        (ret@88) setValue short:058h.

        // Create instance of opcode: sub
        ret@89 := OpCode new literal:"sub".
        (ret@89) setOperandType int:OpOperTypeInlineNone.
        (ret@89) setFlowControl int:OpFlowNext.
        (ret@89) setOpCodeType int:OpTypePrimitive.
        (ret@89) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@89) setStackBehaviourPush int:IlBPush1.
        (ret@89) setSize int:1.
        (ret@89) setValue short:059h.

        // Create instance of opcode: mul
        ret@90 := OpCode new literal:"mul".
        (ret@90) setOperandType int:OpOperTypeInlineNone.
        (ret@90) setFlowControl int:OpFlowNext.
        (ret@90) setOpCodeType int:OpTypePrimitive.
        (ret@90) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@90) setStackBehaviourPush int:IlBPush1.
        (ret@90) setSize int:1.
        (ret@90) setValue short:05Ah.

        // Create instance of opcode: div
        ret@91 := OpCode new literal:"div".
        (ret@91) setOperandType int:OpOperTypeInlineNone.
        (ret@91) setFlowControl int:OpFlowNext.
        (ret@91) setOpCodeType int:OpTypePrimitive.
        (ret@91) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@91) setStackBehaviourPush int:IlBPush1.
        (ret@91) setSize int:1.
        (ret@91) setValue short:05Bh.

        // Create instance of opcode: div.un
        ret@92 := OpCode new literal:"div.un".
        (ret@92) setOperandType int:OpOperTypeInlineNone.
        (ret@92) setFlowControl int:OpFlowNext.
        (ret@92) setOpCodeType int:OpTypePrimitive.
        (ret@92) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@92) setStackBehaviourPush int:IlBPush1.
        (ret@92) setSize int:1.
        (ret@92) setValue short:05Ch.

        // Create instance of opcode: rem
        ret@93 := OpCode new literal:"rem".
        (ret@93) setOperandType int:OpOperTypeInlineNone.
        (ret@93) setFlowControl int:OpFlowNext.
        (ret@93) setOpCodeType int:OpTypePrimitive.
        (ret@93) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@93) setStackBehaviourPush int:IlBPush1.
        (ret@93) setSize int:1.
        (ret@93) setValue short:05Dh.

        // Create instance of opcode: rem.un
        ret@94 := OpCode new literal:"rem.un".
        (ret@94) setOperandType int:OpOperTypeInlineNone.
        (ret@94) setFlowControl int:OpFlowNext.
        (ret@94) setOpCodeType int:OpTypePrimitive.
        (ret@94) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@94) setStackBehaviourPush int:IlBPush1.
        (ret@94) setSize int:1.
        (ret@94) setValue short:05Eh.

        // Create instance of opcode: and
        ret@95 := OpCode new literal:"and".
        (ret@95) setOperandType int:OpOperTypeInlineNone.
        (ret@95) setFlowControl int:OpFlowNext.
        (ret@95) setOpCodeType int:OpTypePrimitive.
        (ret@95) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@95) setStackBehaviourPush int:IlBPush1.
        (ret@95) setSize int:1.
        (ret@95) setValue short:05Fh.

        // Create instance of opcode: or
        ret@96 := OpCode new literal:"or".
        (ret@96) setOperandType int:OpOperTypeInlineNone.
        (ret@96) setFlowControl int:OpFlowNext.
        (ret@96) setOpCodeType int:OpTypePrimitive.
        (ret@96) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@96) setStackBehaviourPush int:IlBPush1.
        (ret@96) setSize int:1.
        (ret@96) setValue short:060h.

        // Create instance of opcode: xor
        ret@97 := OpCode new literal:"xor".
        (ret@97) setOperandType int:OpOperTypeInlineNone.
        (ret@97) setFlowControl int:OpFlowNext.
        (ret@97) setOpCodeType int:OpTypePrimitive.
        (ret@97) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@97) setStackBehaviourPush int:IlBPush1.
        (ret@97) setSize int:1.
        (ret@97) setValue short:061h.

        // Create instance of opcode: shl
        ret@98 := OpCode new literal:"shl".
        (ret@98) setOperandType int:OpOperTypeInlineNone.
        (ret@98) setFlowControl int:OpFlowNext.
        (ret@98) setOpCodeType int:OpTypePrimitive.
        (ret@98) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@98) setStackBehaviourPush int:IlBPush1.
        (ret@98) setSize int:1.
        (ret@98) setValue short:062h.

        // Create instance of opcode: shr
        ret@99 := OpCode new literal:"shr".
        (ret@99) setOperandType int:OpOperTypeInlineNone.
        (ret@99) setFlowControl int:OpFlowNext.
        (ret@99) setOpCodeType int:OpTypePrimitive.
        (ret@99) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@99) setStackBehaviourPush int:IlBPush1.
        (ret@99) setSize int:1.
        (ret@99) setValue short:063h.

        // Create instance of opcode: shr.un
        ret@100 := OpCode new literal:"shr.un".
        (ret@100) setOperandType int:OpOperTypeInlineNone.
        (ret@100) setFlowControl int:OpFlowNext.
        (ret@100) setOpCodeType int:OpTypePrimitive.
        (ret@100) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@100) setStackBehaviourPush int:IlBPush1.
        (ret@100) setSize int:1.
        (ret@100) setValue short:064h.

        // Create instance of opcode: neg
        ret@101 := OpCode new literal:"neg".
        (ret@101) setOperandType int:OpOperTypeInlineNone.
        (ret@101) setFlowControl int:OpFlowNext.
        (ret@101) setOpCodeType int:OpTypePrimitive.
        (ret@101) setStackBehaviourPop int:IlBPop1.
        (ret@101) setStackBehaviourPush int:IlBPush1.
        (ret@101) setSize int:1.
        (ret@101) setValue short:065h.

        // Create instance of opcode: not
        ret@102 := OpCode new literal:"not".
        (ret@102) setOperandType int:OpOperTypeInlineNone.
        (ret@102) setFlowControl int:OpFlowNext.
        (ret@102) setOpCodeType int:OpTypePrimitive.
        (ret@102) setStackBehaviourPop int:IlBPop1.
        (ret@102) setStackBehaviourPush int:IlBPush1.
        (ret@102) setSize int:1.
        (ret@102) setValue short:066h.

        // Create instance of opcode: conv.i1
        ret@103 := OpCode new literal:"conv.i1".
        (ret@103) setOperandType int:OpOperTypeInlineNone.
        (ret@103) setFlowControl int:OpFlowNext.
        (ret@103) setOpCodeType int:OpTypePrimitive.
        (ret@103) setStackBehaviourPop int:IlBPop1.
        (ret@103) setStackBehaviourPush int:IlBPushi.
        (ret@103) setSize int:1.
        (ret@103) setValue short:067h.

        // Create instance of opcode: conv.i2
        ret@104 := OpCode new literal:"conv.i2".
        (ret@104) setOperandType int:OpOperTypeInlineNone.
        (ret@104) setFlowControl int:OpFlowNext.
        (ret@104) setOpCodeType int:OpTypePrimitive.
        (ret@104) setStackBehaviourPop int:IlBPop1.
        (ret@104) setStackBehaviourPush int:IlBPushi.
        (ret@104) setSize int:1.
        (ret@104) setValue short:068h.

        // Create instance of opcode: conv.i4
        ret@105 := OpCode new literal:"conv.i4".
        (ret@105) setOperandType int:OpOperTypeInlineNone.
        (ret@105) setFlowControl int:OpFlowNext.
        (ret@105) setOpCodeType int:OpTypePrimitive.
        (ret@105) setStackBehaviourPop int:IlBPop1.
        (ret@105) setStackBehaviourPush int:IlBPushi.
        (ret@105) setSize int:1.
        (ret@105) setValue short:069h.

        // Create instance of opcode: conv.i8
        ret@106 := OpCode new literal:"conv.i8".
        (ret@106) setOperandType int:OpOperTypeInlineNone.
        (ret@106) setFlowControl int:OpFlowNext.
        (ret@106) setOpCodeType int:OpTypePrimitive.
        (ret@106) setStackBehaviourPop int:IlBPop1.
        (ret@106) setStackBehaviourPush int:IlBPushi8.
        (ret@106) setSize int:1.
        (ret@106) setValue short:06Ah.

        // Create instance of opcode: conv.r4
        ret@107 := OpCode new literal:"conv.r4".
        (ret@107) setOperandType int:OpOperTypeInlineNone.
        (ret@107) setFlowControl int:OpFlowNext.
        (ret@107) setOpCodeType int:OpTypePrimitive.
        (ret@107) setStackBehaviourPop int:IlBPop1.
        (ret@107) setStackBehaviourPush int:IlBPushr4.
        (ret@107) setSize int:1.
        (ret@107) setValue short:06Bh.

        // Create instance of opcode: conv.r8
        ret@108 := OpCode new literal:"conv.r8".
        (ret@108) setOperandType int:OpOperTypeInlineNone.
        (ret@108) setFlowControl int:OpFlowNext.
        (ret@108) setOpCodeType int:OpTypePrimitive.
        (ret@108) setStackBehaviourPop int:IlBPop1.
        (ret@108) setStackBehaviourPush int:IlBPushr8.
        (ret@108) setSize int:1.
        (ret@108) setValue short:06Ch.

        // Create instance of opcode: conv.u4
        ret@109 := OpCode new literal:"conv.u4".
        (ret@109) setOperandType int:OpOperTypeInlineNone.
        (ret@109) setFlowControl int:OpFlowNext.
        (ret@109) setOpCodeType int:OpTypePrimitive.
        (ret@109) setStackBehaviourPop int:IlBPop1.
        (ret@109) setStackBehaviourPush int:IlBPushi.
        (ret@109) setSize int:1.
        (ret@109) setValue short:06Dh.

        // Create instance of opcode: conv.u8
        ret@110 := OpCode new literal:"conv.u8".
        (ret@110) setOperandType int:OpOperTypeInlineNone.
        (ret@110) setFlowControl int:OpFlowNext.
        (ret@110) setOpCodeType int:OpTypePrimitive.
        (ret@110) setStackBehaviourPop int:IlBPop1.
        (ret@110) setStackBehaviourPush int:IlBPushi8.
        (ret@110) setSize int:1.
        (ret@110) setValue short:06Eh.

        // Create instance of opcode: callvirt
        ret@111 := OpCode new literal:"callvirt".
        (ret@111) setOperandType int:OpOperTypeInlineMethod.
        (ret@111) setFlowControl int:OpFlowCall.
        (ret@111) setOpCodeType int:OpTypeObjmodel.
        (ret@111) setStackBehaviourPop int:IlBVarpop.
        (ret@111) setStackBehaviourPush int:IlBVarpush.
        (ret@111) setSize int:1.
        (ret@111) setValue short:06Fh.

        // Create instance of opcode: cpobj
        ret@112 := OpCode new literal:"cpobj".
        (ret@112) setOperandType int:OpOperTypeInlineType.
        (ret@112) setFlowControl int:OpFlowNext.
        (ret@112) setOpCodeType int:OpTypeObjmodel.
        (ret@112) setStackBehaviourPop int:IlBPopi_popi.
        (ret@112) setStackBehaviourPush int:IlBPush0.
        (ret@112) setSize int:1.
        (ret@112) setValue short:070h.

        // Create instance of opcode: ldobj
        ret@113 := OpCode new literal:"ldobj".
        (ret@113) setOperandType int:OpOperTypeInlineType.
        (ret@113) setFlowControl int:OpFlowNext.
        (ret@113) setOpCodeType int:OpTypeObjmodel.
        (ret@113) setStackBehaviourPop int:IlBPopi.
        (ret@113) setStackBehaviourPush int:IlBPush1.
        (ret@113) setSize int:1.
        (ret@113) setValue short:071h.

        // Create instance of opcode: ldstr
        ret@114 := OpCode new literal:"ldstr".
        (ret@114) setOperandType int:OpOperTypeInlineString.
        (ret@114) setFlowControl int:OpFlowNext.
        (ret@114) setOpCodeType int:OpTypeObjmodel.
        (ret@114) setStackBehaviourPop int:IlBPop0.
        (ret@114) setStackBehaviourPush int:IlBPushref.
        (ret@114) setSize int:1.
        (ret@114) setValue short:072h.

        // Create instance of opcode: newobj
        ret@115 := OpCode new literal:"newobj".
        (ret@115) setOperandType int:OpOperTypeInlineMethod.
        (ret@115) setFlowControl int:OpFlowCall.
        (ret@115) setOpCodeType int:OpTypeObjmodel.
        (ret@115) setStackBehaviourPop int:IlBVarpop.
        (ret@115) setStackBehaviourPush int:IlBPushref.
        (ret@115) setSize int:1.
        (ret@115) setValue short:073h.

        // Create instance of opcode: castclass
        ret@116 := OpCode new literal:"castclass".
        (ret@116) setOperandType int:OpOperTypeInlineType.
        (ret@116) setFlowControl int:OpFlowNext.
        (ret@116) setOpCodeType int:OpTypeObjmodel.
        (ret@116) setStackBehaviourPop int:IlBPopref.
        (ret@116) setStackBehaviourPush int:IlBPushref.
        (ret@116) setSize int:1.
        (ret@116) setValue short:074h.

        // Create instance of opcode: isinst
        ret@117 := OpCode new literal:"isinst".
        (ret@117) setOperandType int:OpOperTypeInlineType.
        (ret@117) setFlowControl int:OpFlowNext.
        (ret@117) setOpCodeType int:OpTypeObjmodel.
        (ret@117) setStackBehaviourPop int:IlBPopref.
        (ret@117) setStackBehaviourPush int:IlBPushi.
        (ret@117) setSize int:1.
        (ret@117) setValue short:075h.

        // Create instance of opcode: conv.r.un
        ret@118 := OpCode new literal:"conv.r.un".
        (ret@118) setOperandType int:OpOperTypeInlineNone.
        (ret@118) setFlowControl int:OpFlowNext.
        (ret@118) setOpCodeType int:OpTypePrimitive.
        (ret@118) setStackBehaviourPop int:IlBPop1.
        (ret@118) setStackBehaviourPush int:IlBPushr8.
        (ret@118) setSize int:1.
        (ret@118) setValue short:076h.

        // Create instance of opcode: unbox
        ret@121 := OpCode new literal:"unbox".
        (ret@121) setOperandType int:OpOperTypeInlineType.
        (ret@121) setFlowControl int:OpFlowNext.
        (ret@121) setOpCodeType int:OpTypePrimitive.
        (ret@121) setStackBehaviourPop int:IlBPopref.
        (ret@121) setStackBehaviourPush int:IlBPushi.
        (ret@121) setSize int:1.
        (ret@121) setValue short:079h.

        // Create instance of opcode: throw
        ret@122 := OpCode new literal:"throw".
        (ret@122) setOperandType int:OpOperTypeInlineNone.
        (ret@122) setFlowControl int:OpFlowThrow.
        (ret@122) setOpCodeType int:OpTypeObjmodel.
        (ret@122) setStackBehaviourPop int:IlBPopref.
        (ret@122) setStackBehaviourPush int:IlBPush0.
        (ret@122) setSize int:1.
        (ret@122) setValue short:07Ah.

        // Create instance of opcode: ldfld
        ret@123 := OpCode new literal:"ldfld".
        (ret@123) setOperandType int:OpOperTypeInlineField.
        (ret@123) setFlowControl int:OpFlowNext.
        (ret@123) setOpCodeType int:OpTypeObjmodel.
        (ret@123) setStackBehaviourPop int:IlBPopref.
        (ret@123) setStackBehaviourPush int:IlBPush1.
        (ret@123) setSize int:1.
        (ret@123) setValue short:07Bh.

        // Create instance of opcode: ldflda
        ret@124 := OpCode new literal:"ldflda".
        (ret@124) setOperandType int:OpOperTypeInlineField.
        (ret@124) setFlowControl int:OpFlowNext.
        (ret@124) setOpCodeType int:OpTypeObjmodel.
        (ret@124) setStackBehaviourPop int:IlBPopref.
        (ret@124) setStackBehaviourPush int:IlBPushi.
        (ret@124) setSize int:1.
        (ret@124) setValue short:07Ch.

        // Create instance of opcode: stfld
        ret@125 := OpCode new literal:"stfld".
        (ret@125) setOperandType int:OpOperTypeInlineField.
        (ret@125) setFlowControl int:OpFlowNext.
        (ret@125) setOpCodeType int:OpTypeObjmodel.
        (ret@125) setStackBehaviourPop int:IlBPopref_pop1.
        (ret@125) setStackBehaviourPush int:IlBPush0.
        (ret@125) setSize int:1.
        (ret@125) setValue short:07Dh.

        // Create instance of opcode: ldsfld
        ret@126 := OpCode new literal:"ldsfld".
        (ret@126) setOperandType int:OpOperTypeInlineField.
        (ret@126) setFlowControl int:OpFlowNext.
        (ret@126) setOpCodeType int:OpTypeObjmodel.
        (ret@126) setStackBehaviourPop int:IlBPop0.
        (ret@126) setStackBehaviourPush int:IlBPush1.
        (ret@126) setSize int:1.
        (ret@126) setValue short:07Eh.

        // Create instance of opcode: ldsflda
        ret@127 := OpCode new literal:"ldsflda".
        (ret@127) setOperandType int:OpOperTypeInlineField.
        (ret@127) setFlowControl int:OpFlowNext.
        (ret@127) setOpCodeType int:OpTypeObjmodel.
        (ret@127) setStackBehaviourPop int:IlBPop0.
        (ret@127) setStackBehaviourPush int:IlBPushi.
        (ret@127) setSize int:1.
        (ret@127) setValue short:07Fh.

        // Create instance of opcode: stsfld
        ret@128 := OpCode new literal:"stsfld".
        (ret@128) setOperandType int:OpOperTypeInlineField.
        (ret@128) setFlowControl int:OpFlowNext.
        (ret@128) setOpCodeType int:OpTypeObjmodel.
        (ret@128) setStackBehaviourPop int:IlBPop1.
        (ret@128) setStackBehaviourPush int:IlBPush0.
        (ret@128) setSize int:1.
        (ret@128) setValue short:080h.

        // Create instance of opcode: stobj
        ret@129 := OpCode new literal:"stobj".
        (ret@129) setOperandType int:OpOperTypeInlineType.
        (ret@129) setFlowControl int:OpFlowNext.
        (ret@129) setOpCodeType int:OpTypePrimitive.
        (ret@129) setStackBehaviourPop int:IlBPopi_pop1.
        (ret@129) setStackBehaviourPush int:IlBPush0.
        (ret@129) setSize int:1.
        (ret@129) setValue short:081h.

        // Create instance of opcode: conv.ovf.i1.un
        ret@130 := OpCode new literal:"conv.ovf.i1.un".
        (ret@130) setOperandType int:OpOperTypeInlineNone.
        (ret@130) setFlowControl int:OpFlowNext.
        (ret@130) setOpCodeType int:OpTypePrimitive.
        (ret@130) setStackBehaviourPop int:IlBPop1.
        (ret@130) setStackBehaviourPush int:IlBPushi.
        (ret@130) setSize int:1.
        (ret@130) setValue short:082h.

        // Create instance of opcode: conv.ovf.i2.un
        ret@131 := OpCode new literal:"conv.ovf.i2.un".
        (ret@131) setOperandType int:OpOperTypeInlineNone.
        (ret@131) setFlowControl int:OpFlowNext.
        (ret@131) setOpCodeType int:OpTypePrimitive.
        (ret@131) setStackBehaviourPop int:IlBPop1.
        (ret@131) setStackBehaviourPush int:IlBPushi.
        (ret@131) setSize int:1.
        (ret@131) setValue short:083h.

        // Create instance of opcode: conv.ovf.i4.un
        ret@132 := OpCode new literal:"conv.ovf.i4.un".
        (ret@132) setOperandType int:OpOperTypeInlineNone.
        (ret@132) setFlowControl int:OpFlowNext.
        (ret@132) setOpCodeType int:OpTypePrimitive.
        (ret@132) setStackBehaviourPop int:IlBPop1.
        (ret@132) setStackBehaviourPush int:IlBPushi.
        (ret@132) setSize int:1.
        (ret@132) setValue short:084h.

        // Create instance of opcode: conv.ovf.i8.un
        ret@133 := OpCode new literal:"conv.ovf.i8.un".
        (ret@133) setOperandType int:OpOperTypeInlineNone.
        (ret@133) setFlowControl int:OpFlowNext.
        (ret@133) setOpCodeType int:OpTypePrimitive.
        (ret@133) setStackBehaviourPop int:IlBPop1.
        (ret@133) setStackBehaviourPush int:IlBPushi8.
        (ret@133) setSize int:1.
        (ret@133) setValue short:085h.

        // Create instance of opcode: conv.ovf.u1.un
        ret@134 := OpCode new literal:"conv.ovf.u1.un".
        (ret@134) setOperandType int:OpOperTypeInlineNone.
        (ret@134) setFlowControl int:OpFlowNext.
        (ret@134) setOpCodeType int:OpTypePrimitive.
        (ret@134) setStackBehaviourPop int:IlBPop1.
        (ret@134) setStackBehaviourPush int:IlBPushi.
        (ret@134) setSize int:1.
        (ret@134) setValue short:086h.

        // Create instance of opcode: conv.ovf.u2.un
        ret@135 := OpCode new literal:"conv.ovf.u2.un".
        (ret@135) setOperandType int:OpOperTypeInlineNone.
        (ret@135) setFlowControl int:OpFlowNext.
        (ret@135) setOpCodeType int:OpTypePrimitive.
        (ret@135) setStackBehaviourPop int:IlBPop1.
        (ret@135) setStackBehaviourPush int:IlBPushi.
        (ret@135) setSize int:1.
        (ret@135) setValue short:087h.

        // Create instance of opcode: conv.ovf.u4.un
        ret@136 := OpCode new literal:"conv.ovf.u4.un".
        (ret@136) setOperandType int:OpOperTypeInlineNone.
        (ret@136) setFlowControl int:OpFlowNext.
        (ret@136) setOpCodeType int:OpTypePrimitive.
        (ret@136) setStackBehaviourPop int:IlBPop1.
        (ret@136) setStackBehaviourPush int:IlBPushi.
        (ret@136) setSize int:1.
        (ret@136) setValue short:088h.

        // Create instance of opcode: conv.ovf.u8.un
        ret@137 := OpCode new literal:"conv.ovf.u8.un".
        (ret@137) setOperandType int:OpOperTypeInlineNone.
        (ret@137) setFlowControl int:OpFlowNext.
        (ret@137) setOpCodeType int:OpTypePrimitive.
        (ret@137) setStackBehaviourPop int:IlBPop1.
        (ret@137) setStackBehaviourPush int:IlBPushi8.
        (ret@137) setSize int:1.
        (ret@137) setValue short:089h.

        // Create instance of opcode: conv.ovf.i.un
        ret@138 := OpCode new literal:"conv.ovf.i.un".
        (ret@138) setOperandType int:OpOperTypeInlineNone.
        (ret@138) setFlowControl int:OpFlowNext.
        (ret@138) setOpCodeType int:OpTypePrimitive.
        (ret@138) setStackBehaviourPop int:IlBPop1.
        (ret@138) setStackBehaviourPush int:IlBPushi.
        (ret@138) setSize int:1.
        (ret@138) setValue short:08Ah.

        // Create instance of opcode: conv.ovf.u.un
        ret@139 := OpCode new literal:"conv.ovf.u.un".
        (ret@139) setOperandType int:OpOperTypeInlineNone.
        (ret@139) setFlowControl int:OpFlowNext.
        (ret@139) setOpCodeType int:OpTypePrimitive.
        (ret@139) setStackBehaviourPop int:IlBPop1.
        (ret@139) setStackBehaviourPush int:IlBPushi.
        (ret@139) setSize int:1.
        (ret@139) setValue short:08Bh.

        // Create instance of opcode: box
        ret@140 := OpCode new literal:"box".
        (ret@140) setOperandType int:OpOperTypeInlineType.
        (ret@140) setFlowControl int:OpFlowNext.
        (ret@140) setOpCodeType int:OpTypePrimitive.
        (ret@140) setStackBehaviourPop int:IlBPop1.
        (ret@140) setStackBehaviourPush int:IlBPushref.
        (ret@140) setSize int:1.
        (ret@140) setValue short:08Ch.

        // Create instance of opcode: newarr
        ret@141 := OpCode new literal:"newarr".
        (ret@141) setOperandType int:OpOperTypeInlineType.
        (ret@141) setFlowControl int:OpFlowNext.
        (ret@141) setOpCodeType int:OpTypeObjmodel.
        (ret@141) setStackBehaviourPop int:IlBPopi.
        (ret@141) setStackBehaviourPush int:IlBPushref.
        (ret@141) setSize int:1.
        (ret@141) setValue short:08Dh.

        // Create instance of opcode: ldlen
        ret@142 := OpCode new literal:"ldlen".
        (ret@142) setOperandType int:OpOperTypeInlineNone.
        (ret@142) setFlowControl int:OpFlowNext.
        (ret@142) setOpCodeType int:OpTypeObjmodel.
        (ret@142) setStackBehaviourPop int:IlBPopref.
        (ret@142) setStackBehaviourPush int:IlBPushi.
        (ret@142) setSize int:1.
        (ret@142) setValue short:08Eh.

        // Create instance of opcode: ldelema
        ret@143 := OpCode new literal:"ldelema".
        (ret@143) setOperandType int:OpOperTypeInlineType.
        (ret@143) setFlowControl int:OpFlowNext.
        (ret@143) setOpCodeType int:OpTypeObjmodel.
        (ret@143) setStackBehaviourPop int:IlBPopref_popi.
        (ret@143) setStackBehaviourPush int:IlBPushi.
        (ret@143) setSize int:1.
        (ret@143) setValue short:08Fh.

        // Create instance of opcode: ldelem.i1
        ret@144 := OpCode new literal:"ldelem.i1".
        (ret@144) setOperandType int:OpOperTypeInlineNone.
        (ret@144) setFlowControl int:OpFlowNext.
        (ret@144) setOpCodeType int:OpTypeObjmodel.
        (ret@144) setStackBehaviourPop int:IlBPopref_popi.
        (ret@144) setStackBehaviourPush int:IlBPushi.
        (ret@144) setSize int:1.
        (ret@144) setValue short:090h.

        // Create instance of opcode: ldelem.u1
        ret@145 := OpCode new literal:"ldelem.u1".
        (ret@145) setOperandType int:OpOperTypeInlineNone.
        (ret@145) setFlowControl int:OpFlowNext.
        (ret@145) setOpCodeType int:OpTypeObjmodel.
        (ret@145) setStackBehaviourPop int:IlBPopref_popi.
        (ret@145) setStackBehaviourPush int:IlBPushi.
        (ret@145) setSize int:1.
        (ret@145) setValue short:091h.

        // Create instance of opcode: ldelem.i2
        ret@146 := OpCode new literal:"ldelem.i2".
        (ret@146) setOperandType int:OpOperTypeInlineNone.
        (ret@146) setFlowControl int:OpFlowNext.
        (ret@146) setOpCodeType int:OpTypeObjmodel.
        (ret@146) setStackBehaviourPop int:IlBPopref_popi.
        (ret@146) setStackBehaviourPush int:IlBPushi.
        (ret@146) setSize int:1.
        (ret@146) setValue short:092h.

        // Create instance of opcode: ldelem.u2
        ret@147 := OpCode new literal:"ldelem.u2".
        (ret@147) setOperandType int:OpOperTypeInlineNone.
        (ret@147) setFlowControl int:OpFlowNext.
        (ret@147) setOpCodeType int:OpTypeObjmodel.
        (ret@147) setStackBehaviourPop int:IlBPopref_popi.
        (ret@147) setStackBehaviourPush int:IlBPushi.
        (ret@147) setSize int:1.
        (ret@147) setValue short:093h.

        // Create instance of opcode: ldelem.i4
        ret@148 := OpCode new literal:"ldelem.i4".
        (ret@148) setOperandType int:OpOperTypeInlineNone.
        (ret@148) setFlowControl int:OpFlowNext.
        (ret@148) setOpCodeType int:OpTypeObjmodel.
        (ret@148) setStackBehaviourPop int:IlBPopref_popi.
        (ret@148) setStackBehaviourPush int:IlBPushi.
        (ret@148) setSize int:1.
        (ret@148) setValue short:094h.

        // Create instance of opcode: ldelem.u4
        ret@149 := OpCode new literal:"ldelem.u4".
        (ret@149) setOperandType int:OpOperTypeInlineNone.
        (ret@149) setFlowControl int:OpFlowNext.
        (ret@149) setOpCodeType int:OpTypeObjmodel.
        (ret@149) setStackBehaviourPop int:IlBPopref_popi.
        (ret@149) setStackBehaviourPush int:IlBPushi.
        (ret@149) setSize int:1.
        (ret@149) setValue short:095h.

        // Create instance of opcode: ldelem.i8
        ret@150 := OpCode new literal:"ldelem.i8".
        (ret@150) setOperandType int:OpOperTypeInlineNone.
        (ret@150) setFlowControl int:OpFlowNext.
        (ret@150) setOpCodeType int:OpTypeObjmodel.
        (ret@150) setStackBehaviourPop int:IlBPopref_popi.
        (ret@150) setStackBehaviourPush int:IlBPushi8.
        (ret@150) setSize int:1.
        (ret@150) setValue short:096h.

        // Create instance of opcode: ldelem.i
        ret@151 := OpCode new literal:"ldelem.i".
        (ret@151) setOperandType int:OpOperTypeInlineNone.
        (ret@151) setFlowControl int:OpFlowNext.
        (ret@151) setOpCodeType int:OpTypeObjmodel.
        (ret@151) setStackBehaviourPop int:IlBPopref_popi.
        (ret@151) setStackBehaviourPush int:IlBPushi.
        (ret@151) setSize int:1.
        (ret@151) setValue short:097h.

        // Create instance of opcode: ldelem.r4
        ret@152 := OpCode new literal:"ldelem.r4".
        (ret@152) setOperandType int:OpOperTypeInlineNone.
        (ret@152) setFlowControl int:OpFlowNext.
        (ret@152) setOpCodeType int:OpTypeObjmodel.
        (ret@152) setStackBehaviourPop int:IlBPopref_popi.
        (ret@152) setStackBehaviourPush int:IlBPushr4.
        (ret@152) setSize int:1.
        (ret@152) setValue short:098h.

        // Create instance of opcode: ldelem.r8
        ret@153 := OpCode new literal:"ldelem.r8".
        (ret@153) setOperandType int:OpOperTypeInlineNone.
        (ret@153) setFlowControl int:OpFlowNext.
        (ret@153) setOpCodeType int:OpTypeObjmodel.
        (ret@153) setStackBehaviourPop int:IlBPopref_popi.
        (ret@153) setStackBehaviourPush int:IlBPushr8.
        (ret@153) setSize int:1.
        (ret@153) setValue short:099h.

        // Create instance of opcode: ldelem.ref
        ret@154 := OpCode new literal:"ldelem.ref".
        (ret@154) setOperandType int:OpOperTypeInlineNone.
        (ret@154) setFlowControl int:OpFlowNext.
        (ret@154) setOpCodeType int:OpTypeObjmodel.
        (ret@154) setStackBehaviourPop int:IlBPopref_popi.
        (ret@154) setStackBehaviourPush int:IlBPushref.
        (ret@154) setSize int:1.
        (ret@154) setValue short:09Ah.

        // Create instance of opcode: stelem.i
        ret@155 := OpCode new literal:"stelem.i".
        (ret@155) setOperandType int:OpOperTypeInlineNone.
        (ret@155) setFlowControl int:OpFlowNext.
        (ret@155) setOpCodeType int:OpTypeObjmodel.
        (ret@155) setStackBehaviourPop int:IlBPopref_popi_popi.
        (ret@155) setStackBehaviourPush int:IlBPush0.
        (ret@155) setSize int:1.
        (ret@155) setValue short:09Bh.

        // Create instance of opcode: stelem.i1
        ret@156 := OpCode new literal:"stelem.i1".
        (ret@156) setOperandType int:OpOperTypeInlineNone.
        (ret@156) setFlowControl int:OpFlowNext.
        (ret@156) setOpCodeType int:OpTypeObjmodel.
        (ret@156) setStackBehaviourPop int:IlBPopref_popi_popi.
        (ret@156) setStackBehaviourPush int:IlBPush0.
        (ret@156) setSize int:1.
        (ret@156) setValue short:09Ch.

        // Create instance of opcode: stelem.i2
        ret@157 := OpCode new literal:"stelem.i2".
        (ret@157) setOperandType int:OpOperTypeInlineNone.
        (ret@157) setFlowControl int:OpFlowNext.
        (ret@157) setOpCodeType int:OpTypeObjmodel.
        (ret@157) setStackBehaviourPop int:IlBPopref_popi_popi.
        (ret@157) setStackBehaviourPush int:IlBPush0.
        (ret@157) setSize int:1.
        (ret@157) setValue short:09Dh.

        // Create instance of opcode: stelem.i4
        ret@158 := OpCode new literal:"stelem.i4".
        (ret@158) setOperandType int:OpOperTypeInlineNone.
        (ret@158) setFlowControl int:OpFlowNext.
        (ret@158) setOpCodeType int:OpTypeObjmodel.
        (ret@158) setStackBehaviourPop int:IlBPopref_popi_popi.
        (ret@158) setStackBehaviourPush int:IlBPush0.
        (ret@158) setSize int:1.
        (ret@158) setValue short:09Eh.

        // Create instance of opcode: stelem.i8
        ret@159 := OpCode new literal:"stelem.i8".
        (ret@159) setOperandType int:OpOperTypeInlineNone.
        (ret@159) setFlowControl int:OpFlowNext.
        (ret@159) setOpCodeType int:OpTypeObjmodel.
        (ret@159) setStackBehaviourPop int:IlBPopref_popi_popi8.
        (ret@159) setStackBehaviourPush int:IlBPush0.
        (ret@159) setSize int:1.
        (ret@159) setValue short:09Fh.

        // Create instance of opcode: stelem.r4
        ret@160 := OpCode new literal:"stelem.r4".
        (ret@160) setOperandType int:OpOperTypeInlineNone.
        (ret@160) setFlowControl int:OpFlowNext.
        (ret@160) setOpCodeType int:OpTypeObjmodel.
        (ret@160) setStackBehaviourPop int:IlBPopref_popi_popr4.
        (ret@160) setStackBehaviourPush int:IlBPush0.
        (ret@160) setSize int:1.
        (ret@160) setValue short:0A0h.

        // Create instance of opcode: stelem.r8
        ret@161 := OpCode new literal:"stelem.r8".
        (ret@161) setOperandType int:OpOperTypeInlineNone.
        (ret@161) setFlowControl int:OpFlowNext.
        (ret@161) setOpCodeType int:OpTypeObjmodel.
        (ret@161) setStackBehaviourPop int:IlBPopref_popi_popr8.
        (ret@161) setStackBehaviourPush int:IlBPush0.
        (ret@161) setSize int:1.
        (ret@161) setValue short:0A1h.

        // Create instance of opcode: stelem.ref
        ret@162 := OpCode new literal:"stelem.ref".
        (ret@162) setOperandType int:OpOperTypeInlineNone.
        (ret@162) setFlowControl int:OpFlowNext.
        (ret@162) setOpCodeType int:OpTypeObjmodel.
        (ret@162) setStackBehaviourPop int:IlBPopref_popi_popref.
        (ret@162) setStackBehaviourPush int:IlBPush0.
        (ret@162) setSize int:1.
        (ret@162) setValue short:0A2h.

        // Create instance of opcode: ldelem
        ret@163 := OpCode new literal:"ldelem".
        (ret@163) setOperandType int:OpOperTypeInlineType.
        (ret@163) setFlowControl int:OpFlowNext.
        (ret@163) setOpCodeType int:OpTypeObjmodel.
        (ret@163) setStackBehaviourPop int:IlBPopref_popi.
        (ret@163) setStackBehaviourPush int:IlBPush1.
        (ret@163) setSize int:1.
        (ret@163) setValue short:0A3h.

        // Create instance of opcode: stelem
        ret@164 := OpCode new literal:"stelem".
        (ret@164) setOperandType int:OpOperTypeInlineType.
        (ret@164) setFlowControl int:OpFlowNext.
        (ret@164) setOpCodeType int:OpTypeObjmodel.
        (ret@164) setStackBehaviourPop int:IlBPopref_popi_pop1.
        (ret@164) setStackBehaviourPush int:IlBPush0.
        (ret@164) setSize int:1.
        (ret@164) setValue short:0A4h.

        // Create instance of opcode: unbox.any
        ret@165 := OpCode new literal:"unbox.any".
        (ret@165) setOperandType int:OpOperTypeInlineType.
        (ret@165) setFlowControl int:OpFlowNext.
        (ret@165) setOpCodeType int:OpTypeObjmodel.
        (ret@165) setStackBehaviourPop int:IlBPopref.
        (ret@165) setStackBehaviourPush int:IlBPush1.
        (ret@165) setSize int:1.
        (ret@165) setValue short:0A5h.

        // Create instance of opcode: conv.ovf.i1
        ret@179 := OpCode new literal:"conv.ovf.i1".
        (ret@179) setOperandType int:OpOperTypeInlineNone.
        (ret@179) setFlowControl int:OpFlowNext.
        (ret@179) setOpCodeType int:OpTypePrimitive.
        (ret@179) setStackBehaviourPop int:IlBPop1.
        (ret@179) setStackBehaviourPush int:IlBPushi.
        (ret@179) setSize int:1.
        (ret@179) setValue short:0B3h.

        // Create instance of opcode: conv.ovf.u1
        ret@180 := OpCode new literal:"conv.ovf.u1".
        (ret@180) setOperandType int:OpOperTypeInlineNone.
        (ret@180) setFlowControl int:OpFlowNext.
        (ret@180) setOpCodeType int:OpTypePrimitive.
        (ret@180) setStackBehaviourPop int:IlBPop1.
        (ret@180) setStackBehaviourPush int:IlBPushi.
        (ret@180) setSize int:1.
        (ret@180) setValue short:0B4h.

        // Create instance of opcode: conv.ovf.i2
        ret@181 := OpCode new literal:"conv.ovf.i2".
        (ret@181) setOperandType int:OpOperTypeInlineNone.
        (ret@181) setFlowControl int:OpFlowNext.
        (ret@181) setOpCodeType int:OpTypePrimitive.
        (ret@181) setStackBehaviourPop int:IlBPop1.
        (ret@181) setStackBehaviourPush int:IlBPushi.
        (ret@181) setSize int:1.
        (ret@181) setValue short:0B5h.

        // Create instance of opcode: conv.ovf.u2
        ret@182 := OpCode new literal:"conv.ovf.u2".
        (ret@182) setOperandType int:OpOperTypeInlineNone.
        (ret@182) setFlowControl int:OpFlowNext.
        (ret@182) setOpCodeType int:OpTypePrimitive.
        (ret@182) setStackBehaviourPop int:IlBPop1.
        (ret@182) setStackBehaviourPush int:IlBPushi.
        (ret@182) setSize int:1.
        (ret@182) setValue short:0B6h.

        // Create instance of opcode: conv.ovf.i4
        ret@183 := OpCode new literal:"conv.ovf.i4".
        (ret@183) setOperandType int:OpOperTypeInlineNone.
        (ret@183) setFlowControl int:OpFlowNext.
        (ret@183) setOpCodeType int:OpTypePrimitive.
        (ret@183) setStackBehaviourPop int:IlBPop1.
        (ret@183) setStackBehaviourPush int:IlBPushi.
        (ret@183) setSize int:1.
        (ret@183) setValue short:0B7h.

        // Create instance of opcode: conv.ovf.u4
        ret@184 := OpCode new literal:"conv.ovf.u4".
        (ret@184) setOperandType int:OpOperTypeInlineNone.
        (ret@184) setFlowControl int:OpFlowNext.
        (ret@184) setOpCodeType int:OpTypePrimitive.
        (ret@184) setStackBehaviourPop int:IlBPop1.
        (ret@184) setStackBehaviourPush int:IlBPushi.
        (ret@184) setSize int:1.
        (ret@184) setValue short:0B8h.

        // Create instance of opcode: conv.ovf.i8
        ret@185 := OpCode new literal:"conv.ovf.i8".
        (ret@185) setOperandType int:OpOperTypeInlineNone.
        (ret@185) setFlowControl int:OpFlowNext.
        (ret@185) setOpCodeType int:OpTypePrimitive.
        (ret@185) setStackBehaviourPop int:IlBPop1.
        (ret@185) setStackBehaviourPush int:IlBPushi8.
        (ret@185) setSize int:1.
        (ret@185) setValue short:0B9h.

        // Create instance of opcode: conv.ovf.u8
        ret@186 := OpCode new literal:"conv.ovf.u8".
        (ret@186) setOperandType int:OpOperTypeInlineNone.
        (ret@186) setFlowControl int:OpFlowNext.
        (ret@186) setOpCodeType int:OpTypePrimitive.
        (ret@186) setStackBehaviourPop int:IlBPop1.
        (ret@186) setStackBehaviourPush int:IlBPushi8.
        (ret@186) setSize int:1.
        (ret@186) setValue short:0BAh.

        // Create instance of opcode: refanyval
        ret@194 := OpCode new literal:"refanyval".
        (ret@194) setOperandType int:OpOperTypeInlineType.
        (ret@194) setFlowControl int:OpFlowNext.
        (ret@194) setOpCodeType int:OpTypePrimitive.
        (ret@194) setStackBehaviourPop int:IlBPop1.
        (ret@194) setStackBehaviourPush int:IlBPushi.
        (ret@194) setSize int:1.
        (ret@194) setValue short:0C2h.

        // Create instance of opcode: ckfinite
        ret@195 := OpCode new literal:"ckfinite".
        (ret@195) setOperandType int:OpOperTypeInlineNone.
        (ret@195) setFlowControl int:OpFlowNext.
        (ret@195) setOpCodeType int:OpTypePrimitive.
        (ret@195) setStackBehaviourPop int:IlBPop1.
        (ret@195) setStackBehaviourPush int:IlBPushr8.
        (ret@195) setSize int:1.
        (ret@195) setValue short:0C3h.

        // Create instance of opcode: mkrefany
        ret@198 := OpCode new literal:"mkrefany".
        (ret@198) setOperandType int:OpOperTypeInlineType.
        (ret@198) setFlowControl int:OpFlowNext.
        (ret@198) setOpCodeType int:OpTypePrimitive.
        (ret@198) setStackBehaviourPop int:IlBPopi.
        (ret@198) setStackBehaviourPush int:IlBPush1.
        (ret@198) setSize int:1.
        (ret@198) setValue short:0C6h.

        // Create instance of opcode: ldtoken
        ret@208 := OpCode new literal:"ldtoken".
        (ret@208) setOperandType int:OpOperTypeInlineTok.
        (ret@208) setFlowControl int:OpFlowNext.
        (ret@208) setOpCodeType int:OpTypePrimitive.
        (ret@208) setStackBehaviourPop int:IlBPop0.
        (ret@208) setStackBehaviourPush int:IlBPushi.
        (ret@208) setSize int:1.
        (ret@208) setValue short:0D0h.

        // Create instance of opcode: conv.u2
        ret@209 := OpCode new literal:"conv.u2".
        (ret@209) setOperandType int:OpOperTypeInlineNone.
        (ret@209) setFlowControl int:OpFlowNext.
        (ret@209) setOpCodeType int:OpTypePrimitive.
        (ret@209) setStackBehaviourPop int:IlBPop1.
        (ret@209) setStackBehaviourPush int:IlBPushi.
        (ret@209) setSize int:1.
        (ret@209) setValue short:0D1h.

        // Create instance of opcode: conv.u1
        ret@210 := OpCode new literal:"conv.u1".
        (ret@210) setOperandType int:OpOperTypeInlineNone.
        (ret@210) setFlowControl int:OpFlowNext.
        (ret@210) setOpCodeType int:OpTypePrimitive.
        (ret@210) setStackBehaviourPop int:IlBPop1.
        (ret@210) setStackBehaviourPush int:IlBPushi.
        (ret@210) setSize int:1.
        (ret@210) setValue short:0D2h.

        // Create instance of opcode: conv.i
        ret@211 := OpCode new literal:"conv.i".
        (ret@211) setOperandType int:OpOperTypeInlineNone.
        (ret@211) setFlowControl int:OpFlowNext.
        (ret@211) setOpCodeType int:OpTypePrimitive.
        (ret@211) setStackBehaviourPop int:IlBPop1.
        (ret@211) setStackBehaviourPush int:IlBPushi.
        (ret@211) setSize int:1.
        (ret@211) setValue short:0D3h.

        // Create instance of opcode: conv.ovf.i
        ret@212 := OpCode new literal:"conv.ovf.i".
        (ret@212) setOperandType int:OpOperTypeInlineNone.
        (ret@212) setFlowControl int:OpFlowNext.
        (ret@212) setOpCodeType int:OpTypePrimitive.
        (ret@212) setStackBehaviourPop int:IlBPop1.
        (ret@212) setStackBehaviourPush int:IlBPushi.
        (ret@212) setSize int:1.
        (ret@212) setValue short:0D4h.

        // Create instance of opcode: conv.ovf.u
        ret@213 := OpCode new literal:"conv.ovf.u".
        (ret@213) setOperandType int:OpOperTypeInlineNone.
        (ret@213) setFlowControl int:OpFlowNext.
        (ret@213) setOpCodeType int:OpTypePrimitive.
        (ret@213) setStackBehaviourPop int:IlBPop1.
        (ret@213) setStackBehaviourPush int:IlBPushi.
        (ret@213) setSize int:1.
        (ret@213) setValue short:0D5h.

        // Create instance of opcode: add.ovf
        ret@214 := OpCode new literal:"add.ovf".
        (ret@214) setOperandType int:OpOperTypeInlineNone.
        (ret@214) setFlowControl int:OpFlowNext.
        (ret@214) setOpCodeType int:OpTypePrimitive.
        (ret@214) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@214) setStackBehaviourPush int:IlBPush1.
        (ret@214) setSize int:1.
        (ret@214) setValue short:0D6h.

        // Create instance of opcode: add.ovf.un
        ret@215 := OpCode new literal:"add.ovf.un".
        (ret@215) setOperandType int:OpOperTypeInlineNone.
        (ret@215) setFlowControl int:OpFlowNext.
        (ret@215) setOpCodeType int:OpTypePrimitive.
        (ret@215) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@215) setStackBehaviourPush int:IlBPush1.
        (ret@215) setSize int:1.
        (ret@215) setValue short:0D7h.

        // Create instance of opcode: mul.ovf
        ret@216 := OpCode new literal:"mul.ovf".
        (ret@216) setOperandType int:OpOperTypeInlineNone.
        (ret@216) setFlowControl int:OpFlowNext.
        (ret@216) setOpCodeType int:OpTypePrimitive.
        (ret@216) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@216) setStackBehaviourPush int:IlBPush1.
        (ret@216) setSize int:1.
        (ret@216) setValue short:0D8h.

        // Create instance of opcode: mul.ovf.un
        ret@217 := OpCode new literal:"mul.ovf.un".
        (ret@217) setOperandType int:OpOperTypeInlineNone.
        (ret@217) setFlowControl int:OpFlowNext.
        (ret@217) setOpCodeType int:OpTypePrimitive.
        (ret@217) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@217) setStackBehaviourPush int:IlBPush1.
        (ret@217) setSize int:1.
        (ret@217) setValue short:0D9h.

        // Create instance of opcode: sub.ovf
        ret@218 := OpCode new literal:"sub.ovf".
        (ret@218) setOperandType int:OpOperTypeInlineNone.
        (ret@218) setFlowControl int:OpFlowNext.
        (ret@218) setOpCodeType int:OpTypePrimitive.
        (ret@218) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@218) setStackBehaviourPush int:IlBPush1.
        (ret@218) setSize int:1.
        (ret@218) setValue short:0DAh.

        // Create instance of opcode: sub.ovf.un
        ret@219 := OpCode new literal:"sub.ovf.un".
        (ret@219) setOperandType int:OpOperTypeInlineNone.
        (ret@219) setFlowControl int:OpFlowNext.
        (ret@219) setOpCodeType int:OpTypePrimitive.
        (ret@219) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@219) setStackBehaviourPush int:IlBPush1.
        (ret@219) setSize int:1.
        (ret@219) setValue short:0DBh.

        // Create instance of opcode: endfinally
        ret@220 := OpCode new literal:"endfinally".
        (ret@220) setOperandType int:OpOperTypeInlineNone.
        (ret@220) setFlowControl int:OpFlowReturn.
        (ret@220) setOpCodeType int:OpTypePrimitive.
        (ret@220) setStackBehaviourPop int:IlBPop0.
        (ret@220) setStackBehaviourPush int:IlBPush0.
        (ret@220) setSize int:1.
        (ret@220) setValue short:0DCh.

        // Create instance of opcode: leave
        ret@221 := OpCode new literal:"leave".
        (ret@221) setOperandType int:OpOperTypeInlineBrTarget.
        (ret@221) setFlowControl int:OpFlowBranch.
        (ret@221) setOpCodeType int:OpTypePrimitive.
        (ret@221) setStackBehaviourPop int:IlBPop0.
        (ret@221) setStackBehaviourPush int:IlBPush0.
        (ret@221) setSize int:1.
        (ret@221) setValue short:0DDh.

        // Create instance of opcode: leave.s
        ret@222 := OpCode new literal:"leave.s".
        (ret@222) setOperandType int:OpOperTypeShortInlineBrTarget.
        (ret@222) setFlowControl int:OpFlowBranch.
        (ret@222) setOpCodeType int:OpTypePrimitive.
        (ret@222) setStackBehaviourPop int:IlBPop0.
        (ret@222) setStackBehaviourPush int:IlBPush0.
        (ret@222) setSize int:1.
        (ret@222) setValue short:0DEh.

        // Create instance of opcode: stind.i
        ret@223 := OpCode new literal:"stind.i".
        (ret@223) setOperandType int:OpOperTypeInlineNone.
        (ret@223) setFlowControl int:OpFlowNext.
        (ret@223) setOpCodeType int:OpTypePrimitive.
        (ret@223) setStackBehaviourPop int:IlBPopi_popi.
        (ret@223) setStackBehaviourPush int:IlBPush0.
        (ret@223) setSize int:1.
        (ret@223) setValue short:0DFh.

        // Create instance of opcode: conv.u
        ret@224 := OpCode new literal:"conv.u".
        (ret@224) setOperandType int:OpOperTypeInlineNone.
        (ret@224) setFlowControl int:OpFlowNext.
        (ret@224) setOpCodeType int:OpTypePrimitive.
        (ret@224) setStackBehaviourPop int:IlBPop1.
        (ret@224) setStackBehaviourPush int:IlBPushi.
        (ret@224) setSize int:1.
        (ret@224) setValue short:0E0h.

        // Create instance of opcode: prefix7
        ret@248 := OpCode new literal:"prefix7".
        (ret@248) setOperandType int:OpOperTypeInlineNone.
        (ret@248) setFlowControl int:OpFlowMeta.
        (ret@248) setOpCodeType int:OpTypeNternal.
        (ret@248) setStackBehaviourPop int:IlBPop0.
        (ret@248) setStackBehaviourPush int:IlBPush0.
        (ret@248) setSize int:1.
        (ret@248) setValue short:0F8h.

        // Create instance of opcode: prefix6
        ret@249 := OpCode new literal:"prefix6".
        (ret@249) setOperandType int:OpOperTypeInlineNone.
        (ret@249) setFlowControl int:OpFlowMeta.
        (ret@249) setOpCodeType int:OpTypeNternal.
        (ret@249) setStackBehaviourPop int:IlBPop0.
        (ret@249) setStackBehaviourPush int:IlBPush0.
        (ret@249) setSize int:1.
        (ret@249) setValue short:0F9h.

        // Create instance of opcode: prefix5
        ret@250 := OpCode new literal:"prefix5".
        (ret@250) setOperandType int:OpOperTypeInlineNone.
        (ret@250) setFlowControl int:OpFlowMeta.
        (ret@250) setOpCodeType int:OpTypeNternal.
        (ret@250) setStackBehaviourPop int:IlBPop0.
        (ret@250) setStackBehaviourPush int:IlBPush0.
        (ret@250) setSize int:1.
        (ret@250) setValue short:0FAh.

        // Create instance of opcode: prefix4
        ret@251 := OpCode new literal:"prefix4".
        (ret@251) setOperandType int:OpOperTypeInlineNone.
        (ret@251) setFlowControl int:OpFlowMeta.
        (ret@251) setOpCodeType int:OpTypeNternal.
        (ret@251) setStackBehaviourPop int:IlBPop0.
        (ret@251) setStackBehaviourPush int:IlBPush0.
        (ret@251) setSize int:1.
        (ret@251) setValue short:0FBh.

        // Create instance of opcode: prefix3
        ret@252 := OpCode new literal:"prefix3".
        (ret@252) setOperandType int:OpOperTypeInlineNone.
        (ret@252) setFlowControl int:OpFlowMeta.
        (ret@252) setOpCodeType int:OpTypeNternal.
        (ret@252) setStackBehaviourPop int:IlBPop0.
        (ret@252) setStackBehaviourPush int:IlBPush0.
        (ret@252) setSize int:1.
        (ret@252) setValue short:0FCh.

        // Create instance of opcode: prefix2
        ret@253 := OpCode new literal:"prefix2".
        (ret@253) setOperandType int:OpOperTypeInlineNone.
        (ret@253) setFlowControl int:OpFlowMeta.
        (ret@253) setOpCodeType int:OpTypeNternal.
        (ret@253) setStackBehaviourPop int:IlBPop0.
        (ret@253) setStackBehaviourPush int:IlBPush0.
        (ret@253) setSize int:1.
        (ret@253) setValue short:0FDh.

        // Create instance of opcode: prefix1
        ret@254 := OpCode new literal:"prefix1".
        (ret@254) setOperandType int:OpOperTypeInlineNone.
        (ret@254) setFlowControl int:OpFlowMeta.
        (ret@254) setOpCodeType int:OpTypeNternal.
        (ret@254) setStackBehaviourPop int:IlBPop0.
        (ret@254) setStackBehaviourPush int:IlBPush0.
        (ret@254) setSize int:1.
        (ret@254) setValue short:0FEh.

        // Create instance of opcode: prefixref
        ret@255 := OpCode new literal:"prefixref".
        (ret@255) setOperandType int:OpOperTypeInlineNone.
        (ret@255) setFlowControl int:OpFlowMeta.
        (ret@255) setOpCodeType int:OpTypeNternal.
        (ret@255) setStackBehaviourPop int:IlBPop0.
        (ret@255) setStackBehaviourPush int:IlBPush0.
        (ret@255) setSize int:1.
        (ret@255) setValue short:0FFh.

        // Create instance of opcode: arglist
        ret@256 := OpCode new literal:"arglist".
        (ret@256) setOperandType int:OpOperTypeInlineNone.
        (ret@256) setFlowControl int:OpFlowNext.
        (ret@256) setOpCodeType int:OpTypePrimitive.
        (ret@256) setStackBehaviourPop int:IlBPop0.
        (ret@256) setStackBehaviourPush int:IlBPushi.
        (ret@256) setSize int:2.
        (ret@256) setValue short:0FE00h.

        // Create instance of opcode: ceq
        ret@257 := OpCode new literal:"ceq".
        (ret@257) setOperandType int:OpOperTypeInlineNone.
        (ret@257) setFlowControl int:OpFlowNext.
        (ret@257) setOpCodeType int:OpTypePrimitive.
        (ret@257) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@257) setStackBehaviourPush int:IlBPushi.
        (ret@257) setSize int:2.
        (ret@257) setValue short:0FE01h.

        // Create instance of opcode: cgt
        ret@258 := OpCode new literal:"cgt".
        (ret@258) setOperandType int:OpOperTypeInlineNone.
        (ret@258) setFlowControl int:OpFlowNext.
        (ret@258) setOpCodeType int:OpTypePrimitive.
        (ret@258) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@258) setStackBehaviourPush int:IlBPushi.
        (ret@258) setSize int:2.
        (ret@258) setValue short:0FE02h.

        // Create instance of opcode: cgt.un
        ret@259 := OpCode new literal:"cgt.un".
        (ret@259) setOperandType int:OpOperTypeInlineNone.
        (ret@259) setFlowControl int:OpFlowNext.
        (ret@259) setOpCodeType int:OpTypePrimitive.
        (ret@259) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@259) setStackBehaviourPush int:IlBPushi.
        (ret@259) setSize int:2.
        (ret@259) setValue short:0FE03h.

        // Create instance of opcode: clt
        ret@260 := OpCode new literal:"clt".
        (ret@260) setOperandType int:OpOperTypeInlineNone.
        (ret@260) setFlowControl int:OpFlowNext.
        (ret@260) setOpCodeType int:OpTypePrimitive.
        (ret@260) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@260) setStackBehaviourPush int:IlBPushi.
        (ret@260) setSize int:2.
        (ret@260) setValue short:0FE04h.

        // Create instance of opcode: clt.un
        ret@261 := OpCode new literal:"clt.un".
        (ret@261) setOperandType int:OpOperTypeInlineNone.
        (ret@261) setFlowControl int:OpFlowNext.
        (ret@261) setOpCodeType int:OpTypePrimitive.
        (ret@261) setStackBehaviourPop int:IlBPop1_pop1.
        (ret@261) setStackBehaviourPush int:IlBPushi.
        (ret@261) setSize int:2.
        (ret@261) setValue short:0FE05h.

        // Create instance of opcode: ldftn
        ret@262 := OpCode new literal:"ldftn".
        (ret@262) setOperandType int:OpOperTypeInlineMethod.
        (ret@262) setFlowControl int:OpFlowNext.
        (ret@262) setOpCodeType int:OpTypePrimitive.
        (ret@262) setStackBehaviourPop int:IlBPop0.
        (ret@262) setStackBehaviourPush int:IlBPushi.
        (ret@262) setSize int:2.
        (ret@262) setValue short:0FE06h.

        // Create instance of opcode: ldvirtftn
        ret@263 := OpCode new literal:"ldvirtftn".
        (ret@263) setOperandType int:OpOperTypeInlineMethod.
        (ret@263) setFlowControl int:OpFlowNext.
        (ret@263) setOpCodeType int:OpTypePrimitive.
        (ret@263) setStackBehaviourPop int:IlBPopref.
        (ret@263) setStackBehaviourPush int:IlBPushi.
        (ret@263) setSize int:2.
        (ret@263) setValue short:0FE07h.

        // Create instance of opcode: ldarg
        ret@265 := OpCode new literal:"ldarg".
        (ret@265) setOperandType int:OpOperTypeInlineVar.
        (ret@265) setFlowControl int:OpFlowNext.
        (ret@265) setOpCodeType int:OpTypePrimitive.
        (ret@265) setStackBehaviourPop int:IlBPop0.
        (ret@265) setStackBehaviourPush int:IlBPush1.
        (ret@265) setSize int:2.
        (ret@265) setValue short:0FE09h.

        // Create instance of opcode: ldarga
        ret@266 := OpCode new literal:"ldarga".
        (ret@266) setOperandType int:OpOperTypeInlineVar.
        (ret@266) setFlowControl int:OpFlowNext.
        (ret@266) setOpCodeType int:OpTypePrimitive.
        (ret@266) setStackBehaviourPop int:IlBPop0.
        (ret@266) setStackBehaviourPush int:IlBPushi.
        (ret@266) setSize int:2.
        (ret@266) setValue short:0FE0Ah.

        // Create instance of opcode: starg
        ret@267 := OpCode new literal:"starg".
        (ret@267) setOperandType int:OpOperTypeInlineVar.
        (ret@267) setFlowControl int:OpFlowNext.
        (ret@267) setOpCodeType int:OpTypePrimitive.
        (ret@267) setStackBehaviourPop int:IlBPop1.
        (ret@267) setStackBehaviourPush int:IlBPush0.
        (ret@267) setSize int:2.
        (ret@267) setValue short:0FE0Bh.

        // Create instance of opcode: ldloc
        ret@268 := OpCode new literal:"ldloc".
        (ret@268) setOperandType int:OpOperTypeInlineVar.
        (ret@268) setFlowControl int:OpFlowNext.
        (ret@268) setOpCodeType int:OpTypePrimitive.
        (ret@268) setStackBehaviourPop int:IlBPop0.
        (ret@268) setStackBehaviourPush int:IlBPush1.
        (ret@268) setSize int:2.
        (ret@268) setValue short:0FE0Ch.

        // Create instance of opcode: ldloca
        ret@269 := OpCode new literal:"ldloca".
        (ret@269) setOperandType int:OpOperTypeInlineVar.
        (ret@269) setFlowControl int:OpFlowNext.
        (ret@269) setOpCodeType int:OpTypePrimitive.
        (ret@269) setStackBehaviourPop int:IlBPop0.
        (ret@269) setStackBehaviourPush int:IlBPushi.
        (ret@269) setSize int:2.
        (ret@269) setValue short:0FE0Dh.

        // Create instance of opcode: stloc
        ret@270 := OpCode new literal:"stloc".
        (ret@270) setOperandType int:OpOperTypeInlineVar.
        (ret@270) setFlowControl int:OpFlowNext.
        (ret@270) setOpCodeType int:OpTypePrimitive.
        (ret@270) setStackBehaviourPop int:IlBPop1.
        (ret@270) setStackBehaviourPush int:IlBPush0.
        (ret@270) setSize int:2.
        (ret@270) setValue short:0FE0Eh.

        // Create instance of opcode: localloc
        ret@271 := OpCode new literal:"localloc".
        (ret@271) setOperandType int:OpOperTypeInlineNone.
        (ret@271) setFlowControl int:OpFlowNext.
        (ret@271) setOpCodeType int:OpTypePrimitive.
        (ret@271) setStackBehaviourPop int:IlBPopi.
        (ret@271) setStackBehaviourPush int:IlBPushi.
        (ret@271) setSize int:2.
        (ret@271) setValue short:0FE0Fh.

        // Create instance of opcode: endfilter
        ret@273 := OpCode new literal:"endfilter".
        (ret@273) setOperandType int:OpOperTypeInlineNone.
        (ret@273) setFlowControl int:OpFlowReturn.
        (ret@273) setOpCodeType int:OpTypePrimitive.
        (ret@273) setStackBehaviourPop int:IlBPopi.
        (ret@273) setStackBehaviourPush int:IlBPush0.
        (ret@273) setSize int:2.
        (ret@273) setValue short:0FE11h.

        // Create instance of opcode: unaligned.
        ret@274 := OpCode new literal:"unaligned.".
        (ret@274) setOperandType int:OpOperTypeShortInlineI.
        (ret@274) setFlowControl int:OpFlowMeta.
        (ret@274) setOpCodeType int:OpTypePrefix.
        (ret@274) setStackBehaviourPop int:IlBPop0.
        (ret@274) setStackBehaviourPush int:IlBPush0.
        (ret@274) setSize int:2.
        (ret@274) setValue short:0FE12h.

        // Create instance of opcode: volatile.
        ret@275 := OpCode new literal:"volatile.".
        (ret@275) setOperandType int:OpOperTypeInlineNone.
        (ret@275) setFlowControl int:OpFlowMeta.
        (ret@275) setOpCodeType int:OpTypePrefix.
        (ret@275) setStackBehaviourPop int:IlBPop0.
        (ret@275) setStackBehaviourPush int:IlBPush0.
        (ret@275) setSize int:2.
        (ret@275) setValue short:0FE13h.

        // Create instance of opcode: tail.
        ret@276 := OpCode new literal:"tail.".
        (ret@276) setOperandType int:OpOperTypeInlineNone.
        (ret@276) setFlowControl int:OpFlowMeta.
        (ret@276) setOpCodeType int:OpTypePrefix.
        (ret@276) setStackBehaviourPop int:IlBPop0.
        (ret@276) setStackBehaviourPush int:IlBPush0.
        (ret@276) setSize int:2.
        (ret@276) setValue short:0FE14h.

        // Create instance of opcode: initobj
        ret@277 := OpCode new literal:"initobj".
        (ret@277) setOperandType int:OpOperTypeInlineType.
        (ret@277) setFlowControl int:OpFlowNext.
        (ret@277) setOpCodeType int:OpTypeObjmodel.
        (ret@277) setStackBehaviourPop int:IlBPopi.
        (ret@277) setStackBehaviourPush int:IlBPush0.
        (ret@277) setSize int:2.
        (ret@277) setValue short:0FE15h.

        // Create instance of opcode: constrained.
        ret@278 := OpCode new literal:"constrained.".
        (ret@278) setOperandType int:OpOperTypeInlineType.
        (ret@278) setFlowControl int:OpFlowMeta.
        (ret@278) setOpCodeType int:OpTypePrefix.
        (ret@278) setStackBehaviourPop int:IlBPop0.
        (ret@278) setStackBehaviourPush int:IlBPush0.
        (ret@278) setSize int:2.
        (ret@278) setValue short:0FE16h.

        // Create instance of opcode: cpblk
        ret@279 := OpCode new literal:"cpblk".
        (ret@279) setOperandType int:OpOperTypeInlineNone.
        (ret@279) setFlowControl int:OpFlowNext.
        (ret@279) setOpCodeType int:OpTypePrimitive.
        (ret@279) setStackBehaviourPop int:IlBPopi_popi_popi.
        (ret@279) setStackBehaviourPush int:IlBPush0.
        (ret@279) setSize int:2.
        (ret@279) setValue short:0FE17h.

        // Create instance of opcode: initblk
        ret@280 := OpCode new literal:"initblk".
        (ret@280) setOperandType int:OpOperTypeInlineNone.
        (ret@280) setFlowControl int:OpFlowNext.
        (ret@280) setOpCodeType int:OpTypePrimitive.
        (ret@280) setStackBehaviourPop int:IlBPopi_popi_popi.
        (ret@280) setStackBehaviourPush int:IlBPush0.
        (ret@280) setSize int:2.
        (ret@280) setValue short:0FE18h.

        // Create instance of opcode: rethrow
        ret@282 := OpCode new literal:"rethrow".
        (ret@282) setOperandType int:OpOperTypeInlineNone.
        (ret@282) setFlowControl int:OpFlowThrow.
        (ret@282) setOpCodeType int:OpTypeObjmodel.
        (ret@282) setStackBehaviourPop int:IlBPop0.
        (ret@282) setStackBehaviourPush int:IlBPush0.
        (ret@282) setSize int:2.
        (ret@282) setValue short:0FE1Ah.

        // Create instance of opcode: sizeof
        ret@284 := OpCode new literal:"sizeof".
        (ret@284) setOperandType int:OpOperTypeInlineType.
        (ret@284) setFlowControl int:OpFlowNext.
        (ret@284) setOpCodeType int:OpTypePrimitive.
        (ret@284) setStackBehaviourPop int:IlBPop0.
        (ret@284) setStackBehaviourPush int:IlBPushi.
        (ret@284) setSize int:2.
        (ret@284) setValue short:0FE1Ch.

        // Create instance of opcode: refanytype
        ret@285 := OpCode new literal:"refanytype".
        (ret@285) setOperandType int:OpOperTypeInlineNone.
        (ret@285) setFlowControl int:OpFlowNext.
        (ret@285) setOpCodeType int:OpTypePrimitive.
        (ret@285) setStackBehaviourPop int:IlBPop1.
        (ret@285) setStackBehaviourPush int:IlBPushi.
        (ret@285) setSize int:2.
        (ret@285) setValue short:0FE1Dh.

        // Create instance of opcode: readonly.
        ret@286 := OpCode new literal:"readonly.".
        (ret@286) setOperandType int:OpOperTypeInlineNone.
        (ret@286) setFlowControl int:OpFlowMeta.
        (ret@286) setOpCodeType int:OpTypePrefix.
        (ret@286) setStackBehaviourPop int:IlBPop0.
        (ret@286) setStackBehaviourPush int:IlBPush0.
        (ret@286) setSize int:2.
        (ret@286) setValue short:0FE1Eh.
        
        ^ret.
    ]
}