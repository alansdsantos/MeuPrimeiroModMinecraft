# 🛠️ Scripts de Compilação

Esta pasta contém todos os scripts de compilação e ferramentas auxiliares.

## 📝 Scripts Principais

### build.bat
Script principal de compilação. Encontra o Java automaticamente e compila o mod.
- **Uso:** Execute `build.bat` na raiz do projeto (ou `scripts\build.bat`)

### compilar.bat
Script básico de compilação (versão simplificada).

### compilar-agora.bat
Script que tenta encontrar o Java e compilar imediatamente.

### compilar-manual.bat
Script que pede o caminho do Java manualmente.

## 🔧 Scripts Auxiliares

### compilar-com-java.ps1
Script PowerShell que procura e configura o Java automaticamente.

### verificar-java.ps1
Script para verificar se o Java está instalado e configurado.

### baixar-gradle-wrapper.ps1
Script para baixar o gradle-wrapper.jar se necessário.

## 💡 Como Usar

**Recomendado:** Use `build.bat` da raiz do projeto:
```batch
.\build.bat
```

Ou execute diretamente:
```batch
.\scripts\build.bat
```
