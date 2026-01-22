# Script para verificar e configurar Java para o mod Minecraft

Write-Host "=== Verificador de Java para Mod Minecraft ===" -ForegroundColor Cyan
Write-Host ""

# Verificar se Java está no PATH
Write-Host "Verificando Java no PATH..." -ForegroundColor Yellow
try {
    $javaVersion = java -version 2>&1 | Select-Object -First 1
    Write-Host "✓ Java encontrado!" -ForegroundColor Green
    Write-Host $javaVersion
} catch {
    Write-Host "✗ Java não encontrado no PATH" -ForegroundColor Red
}

# Procurar Java em locais comuns
Write-Host "`nProcurando Java em locais comuns..." -ForegroundColor Yellow

$javaLocations = @(
    "C:\Program Files\Java",
    "C:\Program Files (x86)\Java",
    "$env:LOCALAPPDATA\Programs\Eclipse Adoptium",
    "$env:ProgramFiles\Eclipse Adoptium",
    "$env:ProgramFiles\Microsoft\jdk-*"
)

$foundJava = $false
foreach ($location in $javaLocations) {
    if (Test-Path $location) {
        Write-Host "✓ Encontrado: $location" -ForegroundColor Green
        $jdkFolders = Get-ChildItem $location -Directory -ErrorAction SilentlyContinue | Where-Object { $_.Name -like "*jdk*17*" -or $_.Name -like "*17*" }
        if ($jdkFolders) {
            foreach ($jdk in $jdkFolders) {
                $javaExe = Join-Path $jdk.FullName "bin\java.exe"
                if (Test-Path $javaExe) {
                    Write-Host "  → JDK encontrado: $($jdk.FullName)" -ForegroundColor Cyan
                    $foundJava = $true
                    
                    # Verificar versão
                    $version = & $javaExe -version 2>&1 | Select-Object -First 1
                    Write-Host "  → Versão: $version" -ForegroundColor Gray
                }
            }
        }
    }
}

if (-not $foundJava) {
    Write-Host "`n✗ Java 17 não encontrado!" -ForegroundColor Red
    Write-Host "`nPor favor, instale o Java 17:" -ForegroundColor Yellow
    Write-Host "1. Acesse: https://adoptium.net/temurin/releases/" -ForegroundColor White
    Write-Host "2. Baixe o JDK 17 para Windows x64" -ForegroundColor White
    Write-Host "3. Instale e marque 'Add to PATH' durante a instalação" -ForegroundColor White
    Write-Host "4. Reinicie o terminal e execute este script novamente" -ForegroundColor White
} else {
    Write-Host "`n✓ Java encontrado! Você pode compilar o mod." -ForegroundColor Green
    Write-Host "`nPara compilar, execute:" -ForegroundColor Yellow
    Write-Host "  .\gradlew.bat build" -ForegroundColor White
}

Write-Host "`n=== Fim da Verificação ===" -ForegroundColor Cyan
