import system.

class ILCode
{
    int theAddress.
    object theOpCode.
    int theOpCodeLength.
    object theOperand.
    int theOperandLength.
    bool theIsBrTarget.
    
    address = theAddress.
    setAddress int:aAddress [ theAddress := aAddress. ]
    
    opCode = theOpCode.
    setOpCode opcode:aOpCode [ theOpCode := aOpCode. ]
    
    opCodeLength = theOpCodeLength.
    setOpCodeLength int:aOpCodeLength [ theOpCodeLength := aOpCodeLength. ]
    
    operand = theOperand.
    setOperand operand:aOperand [ theOperand := aOperand. ]
    
    operandLength = theOperandLength.
    setOperandLength int:aOperandLength [ theOperandLength := aOperandLength. ]
    
    isBrTarget = theIsBrTarget.
    setIsBrTarget bool:aIsBrTarget [ theIsBrTarget := aIsBrTarget. ]
}