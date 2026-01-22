@echo off
echo ========================================
echo   Compilando Mod Minecraft
echo ========================================
echo.

REM Verificar se Java está instalado
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERRO] Java nao encontrado!
    echo.
    echo Por favor, instale o Java 17:
    echo 1. Acesse: https://adoptium.net/temurin/releases/
    echo 2. Baixe o JDK 17 para Windows x64
    echo 3. Instale e reinicie o terminal
    echo.
    pause
    exit /b 1
)

echo [OK] Java encontrado!
echo.
echo Iniciando compilacao...
echo Isso pode demorar alguns minutos na primeira vez...
echo.

call gradlew.bat build

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo   Compilacao concluida com sucesso!
    echo ========================================
    echo.
    echo O arquivo JAR esta em:
    echo   build\libs\meuprimeiromod-1.0.0.jar
    echo.
    echo Copie este arquivo para a pasta mods do Minecraft:
    echo   %%appdata%%\.minecraft\mods\
    echo.
) else (
    echo.
    echo [ERRO] Falha na compilacao!
    echo Verifique os erros acima.
    echo.
)

pause
