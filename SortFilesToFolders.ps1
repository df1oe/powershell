[string] $SourceDirectoryPath = 'Z:\fotos\Urlaub-2024\Leica\Roland'
[string] $TargetDirectoryPath = 'D:\Transport\2024'

[System.Collections.ArrayList] $filesToMove = Get-ChildItem -Path $SourceDirectoryPath -File -Recurse

$filesToMove | ForEach-Object {
    [System.IO.FileInfo] $file = $_

    [DateTime] $fileDate = $file.LastWriteTimeUtc
    Write-Output $fileDate
    [string] $dateDirectoryName = $fileDate.ToString('yyyy-MM-dd')
    [string] $dateDirectoryPath = Join-Path -Path $TargetDirectoryPath -ChildPath $dateDirectoryName
    Write-Output $dateDirectoryPath   
     if (!(Test-Path -Path $dateDirectoryPath -PathType Container))
    {
        Write-Verbose "Creating directory '$dateDirectoryPath'."
        New-Item -Path $dateDirectoryPath -ItemType Directory -Force > $null
    }

    [string] $filePath = $file.FullName
   Write-Output $file.FullName
   Write-Information "Moving file '$filePath' into directory '$dateDirectoryPath'."
   Copy-Item -Path $filePath -Destination $dateDirectoryPath
}