# Script para encontrar e compilar com Java

Write-Host "=== Procurando Java ===" -ForegroundColor Cyan

# Locais comuns onde o Java pode estar
$javaLocations = @(
    "C:\Program Files\Java",
    "C:\Program Files (x86)\Java",
    "C:\Program Files\Eclipse Adoptium",
    "C:\Program Files (x86)\Eclipse Adoptium",
    "$env:LOCALAPPDATA\Programs\Eclipse Adoptium",
    "$env:ProgramFiles\Eclipse Adoptium",
    "$env:ProgramFiles\Microsoft\jdk-*",
    "C:\jdk*",
    "C:\Java"
)

$javaFound = $false
$javaPath = $null

foreach ($location in $javaLocations) {
    if (Test-Path $location) {
        Write-Host "Verificando: $location" -ForegroundColor Yellow
        $jdkFolders = Get-ChildItem $location -Directory -ErrorAction SilentlyContinue | Where-Object { 
            $_.Name -like "*jdk*17*" -or 
            $_.Name -like "*17*" -or 
            $_.Name -like "*jdk*" 
        }
        
        foreach ($jdk in $jdkFolders) {
            $javaExe = Join-Path $jdk.FullName "bin\java.exe"
            if (Test-Path $javaExe) {
                $version = & $javaExe -version 2>&1 | Select-Object -First 1
                if ($version -match "17|18|19|20|21") {
                    Write-Host "✓ Java encontrado: $($jdk.FullName)" -ForegroundColor Green
                    Write-Host "  Versão: $version" -ForegroundColor Gray
                    $javaPath = $jdk.FullName
                    $javaFound = $true
                    break
                }
            }
        }
        if ($javaFound) { break }
    }
}

if (-not $javaFound) {
    Write-Host "`n✗ Java não encontrado automaticamente!" -ForegroundColor Red
    Write-Host "`nPor favor, informe o caminho onde o Java foi instalado." -ForegroundColor Yellow
    Write-Host "Exemplo: C:\Program Files\Eclipse Adoptium\jdk-17.0.10+7" -ForegroundColor White
    $manualPath = Read-Host "Digite o caminho (ou pressione Enter para cancelar)"
    
    if ($manualPath -and (Test-Path $manualPath)) {
        $javaExe = Join-Path $manualPath "bin\java.exe"
        if (Test-Path $javaExe) {
            $javaPath = $manualPath
            $javaFound = $true
        } else {
            Write-Host "✗ java.exe não encontrado neste caminho!" -ForegroundColor Red
            exit 1
        }
    } else {
        Write-Host "`nPor favor, reinicie o Cursor após instalar o Java." -ForegroundColor Yellow
        Write-Host "Ou configure manualmente a variável JAVA_HOME." -ForegroundColor Yellow
        exit 1
    }
}

# Configurar JAVA_HOME temporariamente
$env:JAVA_HOME = $javaPath
$env:PATH = "$javaPath\bin;$env:PATH"

Write-Host "`n=== Compilando Mod ===" -ForegroundColor Cyan
Write-Host "Isso pode demorar alguns minutos na primeira vez..." -ForegroundColor Yellow
Write-Host ""

# Navegar para o diretório do projeto
$projectPath = "J:\ideias\008_Minecraft\001_MeuPrimeiroModMinecraft\MeuPrimeiroModMinecraft"
Set-Location $projectPath

# Compilar
& .\gradlew.bat build

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n=== Compilação Concluída! ===" -ForegroundColor Green
    Write-Host "`nO arquivo JAR está em:" -ForegroundColor Yellow
    Write-Host "  build\libs\meuprimeiromod-1.0.0.jar" -ForegroundColor White
    Write-Host "`nCopie este arquivo para: %appdata%\.minecraft\mods\" -ForegroundColor Cyan
} else {
    Write-Host "`n✗ Erro na compilação!" -ForegroundColor Red
    Write-Host "Verifique os erros acima." -ForegroundColor Yellow
}
