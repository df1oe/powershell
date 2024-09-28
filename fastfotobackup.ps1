##   param([string] $directory)
$dirs = Get-ChildItem -path "D:\Transport" -Attributes Directory | Select-Object Name
#$date =  Get-Date -Format ddMMyyyy
$dest = "\\apollon\public1\fotos\roland\Transport"
#$args = "/MIR /FFT /Z /XA:H /MT:8 /W:5 /R:5"
foreach ($dir in $dirs)
{
$source = "D:\Transport\" + $dir.Name
$destdir = $dest +"\"+ $dir.Name 
Start-Process robocopy -args "$source $destdir /MIR /FFT /Z /XA:H /MT:8 /W:5 /R:5"
}