$specialFolder = $env:APPDATA
$content = Get-Content -Path "$specialFolder\Guild Wars 2\GFXSettings.Gw2-64.exe.xml" | Where-Object { $_ -like '*INSTALLPATH*' }
$bin64Folder = $content.Trim().Substring(20).TrimEnd("`"/>") + "bin64\"

$urlArc = "https://www.deltaconnected.com/arcdps/x64/d3d9.dll"
$urlBuild = "https://www.deltaconnected.com/arcdps/x64/buildtemplates/d3d9_arcdps_buildtemplates.dll"
$urlExtras = "https://www.deltaconnected.com/arcdps/x64/extras/d3d9_arcdps_extras.dll"

$outputArc = $bin64Folder + "d3d9.dll"
$outputBuild = $bin64Folder + "d3d9_arcdps_buildtemplates.dll"
$outputExtras = $bin64Folder + "d3d9_arcdps_extras.dll"

Write-Output("Downloading...")

(New-Object System.Net.WebClient).DownloadFile($urlArc, $outputArc)
(New-Object System.Net.WebClient).DownloadFile($urlBuild, $outputBuild)
(New-Object System.Net.WebClient).DownloadFile($urlExtras, $outputExtras)
