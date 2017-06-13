import system.

codedIndexMetaDataTables =
[
    var rt := Array new int:12.
    
    // TypeDefOrRef
    rt@0 := IntArray new int:3.
    rt@0@0 := mdtTypeDef.
    rt@0@1 := mdtTypeRef.
    rt@0@2 := mdtTypeSpec.
    
    // HasConstant
    rt@1 := IntArray new int:3.
    rt@1@0 := mdtField.
    rt@1@1 := mdtParam.
    rt@1@2 := mdtProperty.
    
    // HasCustomAttribute
    rt@2 := IntArray new int:19.
    rt@2@00 := mdtMethodDef.
    rt@2@01 := mdtField.
    rt@2@02 := mdtTypeRef.
    rt@2@03 := mdtTypeDef.
    rt@2@04 := mdtParam.
    rt@2@05 := mdtInterfaceImpl.
    rt@2@06 := mdtMemberRef.
    rt@2@07 := mdtModule.
    rt@2@08 := mdtDeclSecurity.
    rt@2@09 := mdtProperty.
    rt@2@10 := mdtEvent.
    rt@2@11 := mdtStandAloneSig.
    rt@2@12 := mdtModuleRef.
    rt@2@13 := mdtTypeSpec.
    rt@2@14 := mdtAssembly.
    rt@2@15 := mdtAssemblyRef.
    rt@2@16 := mdtFile.
    rt@2@17 := mdtExportedType.
    rt@2@18 := mdtManifestResource.
    
    // HasFieldMarshal
    rt@3 := IntArray new int:2.
    rt@3@0 := mdtField.
    rt@3@1 := mdtParam.

    // HasDeclSecurity
    rt@4 := IntArray new int:3.
    rt@4@0 := mdtTypeDef.
    rt@4@1 := mdtMethodDef.
    rt@4@2 := mdtAssembly.

    // MemberRefParent
    rt@5 := IntArray new int:5.
    rt@5@0 := mdtNotUsed.
    rt@5@1 := mdtTypeRef.
    rt@5@2 := mdtModuleRef.
    rt@5@3 := mdtMethodDef.
    rt@5@4 := mdtTypeSpec.
    
    // HasSemantics
    rt@6 := IntArray new int:2.
    rt@6@0 := mdtEvent.
    rt@6@1 := mdtProperty.
    
    // MethodDefOrRef
    rt@7 := IntArray new int:2.
    rt@7@0 := mdtMethodDef.
    rt@7@1 := mdtMemberRef.

    // MemberForwarded
    rt@8 := IntArray new int:2.
    rt@8@0 := mdtField.
    rt@8@1 := mdtMethodDef.
    
    // Implementation
    rt@9 := IntArray new int:3.
    rt@9@0 := mdtFile.
    rt@9@1 := mdtAssemblyRef.
    rt@9@2 := mdtExportedType.

    // CustomAttributeType
    rt@10 := IntArray new int:5.
    rt@10@0 := mdtNotUsed.
    rt@10@1 := mdtNotUsed.
    rt@10@2 := mdtMethodDef.
    rt@10@3 := mdtMemberRef.
    rt@10@4 := mdtNotUsed.
    
    // ResolutionScope
    rt@11 := IntArray new int:4.
    rt@11@0 := mdtModule.
    rt@11@1 := mdtModuleRef.
    rt@11@2 := mdtAssemblyRef.
    rt@11@3 := mdtTypeRef.
    
    ^rt.
].