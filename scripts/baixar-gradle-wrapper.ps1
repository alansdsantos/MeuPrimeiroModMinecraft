# Script para baixar o gradle-wrapper.jar

$gradleVersion = "8.4"
$wrapperJarUrl = "https://raw.githubusercontent.com/gradle/gradle/v$gradleVersion/gradle/wrapper/gradle-wrapper.jar"
$wrapperPath = "gradle\wrapper\gradle-wrapper.jar"

Write-Host "Baixando gradle-wrapper.jar..." -ForegroundColor Yellow

try {
    # Criar diretório se não existir
    $wrapperDir = Split-Path -Parent $wrapperPath
    if (-not (Test-Path $wrapperDir)) {
        New-Item -ItemType Directory -Path $wrapperDir -Force | Out-Null
    }

    # Baixar o arquivo
    Invoke-WebRequest -Uri $wrapperJarUrl -OutFile $wrapperPath -UseBasicParsing
    
    Write-Host "✓ gradle-wrapper.jar baixado com sucesso!" -ForegroundColor Green
    Write-Host "Agora você pode executar: .\gradlew.bat build" -ForegroundColor Cyan
} catch {
    Write-Host "✗ Erro ao baixar: $_" -ForegroundColor Red
    Write-Host "`nTente baixar manualmente:" -ForegroundColor Yellow
    Write-Host "1. Acesse: https://github.com/gradle/gradle/tree/v$gradleVersion/gradle/wrapper" -ForegroundColor White
    Write-Host "2. Baixe o arquivo gradle-wrapper.jar" -ForegroundColor White
    Write-Host "3. Coloque em: gradle\wrapper\" -ForegroundColor White
}
