param (
    [string]$dirPath = $(Get-Location)
)

# 获取目录中的所有 PDF 文件
$pdfFiles = Get-ChildItem -Path $directoryPath -Filter "*.pdf"

# 初始化总和变量
$totalSum = 0

# 初始化清单数组
$fileList = @()

# 遍历每个文件
foreach ($file in $pdfFiles) {
    # 获取文件名
    $fileName = $file.Name
    
    # 使用正则表达式提取下划线后的数字部分
    if ($fileName -match "_([0-9\.]+)\.pdf") {
        $number = [double]$matches[1]
        
        # 将数字加入总和
        $totalSum += $number
        
        # 将文件名和数字部分加入清单
        $fileList += [pscustomobject]@{
            FileName = $fileName
            Number = $number
        }
    }
}

# 输出清单
$fileList | Format-Table -AutoSize

# 输出总和
Write-Output "所有数字部分的总和: $totalSum"
