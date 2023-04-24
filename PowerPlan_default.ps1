function PowerPlan_default {

    powercfg -restoredefaultschemes > $null 2>&1
    
}

PowerPlan_default