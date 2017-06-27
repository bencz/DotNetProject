import system.
import system'io.
import system'text.
import system'routines.
import system'collections.
import extensions.
import extensions'routines.

const exeFileNameTest = "..\TestExecutables\Test1.exe".

extension UtilTest
{
    getOperandValue ilCode:aIl
    [
        var opType := aIl operand.
        if($nil != opType)
        [
            if(((opType class_ref) == ByteNumber) ||
               ((opType class_ref) == IntNumber))
            [
                ^opType.
            ].
        ].
        
        var mne := (aIl opCode) name.
        var vlr := mne@((mne length) - 1).
        var charValue := (vlr~convertorOp toChar)~convertorOp toInt.
        ^(((mne length) < 1)iif:0:(charValue - 30h)).
    ]
    
    loadUsTable peData:aPeData
    [
        var ret := $nil.
        
        if($nil != (aPeData usrstr))
        [
            ret := Dictionary new.
            
            int address := (aPeData usrstr) getDataOffset.
            int pointer := 1.
            while((((aPeData data)@(address + pointer)) != 0) && (pointer < ((aPeData usrstr) size)))
            [
                var dtSize := (aPeData usrstr) getDataSize int:(address + pointer).
                var bytes := Util getBytes bytearray:(aPeData data) int:(address + pointer + (dtSize A)) int:(dtSize B).
                var str := $self getUnicodeString bytearray:bytes.
                ret@pointer := str.
                pointer := pointer + (dtSize A) + (dtSize B).
            ].
        ].
        
        ^ret.
    ]
    
    getUnicodeString bytearray:aBytes
    [
        var rt := "".
        int i := 0.
        while(i < ((aBytes length) - 1))
        [
            var b := aBytes@i.
            rt := rt + b~convertorOp toChar.
            i := i + 1.
        ].
        //aBytes run each:(:b) [ rt := rt + b~convertorOp toChar. ].
        ^rt.
    ]
    
    getFunctionName peData:aPeData ilCode:aIl
    [
        var tb := (aPeData indexManager) getTable int:(aIl operand).
        ^((tb getTag) fullName).
    ]
    
    getBrTarget ilCode:aIl
    [
        ^ Util getBrTarget ilCode:aIl.
    ]
    
    generateLabelName ilCode:aIl
    [
        ^($self generateLabelName int:(aIl address)).
    ]
    
    generateLabelName int:aAddress
    [
        var ilAddress := aAddress~convertorOp toLiteral base:16.
        var text := "IL_" + (ilAddress~literalOp padLeft char:$48 int:4).
        ^text.
    ]
    
    getSwitchJumps peData:aPeData ilCode:aIl
    [
        list rt := List new.
        
        int numOfSwitchs := aIl operand.
        int address := (aIl address) + (aIl opCodeLength) + 4.
        int jmpOffset := address + (numOfSwitchs << 2).
        
        int i := 0.
        while(i < numOfSwitchs)
        [
            var dslc := jmpOffset + (self getInt32 peData:aPeData int:address).
            rt append:dslc.         
            address := address + 4.
            i := i + 1.
        ].
        
        ^rt.
    ]
    
    getInt32 peData:aPeData int:aAddress
    [
        ^(Util getInt32 bytearray:(aPeData data) int:aAddress).
    ]
    
    getDataSize peData:aPeData int:aAddress
    [
        var dtSize := Util getDataSize bytearray:(aPeData data) int:aAddress.
        ^dtSize.
    ]
    
    getDataSizeHexLiteral peData:aPeData int:aAddress int:nPad
    [
        var dtSize := (self getDataSize peData:aPeData int:aAddress) B.
        ^((dtSize~convertorOp toLiteral base:16)~literalOp padLeft char:$48 int:nPad).
    ]
    
    getBlobType peData:aPeData int:aAddress
    [
        var tp := (aPeData data)@aAddress.
        ^((tp~convertorOp toLiteral base:16)~literalOp padLeft char:$48 int:2).
    ]
}

readExe =
[
    var br := BinaryFileReader new path:exeFileNameTest.
    int exeSize := (br stream) length.
    var exeBytes := ByteArray new:exeSize.
    br read bytearray:exeBytes int:exeSize.
    br close.
    ^exeBytes.
].

readBlobFromEntryPoint = 
[
    var exeBytes := readExe eval.
    
    var peData := PEData new.
    peData setData bytearray:exeBytes.
    if($nil == (peData cliHeader)) 
        [ console writeLine:"Error in parsing the EXE". ^$nil. ].
        
    var entryPointTable := (peData indexManager) getTable int:((peData cliHeader) entryPointToken).
    if($nil == entryPointTable)
        [ console writeLine:"Can not find entry point". ^$nil. ].
        
    var entryPointName := entryPointTable getTag ; fullName.
    console writeLine:("Disassembling method: " + entryPointName).
        
    var usTable := UtilTest loadUsTable peData:peData.
    
    var entryPointTag := entryPointTable getTag.
    
    var idxm := peData indexManager.
    var offset := (entryPointTag localVariablesSig) signature.
    int address := (idxm blobOffset) + offset.
    console writeLine:("  *** Signature [Blob " + ((offset~convertorOp toLiteral base:16)~literalOp padLeft char:$48 int:8) + "] ***").
    console writeLine:("Blob Length: " + (UtilTest getDataSizeHexLiteral peData:peData int:address int:4)).

    var dtSize := UtilTest getDataSize peData:peData int:address.
    address := address + (dtSize A).
    int end := address + (dtSize B).
    
    console writeLine:("LOCAL_SIG: " + (UtilTest getBlobType peData:peData int:address)).
    address := address + 1.
    console writeLine:("COUNT: " + (UtilTest getDataSizeHexLiteral peData:peData int:address int:4)).
    address := address + 1.
    dtSize := UtilTest getDataSize peData:peData int:address.
    address := address + (dtSize A).
    
    var elt := ELEMENT_TYPE new.
    while(address < end)
    [
        var type := idxm readType int:address.
        
        if((type option) != (elt END))
        [
            console writeLine:("ELEMENT_TYPE_" + (elt getName int:(type option))).
        ].
        
        if((type token) == 0)
        [
            console writeLine:("ELEMENT_TYPE_" + (elt getName int:(type element))).
        ];
        [
            console writeLine:"other type....".
        ].
        
        address := address + (type size).
    ].    
].

decompileEntryPoint =
[
    var exeBytes := readExe eval.
    
    var peData := PEData new.
    peData setData bytearray:exeBytes.
    if($nil == (peData cliHeader)) 
        [ console writeLine:"Error in parsing the EXE". ^$nil. ].
        
    var entryPointTable := (peData indexManager) getTable int:((peData cliHeader) entryPointToken).
    if($nil == entryPointTable)
        [ console writeLine:"Can not find entry point". ^$nil. ].
        
    var entryPointName := entryPointTable getTag ; fullName.
    console writeLine:("Disassembling method: " + entryPointName).
        
    var usTable := UtilTest loadUsTable peData:peData.
    
    var entryPointTag := entryPointTable getTag.
    var ilCodes := entryPointTag getILCodes.

    ilCodes run each:(:il)
    [
        bool continue := false.
        var nOp := UtilTest getOperandValue ilCode:il.
        
        var opName := (il opCode) name.  
        
        var text := (UtilTest generateLabelName ilCode:il) + ": ".
        if((opName~literalOp startingWith literal:"ldc.i4") == true)
        [
            var t := nOp literal.
            if((opName == "ldc.i4") || (opName == "ldc.i4.s"))
            [
                text := text + opName + " " + t.
            ];
            [
                text := text + opName.
            ].
            continue := true.
        ].
        
        if(opName == "ldstr")
        [
            int us := (il operand) && 0ffffffh.
            var tmp := usTable@us.
            text := text + "ldstr " + $34 + tmp + $34.
            continue := true.
        ].
        
        if((opName~literalOp startingWith literal:"stloc") == true)
        [
            var t := nOp literal.
            if((opName == "stloc") || (opName == "stloc.s"))
            [
                text := text + opName + " " + t.
            ];
            [
                text := text + opName.
            ].
            continue := true.
        ].
        
        if((opName~literalOp startingWith literal:"ldloc") == true)
        [
            var t := nOp literal.
            if((opName == "ldloc") || (opName == "ldloc.s"))
            [
                text := text + opName + " " + t.
            ];
            [
                text := text + opName.
            ].
            continue := true.
        ].
        
        if((opName == "newobj") || ((opName~literalOp startingWith literal:"call") == true))
        [
            var funcName := UtilTest getFunctionName peData:peData ilCode:il.
            text := text + opName + " " + funcName. 
            continue := true.
        ].
        
        if((opName~literalOp startingWith literal:"b") == true)
        [
            var target := UtilTest getBrTarget ilCode:il.
            var brLbl := UtilTest generateLabelName int:target.
            text := text + opName + " " + brLbl.
            continue := true.
        ].
        
        if(opName == "switch")
        [
            var jmps := UtilTest getSwitchJumps peData:peData ilCode:il.
            if((jmps length) == 0)
            [
                text := text + opName.
            ];
            [
                text := text + opName + " (".
                int i := 0.
                while(i < (jmps length))
                [
                    if(i > 0) [ text := text + ", ". ].
                    text := text + UtilTest generateLabelName int:(jmps@i).
                    i := i + 1.
                ].
                text := text + ")".
            ].
            continue := true.
        ].
        
        if(continue == false)
        [
            text := text + opName.
        ].
        
        console writeLine:text.
    ].
].

getDetailsOfClasses = 
[
    var exeBytes := readExe eval.
    
    var peData := PEData new.
    peData setData bytearray:exeBytes.
    if($nil == (peData cliHeader)) 
        [ console writeLine:"Error in parsing the EXE". ^$nil. ].
        
    var entryPointTable := (peData indexManager) getTable int:((peData cliHeader) entryPointToken).
    if($nil == entryPointTable)
        [ console writeLine:"Can not find entry point". ^$nil. ].
        
    var idxm := peData indexManager.
    ((idxm tables)@mdtTypeDef) run each:(:obj)
    [
        // Get class and the base class
        var idxType := (obj indexManager) getIndexType codedIndices:cdIdcTypeDefOrRef int:(obj extends).
        var idx := (obj indexManager) getIndex codedIndices:cdIdcTypeDefOrRef int:(obj extends).
        var lstTable := ((obj indexManager) tables)@idxType.
        if((0 < idx) && (idx <= (lstTable length)))
        [
            var tbl := lstTable@(idx - 1).
            var name := "".
            if((tbl class_ref) == TypeRefTable)
            [
                name := idxm getName typeRefTable:tbl.
            ].
            if((tbl class_ref) == TypeDefTable)
            [  
                name := idxm getName typeDefTable:tbl.
            ].
            console writeLine:("Class: " + ((idxm) getName typeDefTable:obj) + " :: " + name).
        ].
        
        // List all fields if have some field...
        (((obj indexManager) tables)@mdtField) run each:(:obj1)
        [
            // parent table
            var ptrPt := obj1 getParentTable ; pointer.
            if(ptrPt == (obj pointer))
            [
                var namePt := idxm getName typeDefTable:(obj1 getParentTable).
                var fieldName := idxm getStringsString int:(obj1 name).
                console writeLine:"Field: ":namePt:"::":fieldName.
            ].
        ]. 
        
        // List all methods...
        ((obj children)@(Children DefMethod)) run each:(:obj1)
        [
            var method := obj1 getTag.
            console writeLine:("Method: " + (method fullName)).
        ].
        
        console writeLine:"".
    ].
].

program =
[
    readBlobFromEntryPoint eval.
    
    console writeLine:"".
    console writeLine:" ************************************************ ".
    console writeLine:" ************************************************ ".
    console writeLine:" ************************************************ ".
    console writeLine:"".
    
    decompileEntryPoint eval.
    
    console writeLine:"".
    console writeLine:" ************************************************ ".
    console writeLine:" ************************************************ ".
    console writeLine:" ************************************************ ".
    console writeLine:"".
    
    getDetailsOfClasses eval.
].