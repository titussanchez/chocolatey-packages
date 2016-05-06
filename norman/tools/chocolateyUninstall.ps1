$ErrorActionPreference = 'Stop';

$packageName = 'norman'
$installerType = 'msi'
$silentArgs = '/q'
$validExitCodes = @(0)

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
if ($(Get-ProcessorBits 32)) {
  $file = Join-Path $toolsDir "Norman/Norman_i386.msi"
} else {
  $file = Join-Path $toolsDir "Norman/Norman_amd64.msi"
}

$silentArgs = "$file $silentArgs"

Uninstall-ChocolateyPackage -PackageName $packageName -FileType $installerType -SilentArgs $silentArgs -validExitCodes $validExitCodes
