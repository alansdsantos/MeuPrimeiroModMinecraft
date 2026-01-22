@echo off
setlocal enabledelayedexpansion

echo ========================================
echo   Compilando Mod Minecraft v1.0.0
echo ========================================
echo.

REM Procurar Java em locais comuns
set JAVA_FOUND=0
set JAVA_PATH=

REM Verificar se Java esta no PATH
java -version >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Java encontrado no PATH
    set JAVA_FOUND=1
    goto :compile
)

REM Procurar em Program Files
for /d %%i in ("C:\Program Files\Java\*") do (
    if exist "%%i\bin\java.exe" (
        set "JAVA_PATH=%%i"
        set "JAVA_HOME=%%i"
        set "PATH=%%i\bin;%PATH%"
        echo [OK] Java encontrado: %%i
        set JAVA_FOUND=1
        goto :compile
    )
)

REM Procurar Eclipse Adoptium
for /d %%i in ("C:\Program Files\Eclipse Adoptium\*") do (
    if exist "%%i\bin\java.exe" (
        set "JAVA_PATH=%%i"
        set "JAVA_HOME=%%i"
        set "PATH=%%i\bin;%PATH%"
        echo [OK] Java encontrado: %%i
        set JAVA_FOUND=1
        goto :compile
    )
)

REM Procurar em AppData Local
for /d %%i in ("%LOCALAPPDATA%\Programs\Eclipse Adoptium\*") do (
    if exist "%%i\bin\java.exe" (
        set "JAVA_PATH=%%i"
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
    echo Por favor, reinicie o Cursor ou configure o JAVA_HOME manualmente.
    echo.
    echo Exemplo:
    echo   set JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-17.0.10+7
    echo   set PATH=%%JAVA_HOME%%\bin;%%PATH%%
    echo.
    pause
    exit /b 1
)

:compile
echo.
echo Verificando versao do Java...
java -version
echo.
echo ========================================
echo   Iniciando compilacao...
echo ========================================
echo Isso pode demorar alguns minutos na primeira vez...
echo.

call gradlew.bat clean build --no-daemon

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo   Compilacao concluida com sucesso!
    echo ========================================
    echo.
    echo O arquivo JAR esta em:
    if exist "build\libs\meuprimeiromod-1.0.0.jar" (
        echo   build\libs\meuprimeiromod-1.0.0.jar
        echo.
        echo Tamanho: 
        for %%A in ("build\libs\meuprimeiromod-1.0.0.jar") do echo   %%~zA bytes
    )
    if exist "build\libs\meuprimeiromod-1.0.0-slim.jar" (
        echo   build\libs\meuprimeiromod-1.0.0-slim.jar
        echo.
        echo Tamanho:
        for %%A in ("build\libs\meuprimeiromod-1.0.0-slim.jar") do echo   %%~zA bytes
    )
    echo.
    echo Copie o arquivo JAR para: %%appdata%%\.minecraft\mods\
    echo.
) else (
    echo.
    echo [ERRO] Falha na compilacao!
    echo Verifique os erros acima.
    echo.
)

pause
