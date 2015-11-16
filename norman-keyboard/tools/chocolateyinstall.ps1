$ErrorActionPreference = 'Stop';

$packageName = 'norman-keyboard'
$installerType = 'msi'
$url = 'https://normanlayout.info/files/Norman.zip'
$silentArgs = '/q'
$validExitCodes = @(0)
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "$packageName" "$url" "$toolsDir"

if ($(Get-ProcessorBits 32)) {
  $target = Join-Path $toolsDir "Norman/Norman_i386.msi"
} else {
  $target = Join-Path $toolsDir "Norman/Norman_amd64.msi"
}
Install-ChocolateyInstallPackage "$packageName" "$installerType" "$silentArgs" "$target" -validExitCodes $validExitCodes
