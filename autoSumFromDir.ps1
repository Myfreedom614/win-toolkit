param (
    [string]$dirPath = $(Get-Location)
)

$pdfFiles = Get-ChildItem -Path $dirPath -Filter "*.pdf"

$totalSum = 0

$fileList = @()

foreach ($file in $pdfFiles) {
    $fileName = $file.Name
    
    if ($fileName -match "_([0-9\.]+)\.pdf") {
        $number = [double]$matches[1]
        
        $totalSum += $number
        
        $fileList += [pscustomobject]@{
            FileName = $fileName
            Number = $number
        }
    }
}

$fileList | Format-Table -AutoSize

Write-Output "所有数字部分的总和: $totalSum"
