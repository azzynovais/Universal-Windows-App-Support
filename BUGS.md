# 🐛 Bug Tracking e Relatório de Problemas

Agradecemos você encontrar bugs! Ajude-nos a melhorar o projeto.

## 📝 Como Reportar um Bug

### ✅ Antes de Reportar

1. **Verifique se já foi reportado**
   - Procure em [Issues](https://github.com/azzynovais/Universal-Windows-App-Support/issues)
   - Use palavras-chave: erro, distribuição, aplicativo
   - Filtre por Label: `bug`, `help-wanted`

2. **Tente atualizar**
   ```bash
   curl -sSL https://raw.githubusercontent.com/azzynovais/Universal-Windows-App-Support/main/windows-app-support.sh -o windows-app-support.sh
   chmod +x windows-app-support.sh
   ./windows-app-support.sh
   ```

3. **Tente troubleshooting básico**
   - Verifique conexão de internet
   - Tente desinstalar e reinstalar
   - Veja a seção Troubleshooting do [README.md](README.md)

### 📋 Informações Necessárias

Ao reportar um bug, inclua **obrigatoriamente**:

```markdown
## Informações do Sistema
- **Distribuição**: (ex: Ubuntu 24.04, Fedora 42, Arch Linux)
- **Versão do Script**: (execute: grep "#!/" windows-app-support.sh)
- **Arquitetura**: (execute: uname -m)
- **Gerenciador de Pacotes**: (apt, dnf, pacman, zypper, etc)

## Descrição do Problema
[Descreva o que aconteceu]

## Passos para Reproduzir
1. [Primeiro passo]
2. [Segundo passo]
3. [Terceiro passo]
4. [Resultado esperado vs resultado obtido]

## Mensagem de Erro Completa
[Cole aqui a saída do terminal com erro]

## Aplicativo Testado
- Nome e versão do aplicativo Windows

## Contexto Adicional
[Qualquer outra informação útil]
```

### 🔍 Como Coletar Informações

#### Sistema
```bash
# Informações da distribuição
cat /etc/os-release

# Arquitetura do sistema
uname -m
uname -r

# Versão do Wine
wine --version

# Versão do Flatpak
flatpak --version
```

#### Logs
```bash
# Histórico de instalações
cat ~/.local/share/windows-support.log

# Última execução do script (redirecione saída)
./windows-app-support.sh > log.txt 2>&1

# Logs do Wine
ls ~/.local/share/wine/
```

#### Variáveis de Ambiente
```bash
# Verificar idioma configurado
echo $LANG

# Verificar PATH
echo $PATH

# Variáveis de Wine
echo $WINEARCH
echo $WINEPREFIX
```

## 📤 Submeter o Relatório

### 1. Via GitHub Issues (Recomendado)

1. Vá para [Issues](https://github.com/azzynovais/Universal-Windows-App-Support/issues)
2. Clique em **"New Issue"**
3. Escolha o template apropriado
4. Preencha todas as seções
5. Clique em **"Submit new issue"**

### 2. Via Discussions

Se não tem certeza se é um bug:
1. Vá para [Discussions](https://github.com/azzynovais/Universal-Windows-App-Support/discussions)
2. Clique em **"New discussion"**
3. Escolha categoria: "Help" ou "General"
4. Descreva o problema

### 3. Email (Último Recurso)

Se não conseguir usar GitHub:
- Descreva o problema em detalhe
- Anexe logs
- Envie para: [contacto do projeto]

## 🏷️ Labels e Categorias

Ao criar uma issue, use os labels apropriados:

| Label | Significado |
|-------|-----------|
| `bug` | Problema confirmado |
| `help-wanted` | Precisa de ajuda |
| `distro:ubuntu` | Específico de Ubuntu/Debian |
| `distro:fedora` | Específico de Fedora/RHEL |
| `distro:arch` | Específico de Arch |
| `distro:suse` | Específico de openSUSE |
| `wine-issue` | Problema com Wine |
| `flatpak-issue` | Problema com Flatpak |
| `translation` | Erro de tradução |
| `docs` | Documentação |
| `enhancement` | Sugestão de melhoria |
| `question` | Pergunta |

## 📊 Exemplos de Bons Relatórios

### ✅ Bom Exemplo

```markdown
## Problema: Wine não instala no Fedora

### Sistema
- Distribuição: Fedora 37
- Arquitetura: x86_64
- Gerenciador: dnf

### Descrição
Ao executar o script, o Wine não instala corretamente.

### Passos para Reproduzir
1. Execute: `./windows-app-support.sh`
2. Escolha "Install & Integrate"
3. Observe a mensagem de erro

### Mensagem de Erro
```
[INFO] Fedora detected
Error: Unable to locate package wine
```

### Detalhes Adicionais
- Conexão de internet OK
- DNF funciona normalmente
- Outras distribuições também têm o problema?
```

### ❌ Mau Exemplo

```markdown
## Não funciona!

Instalei e não funciona. Me ajuda!
```

## 🔧 Processo de Resolução

### 1. Triagem (Maintainers)
- ✓ Confirmar o bug
- ✓ Categorizar por tipo
- ✓ Atribuir prioridade

### 2. Investigação
- Reproduzir o bug
- Identificar causa raiz
- Documentar achados

### 3. Correção
- Criar branch: `fix/issue-123`
- Fazer mudanças
- Testar em múltiplas distros

### 4. Pull Request
- Submeter PR com referência à issue
- Aguardar review
- Fazer ajustes se necessário

### 5. Merge e Release
- Merge para main
- Atualizar CHANGELOG
- Lançar nova versão

## 💡 Dicas para Aumentar a Chance de Correção

✅ **Faça:**
- Ser específico e claro
- Incluir todos os detalhes solicitados
- Ser respeitoso e paciente
- Testar a correção se possível
- Obrigado! 🙏

❌ **Não faça:**
- Reportar bugs vágos
- Pedir correção urgente
- Ser rude ou agressivo
- Spammar múltiplas issues
- Duplicar relatórios

## 🚨 Bugs Críticos

Para bugs críticos (segurança, perda de dados):

1. **NÃO publique detalhes** em issues públicas
2. **Contacte maintainer diretamente** via email privado
3. **Inclua**: descrição, como reproduzir, possível solução
4. Aguarde resposta dentro de 48 horas

## 📈 Status de Issues

- 🟢 **Open**: Aguardando investigação
- 🟡 **In Progress**: Sendo corrigido
- 🔵 **Help Wanted**: Voluntários podem ajudar
- 🟣 **Waiting for Feedback**: Aguardando resposta do reporter
- 🟠 **Won't Fix**: Decidido não corrigir (com justificativa)
- ✅ **Closed**: Resolvido

## 📚 Recursos Úteis

- [Como criar bom relatório de bug](https://www.mozilla.org/en-US/about/governance/policies/security-group/bugs/)
- [Padrão GitHub Issues](https://docs.github.com/issues)
- [Wine Debugging](https://wiki.winehq.org/Debug_Channels)
- [Flatpak Troubleshooting](https://docs.flatpak.org/en/latest/troubleshooting.html)

## ❓ FAQ

### Q: Quanto tempo leva para corrigir um bug?
**A**: Depende da complexidade. Bugs críticos: 1-2 dias. Simples: 1 semana. Complexos: 2+ semanas.

### Q: Como acompanho meu bug?
**A**: Adicione um "Watch" à issue ou receba notificações automaticamente.

### Q: Posso consertar o bug eu mesmo?
**A**: SIM! Veja [CONTRIBUTING.md](CONTRIBUTING.md) para como contribuir.

### Q: E se o bug for no Wine, não no script?
**A**: Reporte para o [Wine Project](https://www.winehq.org/). Nós ajudamos a contornar.

### Q: Meu idioma não tem suporte
**A**: Isso é uma feature, não bug! Veja [CONTRIBUTING.md](CONTRIBUTING.md) para traduções.

---

**Obrigado por ajudar a melhorar este projeto!** 🙏

*Último update: 9 de janeiro de 2026*
