Import-Module ActiveDirectory
Function OSVersion {
$Server = "remotehost" 
$OS = Get-WMIObject -class Win32_OperatingSystem -ComputerName $Server

 Write-Host "OS Version =" $sProperty.Caption
 Write-Host "OS Architecture ="$sProperty.OSArchitecture
 Write-Host "Service Pack Version ="$sProperty.ServicePackMajorVersion
}
 
