# 🚀 Como Compilar e Instalar o Mod no Minecraft

## ⚠️ IMPORTANTE: Você precisa do Java 17 instalado primeiro!

## Passo 1: Instalar Java 17

### Opção Rápida (Recomendada):
1. Baixe o Java 17 em: **https://adoptium.net/temurin/releases/**
2. Selecione:
   - Version: **17 (LTS)**
   - Operating System: **Windows**
   - Architecture: **x64**
   - Package Type: **JDK**
3. Instale e **marque "Add to PATH"** se aparecer a opção
4. **Reinicie o Cursor** após instalar

### Verificar se funcionou:
Abra um novo terminal no Cursor e digite:
```powershell
java -version
```

Se mostrar a versão, está pronto! Se não, veja o arquivo `GUIA_INSTALACAO.md` para configurar manualmente.

---

## Passo 2: Compilar o Mod

Depois que o Java estiver instalado, execute no terminal do Cursor:

```powershell
cd "J:\ideias\008_Minecraft\001_MeuPrimeiroModMinecraft\MeuPrimeiroModMinecraft"
.\gradlew.bat build
```

**Isso vai:**
- Baixar o Minecraft e Forge (pode demorar alguns minutos na primeira vez)
- Compilar todo o código
- Gerar o arquivo JAR do mod

**Tempo estimado:** 5-10 minutos na primeira vez (dependendo da internet)

---

## Passo 3: Encontrar o JAR Gerado

Após compilar com sucesso, o arquivo estará em:

```
build\libs\meuprimeiromod-1.0.0.jar
```

Ou se tiver o "slim" no nome:
```
build\libs\meuprimeiromod-1.0.0-slim.jar
```

---

## Passo 4: Instalar no Minecraft

### 4.1 Instalar o Forge (se ainda não tiver):

1. Baixe o Forge 47.2.0 para Minecraft 1.20.1:
   - Acesse: **https://files.minecraftforge.net/net/minecraftforge/forge/**
   - Procure por: **1.20.1 - 47.2.0**
   - Baixe o **Installer** (não o "universal")

2. Execute o instalador:
   - Selecione **"Install client"**
   - Clique em **"OK"**
   - Aguarde a instalação

### 4.2 Copiar o Mod:

1. Abra o Minecraft Launcher
2. Vá em **"Instalações"**
3. Clique no perfil **"forge"** ou **"1.20.1-forge"**
4. Clique no ícone de **pasta** ao lado de "Jogar"
   - Isso abre a pasta do perfil
5. Entre na pasta **"mods"** (crie se não existir)
6. **Copie o arquivo JAR** do mod para esta pasta:
   - `meuprimeiromod-1.0.0.jar` ou `meuprimeiromod-1.0.0-slim.jar`

### 4.3 Jogar:

1. Inicie o Minecraft com o perfil Forge
2. Crie um mundo ou entre em um existente
3. Abra o chat (tecla **T**) e digite:
   ```
   /give @s meuprimeiromod:meu_primeiro_item
   ```
4. Você deve receber o item "Meu Primeiro Item"! 🎉

---

## ❌ Problemas?

### "JAVA_HOME is not set"
→ Instale o Java 17 (veja Passo 1)

### "Gradle não encontrado"
→ Certifique-se de estar na pasta correta do projeto

### "Mod não aparece no jogo"
→ Verifique se:
- O Forge está instalado corretamente
- Você está usando Minecraft 1.20.1
- O JAR está na pasta `mods` correta

### Erro de compilação
→ Tente limpar e recompilar:
```powershell
.\gradlew.bat clean build
```

---

## 📝 Resumo Rápido:

1. ✅ Instalar Java 17
2. ✅ Executar `.\gradlew.bat build`
3. ✅ Copiar o JAR de `build\libs\` para a pasta `mods` do Minecraft
4. ✅ Jogar e testar!

**Boa sorte! 🎮**
