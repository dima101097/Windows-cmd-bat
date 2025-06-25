[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new()
$linkTemplate = (Read-Host "Посилання з #").Trim()
if ($linkTemplate -notmatch "#") {
    Write-Host "Символ # відсутній в посиланні" -ForegroundColor red
    Exit
}

$start = [int](Read-Host "Введіть початкове число")
$end = [int](Read-Host "Введіть кінцеве число")
$savePath = Split-Path -Parent $MyInvocation.MyCommand.Path 
for ($i = $start; $i -le $end; $i++ ) {
    $url = $linkTemplate -replace "#", $i
    Write-Host "Обробка: $url"
    try {
        $response =Invoke-WebRequest -Uri $url -Method Head -MaximumRedirection 5 -ErrorAction Stop
        $fileName = $response.Headers.'Content-Disposition' -replace '.*filename="?([^";]+).*', '$1'
        if (-not$fileName -or $fileName -eq $response.Headers.'Content-Disponsition') {
            $fileName = [System.IO.Path]::GetFileName($response.BaseResponse.ResponseUri.AbsolutePath)
        }
        if ( -not $fileName) {
            $fileName = "$i.unknown"
        }
        $fullPath = Join-Path $savePath $fileName
        Write-Host "Завантаження: $fileName"
        curl.exe -L $url -o $fullPath
    }
    catch {
        Write-Host "Помилка: $_" -ForegroundColor red
    }
}