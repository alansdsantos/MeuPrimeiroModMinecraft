# Guia de Instalação e Compilação do Mod

## 📋 Passo 1: Instalar Java 17

O mod precisa do **Java 17** para compilar. Siga estes passos:

### Opção A: Instalar via Adoptium (Recomendado)

1. Acesse: https://adoptium.net/temurin/releases/
2. Selecione:
   - **Version**: 17 (LTS)
   - **Operating System**: Windows
   - **Architecture**: x64
   - **Package Type**: JDK
3. Baixe e instale o JDK
4. Durante a instalação, **marque a opção "Add to PATH"** se disponível

### Opção B: Instalar via Chocolatey (se você tem Chocolatey)

```powershell
choco install openjdk17
```

### Verificar Instalação

Após instalar, abra um **novo terminal** e execute:

```powershell
java -version
```

Você deve ver algo como:
```
openjdk version "17.0.x" ...
```

## 📋 Passo 2: Configurar JAVA_HOME (se necessário)

Se o Java estiver instalado mas não funcionar, configure a variável JAVA_HOME:

1. Encontre onde o Java foi instalado (geralmente em `C:\Program Files\Java\jdk-17` ou similar)
2. Abra as **Variáveis de Ambiente** do Windows:
   - Pressione `Win + R`
   - Digite `sysdm.cpl` e pressione Enter
   - Vá em "Avançado" → "Variáveis de Ambiente"
3. Crie uma nova variável de sistema:
   - **Nome**: `JAVA_HOME`
   - **Valor**: Caminho da instalação do JDK (ex: `C:\Program Files\Java\jdk-17`)
4. Adicione ao PATH:
   - Edite a variável `Path`
   - Adicione: `%JAVA_HOME%\bin`
5. **Reinicie o terminal** (ou o Cursor) para aplicar as mudanças

## 📋 Passo 3: Compilar o Mod

Após instalar o Java, execute no terminal do Cursor:

```powershell
.\gradlew.bat build
```

Isso vai:
- Baixar todas as dependências do Forge
- Compilar o código Java
- Gerar o arquivo JAR do mod

## 📋 Passo 4: Encontrar o JAR Gerado

Após a compilação bem-sucedida, o arquivo JAR estará em:

```
build\libs\meuprimeiromod-1.0.0.jar
```

## 📋 Passo 5: Instalar no Minecraft

1. Abra o Minecraft Launcher
2. Vá em **Instalações** → Selecione ou crie um perfil para **Minecraft 1.20.1**
3. Clique em **"Mais opções"** → **"Abrir pasta de mods"**
   - Ou navegue manualmente para: `%appdata%\.minecraft\mods\`
4. **Copie o arquivo JAR** (`meuprimeiromod-1.0.0.jar`) para a pasta `mods`
5. Certifique-se de ter o **Minecraft Forge 47.2.0** instalado:
   - Baixe em: https://files.minecraftforge.net/net/minecraftforge/forge/
   - Instale o instalador e selecione a versão 1.20.1
6. Inicie o Minecraft com o perfil Forge

## 🎮 Testar o Mod

1. Crie um mundo ou entre em um existente
2. Abra o chat (T) e digite:
   ```
   /give @s meuprimeiromod:meu_primeiro_item
   ```
3. Você deve receber o item "Meu Primeiro Item"!

## ❌ Problemas Comuns

### "JAVA_HOME is not set"
- Instale o Java 17 (veja Passo 1)
- Configure JAVA_HOME (veja Passo 2)
- Reinicie o terminal/Cursor

### "Gradle não encontrado"
- O `gradlew.bat` deve estar na pasta do projeto
- Execute o comando na pasta raiz do projeto

### "Mod não aparece no jogo"
- Verifique se o Forge está instalado corretamente
- Certifique-se de usar a versão 1.20.1 do Minecraft
- Verifique se o JAR está na pasta `mods` correta

### Erro de compilação
- Verifique se todas as dependências foram baixadas
- Tente executar: `.\gradlew.bat clean build`

---

**Precisa de ajuda?** Verifique os logs de erro e compartilhe para que eu possa ajudar!
