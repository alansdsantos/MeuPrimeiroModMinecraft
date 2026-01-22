@echo off
echo ========================================
echo   Compilacao Manual do Mod
echo ========================================
echo.
echo Por favor, informe o caminho completo do Java 17
echo Exemplo: C:\Program Files\Eclipse Adoptium\jdk-17.0.10+7
echo.
set /p JAVA_PATH="Digite o caminho do Java (ou pressione Enter para cancelar): "

if "%JAVA_PATH%"=="" (
    echo Cancelado.
    pause
    exit /b 1
)

if not exist "%JAVA_PATH%\bin\java.exe" (
    echo [ERRO] java.exe nao encontrado neste caminho!
    echo Verifique se o caminho esta correto.
    pause
    exit /b 1
)

echo.
echo [OK] Java encontrado: %JAVA_PATH%
echo.

set "JAVA_HOME=%JAVA_PATH%"
set "PATH=%JAVA_PATH%\bin;%PATH%"

echo Verificando versao do Java...
"%JAVA_PATH%\bin\java.exe" -version
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
    echo Verifique os erros acima.
    echo.
)

pause
