# 👥 Guia de Contribuição

Obrigado por querer contribuir! Este é um projeto comunitário e toda ajuda é bem-vinda.

## 🤝 Como Contribuir

### 1. Reportar Bugs
Veja [BUGS.md](BUGS.md) para o processo completo de bug tracking.

Resumidamente:
- Verifique se já foi reportado
- Inclua informações do sistema
- Use template apropriado
- Seja específico e claro

### 2. Sugerir Melhorias
- Vá para [Discussions](https://github.com/azzynovais/Universal-Windows-App-Support/discussions)
- Descreva a melhoria
- Explique o benefício
- Discuta com a comunidade

### 3. Corrigir Bugs
- Procure por issues com label `bug` ou `help-wanted`
- Comente: "Vou tentar corrigir"
- Crie um fork e comece a trabalhar
- Siga o guia [Workflow](#workflow)

### 4. Adicionar Suporte para Nova Distribuição
1. Identifique o gerenciador de pacotes
2. Procure o padrão no script: `case "$distro" in`
3. Adicione novo case com comandos apropriados
4. Teste em mínimo 2 máquinas
5. Submeta PR

### 5. Melhorar Documentação
- Corrigir erros de português/inglês
- Melhorar clareza
- Adicionar exemplos
- Atualizar screenshots

### 6. Traduzir para Novo Idioma
1. Procure por função `translate()` no script
2. Adicione novo case com seu idioma
3. Traduza **todos** os strings
4. Teste com `LANG=xx_YY.UTF-8`
5. Submeta PR

## 💻 Workflow Git

### Setup Inicial

```bash
# 1. Fork o repositório no GitHub
# (clique em "Fork" no topo da página)

# 2. Clone seu fork
git clone https://github.com/SEU_USUARIO/Universal-Windows-App-Support.git
cd Universal-Windows-App-Support

# 3. Configure remote upstream
git remote add upstream https://github.com/azzynovais/Universal-Windows-App-Support.git

# 4. Verifique
git remote -v
```

### Criar Branch para Correção

```bash
# 1. Atualize master
git fetch upstream
git checkout main
git merge upstream/main

# 2. Crie branch descritiva
# Para bug fix:
git checkout -b fix/issue-123-descricao-curta

# Para feature:
git checkout -b feature/descricao-da-feature

# Para docs:
git checkout -b docs/descricao

# Para traducao:
git checkout -b translate/idioma
```

### Nomear Branches

- **Bug fixes**: `fix/NUMERO-ISSUE-descricao`
- **Features**: `feature/descricao`
- **Docs**: `docs/descricao`
- **Traduções**: `translate/idioma`
- **Refactor**: `refactor/descricao`

Exemplo:
```bash
git checkout -b fix/issue-42-wine-arch-linux
git checkout -b feature/add-proton-support
```

### Fazer Mudanças

```bash
# 1. Edite os arquivos
nano windows-app-support.sh

# 2. Teste suas mudanças
./windows-app-support.sh

# 3. Verifique diferenças
git diff

# 4. Add mudanças
git add .

# 5. Commit com mensagem clara
git commit -m "Fix: Corrigir instalação de Wine no Arch Linux

- Adicionar dependência cabextract
- Testar em Arch e Manjaro
- Resolve issue #42"
```

### Mensagens de Commit

Siga este padrão:

```
[Tipo]: Descrição breve (50 caracteres máx)

Descrição mais detalhada se necessário (72 caracteres por linha)

- Ponto 1
- Ponto 2

Resolve: #NUMERO_ISSUE
```

**Tipos válidos:**
- `fix:` - Correção de bug
- `feat:` - Nova feature
- `docs:` - Documentação
- `refactor:` - Reorganizar código
- `test:` - Adicionar testes
- `style:` - Formatação, sem mudança funcional
- `perf:` - Melhoria de performance
- `chore:` - Tarefas de manutenção

### Testar Mudanças

```bash
# Antes de fazer push, teste em:

# 1. Sua distribuição
./windows-app-support.sh

# 2. Mínimo 2 outras distribuições (máquinas virtuais):
# - Uma Debian-based (Ubuntu/Mint)
# - Uma RedHat-based (Fedora) ou Arch

# 3. Teste desinstalação
./windows-app-support.sh  # Choose Uninstall

# 4. Teste instalação novamente
./windows-app-support.sh  # Choose Install
```

### Push e Pull Request

```bash
# 1. Push para seu fork
git push origin fix/issue-123-descricao

# 2. Vá ao GitHub e clique "Compare & pull request"

# 3. Preencha template:
```

**Template de PR:**

```markdown
## Descrição
[O que essa PR faz?]

## Tipo de Mudança
- [ ] 🐛 Bug fix
- [ ] ✨ Feature nova
- [ ] 📚 Documentação
- [ ] 🌍 Tradução
- [ ] ♻️ Refactor

## Relacionado a
Resolve: #123
ou
Parcialmente resolve: #123, #124

## Teste
- [ ] Testei em Ubuntu 22.04
- [ ] Testei em Fedora 37
- [ ] Testei em Arch Linux
- [ ] Instalação OK
- [ ] Desinstalação OK

## Checklist
- [ ] Meu código segue o estilo do projeto
- [ ] Adicionei comments onde necessário
- [ ] Atualizei documentação se necessário
- [ ] Meu commit tem mensagem clara
```

### Após Submeter PR

1. Aguarde review da comunidade
2. Responda comentários e sugestões
3. Faça ajustes se necessário:
   ```bash
   # Faça mudanças
   git add .
   git commit -m "Review: Feedback sobre PR"
   git push origin fix/issue-123
   # Seu PR atualiza automaticamente
   ```
4. Após aprovação, seu PR será merged!

## 🏗️ Estrutura do Projeto

```
Universal-Windows-App-Support/
├── windows-app-support.sh    # Script principal
├── README.md                  # Documentação
├── CONTRIBUTING.md            # Este arquivo
├── BUGS.md                    # Bug tracking
├── LICENSE                    # GPL v2
└── .github/
    ├── ISSUE_TEMPLATE/
    │   ├── BUG_REPORT.md
    │   └── FEATURE_REQUEST.md
    └── pull_request_template.md
```

## 📝 Padrões de Código

### Bash Script

```bash
#!/usr/bin/env bash
set -e  # Exit on error

# Use snake_case para variáveis
my_var="value"

# Use CAPITAL_CASE para constantes
CONSTANT_VALUE="value"

# Sempre quote variáveis
echo "$my_var"

# Use descriptive names
# ❌ BAD: for i in $(ls); do ...
# ✅ GOOD: for file in *.txt; do ...

# Comments em português
# Explique o "porquê", não o "o quê"

# Funções com prefixo claro
install_packages() {
    # ...
}

uninstall_all() {
    # ...
}
```

### Estrutura de Funções

```bash
# ===== Seções com delimitadores =====
# 1. Função
# 2. Descrição
# 3. Documentação
# 4. Implementação

install_packages() {
    # Instala pacotes dependendo da distribuição
    # Args: nenhum
    # Returns: 0 se sucesso, 1 se erro

    case "$distro" in
        ubuntu|debian)
            sudo apt install -y wine winetricks
            ;;
        fedora)
            sudo dnf install -y wine winetricks
            ;;
    esac
}
```

### Traduções

Sempre forneça em:
- 🇵🇹 Português
- 🇪🇸 Espanhol
- 🇫🇷 Francês
- 🇩🇪 Alemão
- 🇬🇧 Inglês

```bash
translate() {
    case "$lang" in
        pt)
            t_title="Título em Português"
            ;;
        es)
            t_title="Título en Español"
            ;;
        # ... etc
    esac
}
```

## 🎯 Áreas de Maior Necessidade

Onde sua ajuda seria mais útil:

- 🐧 **Testar em mais distros**: NixOS, Gentoo, Void
- 📱 **App Store**: Flatpak manifests
- 📖 **Documentação**: Expandir guias
- 🌍 **Traduções**: Mais idiomas
- 🧪 **Testes**: CI/CD pipeline
- 🎨 **UI**: Melhorar interface
- 📊 **Compatibilidade**: Matriz de testes

## 📚 Aprenda Mais

### Recursos sobre as Tecnologias

- [Bash Scripting](https://www.gnu.org/software/bash/manual/)
- [Wine Documentation](https://wiki.winehq.org/)
- [Flatpak Docs](https://docs.flatpak.org/)
- [Bottles Documentation](https://docs.usebottles.com/)

### Git e GitHub

- [Git Tutorial](https://github.com/git-tips/tips)
- [GitHub Docs](https://docs.github.com/)
- [How to Open a Pull Request](https://www.atlassian.com/git/tutorials/making-a-pull-request)

### Outras Distros Linux

- [Ubuntu Packaging Guide](https://wiki.ubuntu.com/Packaging)
- [Fedora Development](https://developer.fedoraproject.org/)
- [Arch Linux Development](https://wiki.archlinux.org/title/DeveloperWiki)

## ✅ Checklist Antes de Submeter

- [ ] Código testado em múltiplas distros
- [ ] Mensagem de commit clara
- [ ] Nenhuma mudança não-relacionada incluída
- [ ] Documentação atualizada
- [ ] Traduções completas (se for string)
- [ ] Sem warnings ou erros de lint
- [ ] Código segue padrões do projeto
- [ ] Branch atualizada com upstream/main

## 🎓 Seu Primeiro Contribute

Procure por issues com label `good-first-issue`:
1. Simples para começar
2. Bem documentadas
3. Projeto oferece ajuda

Passos:
1. Comente: "Vou trabalhar nisso"
2. Siga este guia
3. Submeta PR
4. Receba feedback
5. Aprenda!

## 🙏 Código de Conduta

Todos são bem-vindos, independente de:
- Nível de experiência
- Gênero, identidade, orientação sexual
- Etnia, nacionalidade, religião
- Aparência, deficiência

### Esperamos:
- ✅ Respeito mútuo
- ✅ Comunicação clara
- ✅ Aceitar feedback
- ✅ Focar em ideias, não em pessoas

### Não aceitamos:
- ❌ Comportamento assediador
- ❌ Discriminação
- ❌ Insultos ou ataques
- ❌ Spam ou trolling

Viole isso? Reporte para o maintainer.

## 🎉 Reconhecimento

Todos os contributors são reconhecidos em:
- README.md (seção Contributors)
- GitHub Contributors Page
- Release Notes

Sinta-se livre de adicionar seu nome/link em PRs!

## ❓ Dúvidas?

- 💬 [Discussions](https://github.com/azzynovais/Universal-Windows-App-Support/discussions)
- 🐛 [Issues](https://github.com/azzynovais/Universal-Windows-App-Support/issues)
- 📧 Email (veja README.md)

## 📋 Processo de Review

1. **Triage**: Verifica se é válido
2. **CI/CD**: Roda testes automáticos
3. **Review**: Comunidade revisa
4. **Feedback**: Sugestões de melhoria
5. **Update**: Você faz ajustes
6. **Approval**: Mantainer aprova
7. **Merge**: PR é merged em main

## 🚀 Mantendo-se Atualizado

```bash
# Antes de começar novamente
git fetch upstream
git checkout main
git merge upstream/main

# Ou mais direto
git pull upstream main
```

---

**Obrigado por contribuir!** 🎉

*Última atualização: 9 de janeiro de 2026*
