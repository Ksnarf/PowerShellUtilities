#Max Resize of C Drive
Resize-Partition -DriveLetter C -Size $(Get-PartitionSupportedSize -DriveLetter C).SizeMax

#Get Drive Information
Get-PartitionSupportedSize -DriveLetter C
