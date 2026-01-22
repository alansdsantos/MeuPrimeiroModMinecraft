@echo off
echo ========================================
echo   Compilando Mod Minecraft
echo ========================================
echo.

REM Tentar encontrar Java em locais comuns
set JAVA_FOUND=0

REM Verificar se Java esta no PATH
java -version >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Java encontrado no PATH
    set JAVA_FOUND=1
    goto :compile
)

REM Procurar em locais comuns
for /d %%i in ("C:\Program Files\Java\*") do (
    if exist "%%i\bin\java.exe" (
        set "JAVA_HOME=%%i"
        set "PATH=%%i\bin;%PATH%"
        echo [OK] Java encontrado: %%i
        set JAVA_FOUND=1
        goto :compile
    )
)

for /d %%i in ("C:\Program Files\Eclipse Adoptium\*") do (
    if exist "%%i\bin\java.exe" (
        set "JAVA_HOME=%%i"
        set "PATH=%%i\bin;%PATH%"
        echo [OK] Java encontrado: %%i
        set JAVA_FOUND=1
        goto :compile
    )
)

if %JAVA_FOUND% equ 0 (
    echo [ERRO] Java nao encontrado!
    echo.
    echo Por favor:
    echo 1. Reinicie o Cursor completamente
    echo 2. Ou informe o caminho do Java manualmente
    echo.
    echo Exemplo: set JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-17.0.10+7
    echo.
    pause
    exit /b 1
)

:compile
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
    echo Copie este arquivo para: %%appdata%%\.minecraft\mods\
    echo.
) else (
    echo.
    echo [ERRO] Falha na compilacao!
    echo.
    echo Se o erro for sobre Java, tente:
    echo 1. Reiniciar o Cursor
    echo 2. Verificar se o Java 17 esta instalado
    echo.
)

pause
