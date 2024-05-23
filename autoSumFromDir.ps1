param (
    [string]$dirPath = $(Get-Location)
)

# ��ȡĿ¼�е����� PDF �ļ�
$pdfFiles = Get-ChildItem -Path $directoryPath -Filter "*.pdf"

# ��ʼ���ܺͱ���
$totalSum = 0

# ��ʼ���嵥����
$fileList = @()

# ����ÿ���ļ�
foreach ($file in $pdfFiles) {
    # ��ȡ�ļ���
    $fileName = $file.Name
    
    # ʹ��������ʽ��ȡ�»��ߺ�����ֲ���
    if ($fileName -match "_([0-9\.]+)\.pdf") {
        $number = [double]$matches[1]
        
        # �����ּ����ܺ�
        $totalSum += $number
        
        # ���ļ��������ֲ��ּ����嵥
        $fileList += [pscustomobject]@{
            FileName = $fileName
            Number = $number
        }
    }
}

# ����嵥
$fileList | Format-Table -AutoSize

# ����ܺ�
Write-Output "�������ֲ��ֵ��ܺ�: $totalSum"
