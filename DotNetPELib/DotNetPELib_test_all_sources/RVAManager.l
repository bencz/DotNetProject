import system.
import system'collections.
import extensions.

class RVAManager
{
    object addrs_p.
    object addrs_v.
    
    constructor new 
    [
        addrs_p := List new.
        addrs_v := List new.
    ]
    
    setAddress int:physical int:virt
    [
        ((physical == 0) || (virt == 0))! 
        [
            addrs_p append:physical.
            addrs_v append:virt.
        ].
    ]
    
    convertToPhysical int:virt
    [
        int p := -1.
        int max := 0.
        
        int cnt := 0.
        while(cnt < addrs_v length)
        [
            int v := (addrs_v@cnt) toInt.
            ((max < v) && (v <= virt))?
            [
                p := cnt.
                max := v. 
            ].
            cnt := cnt + 1.
        ].
        (p >= 0) 
            ?[ ^(virt - max + ((addrs_p@p) toInt)). ] 
            ![ ^virt. ].
    ]
    
    convertToVirtual int:physical
    [
        int p := -1.
        int max := 0.
        
        int cnt := 0.
        while(cnt < addrs_p length)
        [
            int v := (addrs_p@cnt) toInt.
            ((max < v) && (v <= physical))?
            [
                p := cnt.
                max := v.
            ].
            cnt := cnt + 1.
        ].
        
        (p >= 0) 
            ?[ ^(physical - max + ((addrs_v@p) toInt)). ] 
            ![ ^physical. ].
    ]
}

extension RVAManagerHelper
{
    getAddress long:rva
    [
        ^((rva && 0FFFFFFFFh) toInt).
    ]
}