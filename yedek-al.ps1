$destinationFolder = "kendi-bilgisayarınızda-kayıt-edilecek-yerin-adresi"
$date = Get-Date -Format "dd-MM-yyyy" # Yedek alınırken o günün tarihi ile bir dizin oluşturuyor.
$destinationPath = Join-Path -Path $destinationFolder -ChildPath $date

if (-Not (Test-Path $destinationPath -PathType Container)) {
    New-Item -ItemType Directory -Path $destinationPath | Out-Null
}

$scpCommand1 = "scp -r kullanici-adi@sucu-ip-adressi:/dosya-adresi $destinationPath"

# Birden fazla dosya taşımak isterseniz bu satırı çoğaltabilirsiniz.
# $scpCommand2 = "scp -r root@45.144.154.81:/root/yedek-dosya-adresi $destinationPath"

Invoke-Expression $scpCommand1

# Birden fazla dosya taşımak isterseniz bu satırı çoğaltabilirsiniz aynı değişken adıyla eklemeniz gerekiyor.
# Invoke-Expression $scpCommand2

if ($LASTEXITCODE -eq 0) {
    Write-Host "Successful"
} else {
    Write-Host "Failed"
}
