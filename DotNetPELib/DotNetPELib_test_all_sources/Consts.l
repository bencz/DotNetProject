// types of Coded indexes
const cdIdcTypeDefOrRef = 0.
const cdIdcHasConstant = 1.
const cdIdcHasCustomAttribute = 2.
const cdIdcHasFieldMarshal = 3.
const cdIdcHasDeclSecurity = 4.
const cdIdcMemberRefParent = 5.
const cdIdcHasSemantics = 6.
const cdIdcMethodDefOrRef = 7.
const cdIdcMemberForwarded = 8.
const cdIdcImplementation = 9.
const cdIdcCustomAttributeType = 10.
const cdIdcResolutionScope = 11.

// types of Metadata tables
const mdtModule = 00h.
const mdtTypeRef = 01h.
const mdtTypeDef = 02h.
const mdtField = 04h.
const mdtMethodDef = 06h.
const mdtParam = 08h.
const mdtInterfaceImpl = 09h.
const mdtMemberRef = 0Ah.
const mdtConstant = 0Bh.
const mdtCustomAttribute = 0Ch.
const mdtFieldMarshal = 0Dh.
const mdtDeclSecurity = 0Eh.
const mdtClassLayout = 0Fh.
const mdtFieldLayout = 10h.
const mdtStandAloneSig = 11h.
const mdtEventMap = 12h.
const mdtEvent = 14h.
const mdtPropertyMap = 15h.
const mdtProperty = 17h.
const mdtMethodSemantics = 18h.
const mdtMethodImpl = 19h.
const mdtModuleRef = 1Ah.
const mdtTypeSpec = 1Bh.
const mdtImplMap = 1Ch.
const mdtFieldRVA = 1Dh.
const mdtAssembly = 20h.
const mdtAssemblyProcessor = 21h.
const mdtAssemblyOS = 22h.
const mdtAssemblyRef = 23h.
const mdtAssemblyRefProcessor = 24h.
const mdtAssemblyRefOS = 25h.
const mdtFile = 26h.
const mdtExportedType = 27h.
const mdtManifestResource = 28h.
const mdtNestedClass = 29h.
const mdtNotUsed = 3fh.

// Il opcode type
const OpTypeAnnotation = 0.
const OpTypeMacro = 1.
const OpTypeNternal = 2.
const OpTypeObjmodel = 3.
const OpTypePrefix = 4.
const OpTypePrimitive = 5.

// Ip opcode operand type
const OpOperTypeInlineBrTarget = 0.
const OpOperTypeInlineField = 1.
const OpOperTypeInlineI = 2.
const OpOperTypeInlineI8 = 3.
const OpOperTypeInlineMethod = 4.
const OpOperTypeInlineNone = 5.
const OpOperTypeInlinePhi = 6.
const OpOperTypeInlineR = 7.
const OpOperTypeInlineSig = 9.
const OpOperTypeInlineString = 10.
const OpOperTypeInlineSwitch = 11.
const OpOperTypeInlineTok = 12.
const OpOperTypeInlineType = 13.
const OpOperTypeInlineVar = 14.
const OpOperTypeShortInlineBrTarget = 15.
const OpOperTypeShortInlineI = 16.
const OpOperTypeShortInlineR = 17.
const OpOperTypeShortInlineVar = 18.

// Opcode flow control
const OpFlowBranch = 0.
const OpFlowBreak = 1.
const OpFlowCall = 2.
const OpFlowCond_Branch = 3.
const OpFlowMeta = 4.
const OpFlowNext = 5.
const OpFlowPhi = 6.
const OpFlowReturn = 7.
const OpFlowThrow = 8.


// Il opcodes behaviour
const IlBPop0 = 0.
const IlBPop1 = 1.
const IlBPop1_pop1 = 2.
const IlBPopi = 3.
const IlBPopi_pop1 = 4.
const IlBPopi_popi = 5.
const IlBPopi_popi8 = 6.
const IlBPopi_popi_popi = 7.
const IlBPopi_popr4 = 8.
const IlBPopi_popr8 = 9.
const IlBPopref = 10.
const IlBPopref_pop1 = 11.
const IlBPopref_popi = 12.
const IlBPopref_popi_popi = 13.
const IlBPopref_popi_popi8 = 14.
const IlBPopref_popi_popr4 = 15.
const IlBPopref_popi_popr8 = 16.
const IlBPopref_popi_popref = 17.
const IlBPush0 = 18.
const IlBPush1 = 19.
const IlBPush1_push1 = 20.
const IlBPushi = 21.
const IlBPushi8 = 22.
const IlBPushr4 = 23.
const IlBPushr8 = 24.
const IlBPushref = 25.
const IlBVarpop = 26.
const IlBVarpush = 27.
const IlBPopref_popi_pop1 = 28.