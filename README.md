# Meu Primeiro Mod Minecraft

Um mod básico para Minecraft usando Minecraft Forge, criado como exemplo para iniciantes.

## ✨ Versão 1.0.0

- ✅ Estrutura de pastas organizada e profissional
- ✅ Creative Tab personalizado
- ✅ Sistema de versão semântico
- ✅ Código melhorado e documentado

## 📋 Pré-requisitos

Antes de começar, você precisa ter instalado:

- **Java 17** ou superior ([Download](https://adoptium.net/))
- **Minecraft 1.20.1**
- **Minecraft Forge 47.2.0** ou superior
- **IDE** (recomendado: IntelliJ IDEA ou Eclipse)

## 🚀 Como Compilar e Instalar o Mod

### ⚠️ IMPORTANTE: Instale o Java 17 primeiro!

1. **Baixe o Java 17**: https://adoptium.net/temurin/releases/
   - Selecione: Version 17 (LTS), Windows, x64, JDK
   - Instale e marque "Add to PATH" se aparecer
   - **Reinicie o Cursor** após instalar

2. **Compilar o mod** (escolha uma opção):

   **Opção A - Script Melhorado (Recomendado):**
   ```bash
   .\build.bat
   ```
   Este script encontra o Java automaticamente e compila o mod.

   **Opção B - Manual:**
   ```bash
   .\gradlew.bat clean build
   ```

3. **Encontrar o JAR gerado:**
   - O arquivo estará em: `build\libs\meuprimeiromod-1.0.0.jar`

4. **Instalar no Minecraft:**
   - Instale o Forge 47.2.0 para Minecraft 1.20.1: https://files.minecraftforge.net/
   - Copie o JAR para: `%appdata%\.minecraft\mods\`
   - Inicie o Minecraft com o perfil Forge

📖 **Para instruções detalhadas, veja:** `COMPILAR_MOD.md`

### 2. Importar no IDE

#### IntelliJ IDEA:
1. Abra o IntelliJ IDEA
2. File → Open → Selecione a pasta do projeto
3. Aguarde o Gradle sincronizar as dependências
4. Configure o Run Configuration:
   - Run → Edit Configurations
   - Adicione uma nova configuração "Application"
   - Main class: `net.minecraftforge.userdev.LaunchTesting`
   - Ou use as configurações pré-configuradas do Forge

#### Eclipse:
1. Execute `gradlew genEclipseRuns` no terminal
2. Importe o projeto no Eclipse
3. Use as run configurations geradas

### 3. Executar o Mod

1. No IntelliJ IDEA, use a configuração "runClient" ou "runServer"
2. O Minecraft deve abrir com o mod carregado
3. Você pode testar o mod criando um mundo e usando o comando:
   ```
   /give @s meuprimeiromod:meu_primeiro_item
   ```

## 📁 Estrutura do Projeto

```
MeuPrimeiroModMinecraft/
├── src/                                           # Código fonte
│   └── main/
│       ├── java/                                  # Código Java
│       │   └── com/example/meuprimeiromod/
│       │       ├── MeuPrimeiroModMinecraft.java  # Classe principal
│       │       ├── items/                         # Pacote de itens
│       │       │   ├── ModItems.java
│       │       │   └── MeuPrimeiroItem.java
│       │       └── creativetab/                   # Creative Tabs
│       │           └── ModCreativeTabs.java
│       └── resources/                            # Recursos do mod
│           ├── META-INF/
│           │   └── mods.toml
│           └── assets/meuprimeiromod/
│               ├── lang/                          # Traduções
│               ├── models/                        # Modelos 3D
│               └── textures/                      # Texturas
├── scripts/                                       # 🗂️ Scripts de compilação
│   ├── build.bat                                 # Script principal
│   ├── compilar*.bat                             # Scripts alternativos
│   └── *.ps1                                     # Scripts PowerShell
├── docs/                                          # 📚 Documentação
│   ├── COMPILAR_MOD.md                           # Guia de compilação
│   ├── ESTRUTURA_PROJETO.md                      # Estrutura detalhada
│   └── ...                                       # Outros guias
├── build.gradle                                   # Configuração Gradle
├── build.bat                                      # Script principal (raiz)
├── gradlew.bat                                    # Gradle Wrapper
├── settings.gradle
├── gradle.properties
└── README.md                                      # Este arquivo
```

📖 **Documentação completa:** Veja a pasta [`docs/`](docs/) para todos os guias e documentação técnica.

📁 **Estrutura organizada:** Veja [`docs/ESTRUTURA_ORGANIZADA.md`](docs/ESTRUTURA_ORGANIZADA.md) para entender a organização do projeto.

## 📚 Documentação

Toda a documentação está organizada na pasta [`docs/`](docs/):

- **Guia de Compilação:** [`docs/COMPILAR_MOD.md`](docs/COMPILAR_MOD.md)
- **Estrutura do Projeto:** [`docs/ESTRUTURA_PROJETO.md`](docs/ESTRUTURA_PROJETO.md)
- **Melhorias Aplicadas:** [`docs/MELHORIAS_APLICADAS.md`](docs/MELHORIAS_APLICADAS.md)
- **Solução de Problemas:** [`docs/SOLUCAO_JAVA.md`](docs/SOLUCAO_JAVA.md)

## 🛠️ Scripts

Todos os scripts de compilação estão em [`scripts/`](scripts/):

- **Script Principal:** `build.bat` (ou `scripts\build.bat`)
- **Scripts Alternativos:** Vários scripts auxiliares em `scripts/`

## 🎮 O que este Mod Faz?

Este mod adiciona um item simples chamado "Meu Primeiro Item" ao jogo. É um exemplo básico que demonstra:

- ✅ Como criar e registrar itens
- ✅ Como adicionar traduções (português e inglês)
- ✅ Como criar modelos e texturas básicas
- ✅ Como criar Creative Tabs personalizados
- ✅ A estrutura básica e organizada de um mod Forge
- ✅ Sistema de versionamento semântico

**No jogo:** O item aparece em uma aba criativa personalizada chamada "Meu Primeiro Mod"!

## 🛠️ Próximos Passos

Agora que você tem um mod básico funcionando, você pode:

1. **Adicionar mais itens**: Crie novos itens seguindo o padrão de `MeuPrimeiroItem`
2. **Criar blocos**: Adicione blocos personalizados ao jogo
3. **Adicionar texturas**: Substitua a textura placeholder por uma imagem real (16x16 ou 32x32 pixels)
4. **Criar receitas**: Adicione receitas de crafting para seus itens
5. **Adicionar funcionalidades**: Dê habilidades especiais aos seus itens

## 📚 Recursos Úteis

- [Documentação do Minecraft Forge](https://docs.minecraftforge.net/)
- [MCreator](https://mcreator.net/) - Ferramenta visual para criar mods (mais fácil para iniciantes)
- [Forge Forums](https://forums.minecraftforge.net/)
- [Minecraft Wiki](https://minecraft.wiki/)

## ⚠️ Notas Importantes

- A textura do item (`meu_primeiro_item.png`) é apenas um placeholder. Você deve criar sua própria textura (16x16 ou 32x32 pixels)
- Certifique-se de que o Java 17 está instalado e configurado corretamente
- O mod foi configurado para Minecraft 1.20.1. Para outras versões, atualize o `gradle.properties` e `build.gradle`

## 📝 Licença

MIT License - Sinta-se livre para usar e modificar este código!

## 🤝 Contribuindo

Este é um projeto de aprendizado. Sinta-se livre para experimentar e modificar!

---

**Boa sorte criando seu primeiro mod de Minecraft! 🎉**
