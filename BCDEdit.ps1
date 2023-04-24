function BCDEdit {

Start-Process -FilePath bcdedit.exe -ArgumentList "/deletevalue tscsyncpolicy"
Start-Process -FilePath bcdedit.exe -ArgumentList "/timeout 3"
Start-Process -FilePath bcdedit.exe -ArgumentList "/deletevalue bootux"
Start-Process -FilePath bcdedit.exe -ArgumentList "/set bootmenupolicy standard"
Start-Process -FilePath bcdedit.exe -ArgumentList "/set hypervisorlaunchtype Auto"
Start-Process -FilePath bcdedit.exe -ArgumentList "/deletevalue tpmbootentropy"
Start-Process -FilePath bcdedit.exe -ArgumentList "/deletevalue quietboot"

# 
Start-Process -FilePath bcdedit.exe -ArgumentList "/set nx optin"

# 
Start-Process -FilePath bcdedit.exe -ArgumentList "/set allowedinmemorysettings 0x17000077"
Start-Process -FilePath bcdedit.exe -ArgumentList "/set isolatedcontext Yes"

# 
Start-Process -FilePath bcdedit.exe -ArgumentList "/deletevalue vsmlaunchtype"
Start-Process -FilePath bcdedit.exe -ArgumentList "/deletevalue vm"
Remove-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\FVE" -Name "DisableExternalDMAUnderLock" -Force
Remove-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\DeviceGuard" -Name "EnableVirtualizationBasedSecurity" -Force
Remove-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\DeviceGuard" -Name "HVCIMATRequired" -Force

# 
Start-Process -FilePath bcdedit.exe -ArgumentList "/deletevalue firstmegabytepolicy"
Start-Process -FilePath bcdedit.exe -ArgumentList "/deletevalue avoidlowmemory"
Start-Process -FilePath bcdedit.exe -ArgumentList "/deletevalue nolowmem"
Start-Process -FilePath bcdedit.exe -ArgumentList "/deletevalue configaccesspolicy"
Start-Process -FilePath bcdedit.exe -ArgumentList "/deletevalue x2apicpolicy"
Start-Process -FilePath bcdedit.exe -ArgumentList "/deletevalue usephysicaldestination"
Start-Process -FilePath bcdedit.exe -ArgumentList "/deletevalue usefirmwarepcisettings"

}