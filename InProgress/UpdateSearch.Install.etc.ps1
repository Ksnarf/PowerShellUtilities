# Looks for most recent update on local machine
(Get-HotFix | Sort-Object -Property InstalledOn)[-1]

#Gets all updates, sorted by Install date on local machine
(Get-HotFix | Sort-Object -Property InstalledOn)

#Gets all updates, sorted by install date on "xxx.computer"
Get-HotFix -ComputerName xxx.computer | Sort-Object -Property InstalledOn

#Start WSUS cmdlet
$wsusserver = "sfo-sccm01"
#Load required assemblies
[void][reflection.assembly]::LoadWithPartialName("Microsoft.UpdateServices.Administration")
$wsus = [Microsoft.UpdateServices.Administration.AdminProxy]::getUpdateServer($wsusserver,$False)
