param (
    [string]$dirPath = $(Get-Location)
)

$pdfFiles = Get-ChildItem -Path $dirPath -Filter "*.pdf"

$totalAmount = 0
$totalProblematicAmount = 0

$totalSum = 0

$fileList = @()

foreach ($file in $pdfFiles) {
    $fileName = $file.Name


    if ($fileName -match "_([0-9\.]+)\.pdf") {
        $number = [double]$matches[1]

        $totalAmount += 1
        
        $totalSum += $number
        
        $fileList += [pscustomobject]@{
            FileName = $fileName
            Number = $number
        }
    }
    else {
        $totalProblematicAmount += 1
    }
}

$fileList | Format-Table -AutoSize

Write-Output "�ļ�������$totalAmount"
if ($totalProblematicAmount -gt 0) {
    Write-Output "�����ļ�������$totalProblematicAmount"
}
Write-Output "�������ֲ��ֵ��ܺ�: $totalSum"
