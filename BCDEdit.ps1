function BCDEdit {

bcdedit /set tscsyncpolicy enhanced
bcdedit /timeout 0
bcdedit /set bootux disabled
bcdedit /set bootmenupolicy standard
bcdedit /set quietboot yes
if ((Get-WmiObject Win32_Processor).Name -like 'Intel') {
  bcdedit /set nx optout
} else {
  bcdedit /set nx alwaysoff
}
bcdedit /set allowedinmemorysettings 0x0
bcdedit /set vsmlaunchtype Off
bcdedit /set vm No
Set-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\FVE' -Name 'DisableExternalDMAUnderLock' -Type DWord -Value 0 -Force
Set-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows\DeviceGuard' -Name 'EnableVirtualizationBasedSecurity' -Type DWord -Value 0 -Force
Set-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows\DeviceGuard' -Name 'HVCIMATRequired' -Type DWord -Value 0 -Force
bcdedit /set x2apicpolicy Enable
bcdedit /set uselegacyapicmode No
bcdedit /set configaccesspolicy Default
bcdedit /set usephysicaldestination No
bcdedit /set usefirmwarepcisettings No  
}

BCDEdit