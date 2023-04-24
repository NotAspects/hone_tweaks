function BCDEdit {

  Start-Process -FilePath bcdedit.exe -ArgumentList "/set tscsyncpolicy enhanced"
  Start-Process -FilePath bcdedit.exe -ArgumentList "/timeout 0"
  Start-Process -FilePath bcdedit.exe -ArgumentList "/set bootux disabled"
  Start-Process -FilePath bcdedit.exe -ArgumentList "/set bootmenupolicy standard"
  Start-Process -FilePath bcdedit.exe -ArgumentList "/set quietboot yes"
if ((Get-WmiObject Win32_Processor).Name -like '*Intel*') {

  Start-Process -FilePath bcdedit.exe -ArgumentList "/set nx optout"

} else {

  Start-Process -FilePath bcdedit.exe -ArgumentList "/set nx alwaysoff"

}
Start-Process -FilePath bcdedit.exe -ArgumentList "/set allowedinmemorysettings 0x0"
Start-Process -FilePath bcdedit.exe -ArgumentList "/set vsmlaunchtype Off"
Start-Process -FilePath bcdedit.exe -ArgumentList "/set vm No"
Start-Process -FilePath bcdedit.exe -ArgumentList "/set x2apicpolicy Enable"
Start-Process -FilePath bcdedit.exe -ArgumentList "/set uselegacyapicmode No"
Start-Process -FilePath bcdedit.exe -ArgumentList "/set configaccesspolicy Default"
Start-Process -FilePath bcdedit.exe -ArgumentList "/set usephysicaldestination No"
Start-Process -FilePath bcdedit.exe -ArgumentList "/set usefirmwarepcisettings No "
}

BCDEdit