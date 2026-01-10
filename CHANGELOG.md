# 📝 CHANGELOG

Todos os mudanças notáveis neste projeto serão documentadas neste arquivo.

O formato é baseado em [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
e este projeto segue [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Suporte para 10+ distribuições Linux (NixOS, Void, Gentoo, etc)
- Instalação automática de Flatpak e Flathub
- Melhor detecção de distro com fallback para gerenciador de pacotes
- Scripts melhores de logging
- Suporte para tradução em 5 idiomas

### Changed
- Refatorar instalação de packages por distro
- Melhorar interface de usuário
- Expandir documentação
- Criar novo guia CONTRIBUTING.md

### Fixed
- Problema com Bottles não instalando em algumas distros
- Erro de instalação Wine32 em alguns sistemas

---

## [2.0.0] - 2026-01-09

### Added
- 🆕 Suporte Universal para quase todas as distribuições Linux
- 🆕 Distribuições suportadas: Ubuntu, Fedora, Arch, openSUSE, Gentoo, Void, NixOS
- 🆕 Integração automática do Flatpak e Flathub
- 🆕 Interface amigável com KDialog
- 🆕 Drag & Drop para instalação de .exe/.msi
- 🆕 Suporte para Bottles como alternativa ao Wine
- 🆕 Sistema de logging de aplicativos instalados
- 🆕 Múltiplas opções de instalação (Wine nativo vs Bottles)
- 🆕 Documentação completa em português
- 🆕 Guia de contribuição (CONTRIBUTING.md)
- 🆕 Guia de bug tracking (BUGS.md)

### Changed
- Refatoração completa do script
- Melhor tratamento de erros
- Interface gráfica aprimorada
- Mensagens de status mais claras

### Fixed
- Problemas de compatibilidade com diferentes distros
- Instalação inconsistente do Flatpak
- Permissões incorretas em arquivos desktop

### Security
- Validação melhorada de entrada
- Permissões seguras para arquivos criados

---

## [1.0.0] - 2025-12-20

### Added
- Versão inicial do projeto
- Suporte para Ubuntu e derivados
- Suporte para Fedora
- Suporte para Arch Linux
- Interface básica com KDialog
- Instalação de Wine e Bottles
- Menu de aplicativos integrado
- Tradução em 4 idiomas (PT, ES, FR, DE)

### Features Iniciais
- ✅ Detecta distribuição Linux
- ✅ Instala Wine, Winetricks, Flatpak, KDialog
- ✅ Integra Bottles (via Flatpak)
- ✅ Cria launcher drag & drop
- ✅ Registra .desktop files
- ✅ Desinstalação limpa
- ✅ Logging de aplicativos

---

## Diretrizes para Versões Futuras

### Versioning

- **MAJOR** (X.0.0): Mudanças incompatíveis, grandes refatorações
- **MINOR** (X.Y.0): Novas features, novas distros, sem quebrar compatibilidade
- **PATCH** (X.Y.Z): Bug fixes, pequenas melhorias

### Release Schedule

- Patch releases: Conforme necessário (quando bugs são achados)
- Minor releases: A cada 2-3 meses
- Major releases: Quando apropriado

### Exemplo de Versão Futura

```markdown
## [3.0.0] - YYYY-MM-DD

### Added
- Nova feature X
- Suporte para distro Y

### Changed
- Refatoração de Z

### Deprecated
- Função antiga A (será removida em v4.0.0)

### Removed
- Remoção de feature B

### Fixed
- Correção de bug C

### Security
- Patches de segurança
```

---

## Como Contribuir para o CHANGELOG

1. **Ao criar um PR**, adicione uma seção `[Unreleased]` se não existir
2. **Organize por categoria**: Added, Changed, Deprecated, Removed, Fixed, Security
3. **Seja descritivo mas conciso**: "Add X feature" vs "Implement new feature"
4. **Use emojis**: 🆕 (novo), 🔄 (mudança), 🐛 (bug), 🔒 (segurança)
5. **Inclua referência**: Relacione com issue ou PR (#123)

### Formato para Contribuições

```markdown
### Added
- 🆕 Nova feature (#123)
- Suporte para distro Y (#456)

### Fixed
- 🐛 Bug em X (#789)
```

---

## Histórico de Commits Significativos

| Data | Versão | Descrição |
|------|--------|-----------|
| 2025-12-20 | 1.0.0 | Versão inicial |
| 2026-01-09 | 2.0.0 | Suporte universal e melhoras completas |

---

## Plano Futuro (Roadmap)

### v2.1.0 (Próximo)
- [ ] Suporte para AppImage
- [ ] Suporte para Snap
- [ ] Melhorias de UI
- [ ] Mais idiomas

### v2.2.0
- [ ] Proton support
- [ ] Lutris integration
- [ ] Melhor gerencimento de prefixes Wine

### v3.0.0 (Futuro)
- [ ] Interface gráfica desktop
- [ ] Gerenciador de aplicativos
- [ ] Repositório de aplicativos testados

---

## Bugs Conhecidos

### v2.0.0
- Flatpak pode falhar em alguns proxy corporativos
- NixOS requer setup manual adicional
- Algumas traduções podem ter inconsistências

---

## Suporte Descontinuado

Versões não recebem suporte:
- Versões anteriores a v1.0.0 (dev/beta)
- Versões mais de 1 ano atrás

---

**Última atualização**: 9 de janeiro de 2026

*Para histórico completo de commits, veja: `git log --oneline`*
