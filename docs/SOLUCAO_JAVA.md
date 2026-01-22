# 🔧 Solução: Java Não Encontrado

## ⚠️ Problema Comum Após Instalar Java

Após instalar o Java, o terminal precisa ser **reiniciado** para reconhecer o Java.

## ✅ Solução 1: Reiniciar o Cursor (Recomendado)

1. **Feche completamente o Cursor**
2. **Abra o Cursor novamente**
3. **Abra um novo terminal**
4. **Execute:** `java -version`
   - Se mostrar a versão, está funcionando!
5. **Compile o mod:**
   ```powershell
   .\compilar-agora.bat
   ```

---

## ✅ Solução 2: Configurar Java Manualmente

Se reiniciar não funcionar, você pode configurar manualmente:

### Passo 1: Encontrar onde o Java foi instalado

O Java geralmente está em um destes locais:
- `C:\Program Files\Eclipse Adoptium\jdk-17.x.x+x`
- `C:\Program Files\Java\jdk-17.x.x`
- `C:\Users\[SeuUsuario]\AppData\Local\Programs\Eclipse Adoptium\jdk-17.x.x+x`

### Passo 2: Configurar no Terminal

No terminal do Cursor, execute (substitua pelo caminho real):

```powershell
# Exemplo - ajuste o caminho para o seu caso
$env:JAVA_HOME = "C:\Program Files\Eclipse Adoptium\jdk-17.0.10+7"
$env:PATH = "$env:JAVA_HOME\bin;$env:PATH"

# Verificar se funcionou
java -version
```

### Passo 3: Compilar

```powershell
.\gradlew.bat build
```

---

## ✅ Solução 3: Usar o Script com Caminho Manual

1. Abra o arquivo `compilar-agora.bat` no editor
2. Antes da linha `call gradlew.bat build`, adicione:
   ```batch
   set "JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-17.0.10+7"
   set "PATH=%JAVA_HOME%\bin;%PATH%"
   ```
   (Ajuste o caminho para onde seu Java está instalado)

3. Salve e execute: `.\compilar-agora.bat`

---

## 🔍 Como Encontrar o Caminho do Java

### Opção A: Explorador de Arquivos
1. Abra o Explorador de Arquivos
2. Vá para `C:\Program Files\Eclipse Adoptium\`
3. Procure por uma pasta que comece com `jdk-17`
4. Copie o caminho completo

### Opção B: PowerShell
Execute no PowerShell:
```powershell
Get-ChildItem "C:\Program Files\Eclipse Adoptium" -Directory | Where-Object { $_.Name -like "*jdk*17*" }
```

---

## 📝 Depois que o Java Funcionar

Quando `java -version` funcionar, você pode compilar:

```powershell
.\gradlew.bat build
```

O JAR estará em: `build\libs\meuprimeiromod-1.0.0.jar`

---

## ❓ Ainda Não Funciona?

1. Verifique se o Java 17 está realmente instalado
2. Tente reinstalar o Java e marque "Add to PATH"
3. Reinicie o computador (às vezes é necessário)
