function Affinity {
    
Get-WmiObject Win32_USBController | Where-Object {$_.PNPDeviceID -like "PCI\VEN_*"} | ForEach-Object {
    Remove-ItemProperty -Path "HKLM:\System\CurrentControlSet\Enum\$($_.PNPDeviceID)\Device Parameters\Interrupt Management\Affinity Policy" -Name "DevicePolicy" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path "HKLM:\System\CurrentControlSet\Enum\$($_.PNPDeviceID)\Device Parameters\Interrupt Management\Affinity Policy" -Name "AssignmentSetOverride" -ErrorAction SilentlyContinue
}

Get-WmiObject Win32_VideoController | Where-Object {$_.PNPDeviceID -like "PCI\VEN_*"} | ForEach-Object {
    Remove-ItemProperty -Path "HKLM:\System\CurrentControlSet\Enum\$($_.PNPDeviceID)\Device Parameters\Interrupt Management\Affinity Policy" -Name "DevicePolicy" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path "HKLM:\System\CurrentControlSet\Enum\$($_.PNPDeviceID)\Device Parameters\Interrupt Management\Affinity Policy" -Name "AssignmentSetOverride" -ErrorAction SilentlyContinue
}

Get-WmiObject Win32_NetworkAdapter | Where-Object {$_.PNPDeviceID -like "PCI\VEN_*"} | ForEach-Object {
    Remove-ItemProperty -Path "HKLM:\System\CurrentControlSet\Enum\$($_.PNPDeviceID)\Device Parameters\Interrupt Management\Affinity Policy" -Name "DevicePolicy" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path "HKLM:\System\CurrentControlSet\Enum\$($_.PNPDeviceID)\Device Parameters\Interrupt Management\Affinity Policy" -Name "AssignmentSetOverride" -ErrorAction SilentlyContinue
}
    }