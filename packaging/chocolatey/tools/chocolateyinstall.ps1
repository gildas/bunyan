﻿$ErrorActionPreference = 'Stop' # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file64        = "$toolsDir\lv-0.1.0-windows-amd64.7z"
  softwareName  = 'lv*'
  checksum64    = ''
  checksumType64= 'sha256'
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file64 -Force

Write-Output "To load tab completion in your current PowerShell session, please run:"
Write-Output "  lv completion powershell | Out-String | Invoke-Expression"
Write-Output " "
Write-Output "To load completions for every new session, add the output of the above command to your powershell profile."
