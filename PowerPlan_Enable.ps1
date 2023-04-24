function PowerPlan {
    
    Invoke-WebRequest -Uri "https://github.com/auraside/HoneCtrl/raw/main/Files/HoneV2.pow" -OutFile "$env:SystemDrive\Hone\Resources\HoneV2.pow"

    
    $powerPlanGuid = "44444444-4444-4444-4444-444444444449"

    
    powercfg /d $powerPlanGuid

    
    powercfg -import "$env:SystemDrive\Hone\Resources\HoneV2.pow" $powerPlanGuid

    
    powercfg /changename $powerPlanGuid "Hone Ultimate Power Plan V2" "The Ultimate Power Plan to increase FPS, improve latency and reduce input lag."

    
    $cores = (Get-WmiObject -Class Win32_Processor).NumberOfCores
    if ($cores -eq $env:NUMBER_OF_PROCESSORS) {
        powercfg -setacvalueindex $powerPlanGuid sub_processor IDLEDISABLE 1
    }
    else {
        powercfg -setacvalueindex $powerPlanGuid sub_processor IDLEDISABLE 0
    }

    
    powercfg -setactive $powerPlanGuid
}


PowerPlan > $null 2>&1
