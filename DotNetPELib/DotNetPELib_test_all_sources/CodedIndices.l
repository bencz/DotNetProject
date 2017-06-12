import system.

codedIndexMetaDataTables =
[
    var rt := Array new int:12.
    
    // TypeDefOrRef
    rt@0 := IntArray new int:3.
    rt@0@0 := mdTtypeDef.
    rt@0@1 := mdTtypeRef.
    rt@0@2 := mdTtypeSpec.
    
    // HasConstant
    rt@1 := IntArray new int:3.
    rt@1@0 := mdTfield.
    rt@1@1 := mdTparam.
    rt@1@2 := mdTproperty.
    
    // HasCustomAttribute
    rt@2 := IntArray new int:19.
    rt@2@00 := mdTmethodDef.
    rt@2@01 := mdTfield.
    rt@2@02 := mdTtypeRef.
    rt@2@03 := mdTtypeDef.
    rt@2@04 := mdTparam.
    rt@2@05 := mdTinterfaceImpl.
    rt@2@06 := mdTmemberRef.
    rt@2@07 := mdTmodule.
    rt@2@08 := mdTdeclSecurity.
    rt@2@09 := mdTproperty.
    rt@2@10 := mdTevent.
    rt@2@11 := mdTstandAloneSig.
    rt@2@12 := mdTmoduleRef.
    rt@2@13 := mdTtypeSpec.
    rt@2@14 := mdTassembly.
    rt@2@15 := mdTassemblyRef.
    rt@2@16 := mdTfile.
    rt@2@17 := mdTexportedType.
    rt@2@18 := mdTmanifestResource.
    
    // HasFieldMarshal
    rt@3 := IntArray new int:2.
    rt@3@0 := mdTfield.
    rt@3@1 := mdTparam.

    // HasDeclSecurity
    rt@4 := IntArray new int:3.
    rt@4@0 := mdTtypeDef.
    rt@4@1 := mdTmethodDef.
    rt@4@2 := mdTassembly.

    // MemberRefParent
    rt@5 := IntArray new int:5.
    rt@5@0 := mdTnotUsed.
    rt@5@1 := mdTtypeRef.
    rt@5@2 := mdTmoduleRef.
    rt@5@3 := mdTmethodDef.
    rt@5@4 := mdTtypeSpec.
    
    // HasSemantics
    rt@6 := IntArray new int:2.
    rt@6@0 := mdTevent.
    rt@6@1 := mdTproperty.
    
    // MethodDefOrRef
    rt@7 := IntArray new int:2.
    rt@7@0 := mdTmethodDef.
    rt@7@1 := mdTmemberRef.

    // MemberForwarded
    rt@8 := IntArray new int:2.
    rt@8@0 := mdTfield.
    rt@8@1 := mdTmethodDef.
    
    // Implementation
    rt@9 := IntArray new int:3.
    rt@9@0 := mdTfile.
    rt@9@1 := mdTassemblyRef.
    rt@9@2 := mdTexportedType.

    // CustomAttributeType
    rt@10 := IntArray new int:5.
    rt@10@0 := mdTnotUsed.
    rt@10@1 := mdTnotUsed.
    rt@10@2 := mdTmethodDef.
    rt@10@3 := mdTmemberRef.
    rt@10@4 := mdTnotUsed.
    
    // ResolutionScope
    rt@11 := IntArray new int:4.
    rt@11@0 := mdTmodule.
    rt@11@1 := mdTmoduleRef.
    rt@11@2 := mdTassemblyRef.
    rt@11@3 := mdTtypeRef.
    
    ^rt.
].