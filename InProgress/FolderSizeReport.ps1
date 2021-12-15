$loc = Read-Host "C:"
$folderItem = Get-ChildItem -Path $loc -Recurse -Directory
$a = @()

Foreach ($folder in $folderItem)
{
$foldername = $folder.FullName
$files = Get-ChildItem $foldername -Attributes !Directory
$size = $Null
$files | ForEach-Object -Process {$size +=_.Length}
}

sizeMB = [math]::Round(($size / 1mb), 1)

$array += [pscustomobject]@{
  Folder = $foldername
  Count = $files.Count
  `Size(MB)` = $sizeMB
}
}

$array|Export-Csv -Path C:\temp\FolderSize.Csv
