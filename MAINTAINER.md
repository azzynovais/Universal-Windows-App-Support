# 👨‍💼 Guia do Maintainer

Este documento é para maintainers do projeto Universal-Windows-App-Support.

## 🎯 Responsabilidades

### Daily/Weekly
- [ ] Revisar e responder issues abertas
- [ ] Revisar pull requests
- [ ] Moderar discussões
- [ ] Monitorar padrão (Dependabot)

### Monthly
- [ ] Triagem de issues antigas
- [ ] Planejamento de releases
- [ ] Atualizar documentação
- [ ] Responder surveys

### Quarterly
- [ ] Planejamento estratégico
- [ ] Revisão de roadmap
- [ ] Decisões arquiteturais

---

## 📋 Processo de Review de PR

### 1. Triage
```
- [ ] Código segue padrões?
- [ ] Mensagens de commit estão claras?
- [ ] Teste foi feito?
- [ ] Documentação atualizada?
```

### 2. Verificações
```
- [ ] Sem merge conflicts
- [ ] CI/CD passa
- [ ] ShellCheck sem warnings
- [ ] Sem regressões conhecidas
```

### 3. Review do Código
```
- [ ] Logica está correta?
- [ ] Sem vulnerabilidades?
- [ ] Sem hardcoded values?
- [ ] Código limpo e legível?
```

### 4. Aprovação e Merge
```
- [ ] Mínimo 1 review
- [ ] Autor respondeu feedback
- [ ] Pronto para merge
- [ ] Squash se necessário
```

### 5. Pós-Merge
```
- [ ] Fechar issues relacionadas
- [ ] Atualizar milestone
- [ ] Adicionar ao CHANGELOG
```

---

## 🐛 Processo de Bug Triagem

### Classificação

| Label | Critério | Ação |
|-------|----------|------|
| 🔴 P0-Critical | Quebra funcionalidade | Prioridade 1 |
| 🟠 P1-High | Funciona com limitações | Prioridade 2 |
| 🟡 P2-Medium | Melhoria/cosmetico | Backlog |
| 🟢 P3-Low | Feature request | Futuro |

### Template de Resposta

```markdown
Obrigado pelo relatório!

Vou investigar este problema em:
- [ ] Ubuntu 22.04
- [ ] Fedora 37
- [ ] Arch Linux

Atualizarei quando tiver mais informações.
```

---

## 🚀 Processo de Release

### Checklist de Release

```bash
# 1. Criar branch de release
git checkout -b release/v2.1.0

# 2. Atualizar versão no script
# grep -n "VERSION" windows-app-support.sh
# Atualizar para versão nova

# 3. Atualizar CHANGELOG
nano CHANGELOG.md
# Mover [Unreleased] para [2.1.0] com data

# 4. Criar commit
git add .
git commit -m "Release: v2.1.0"
git tag -a v2.1.0 -m "Release version 2.1.0"

# 5. Push
git push origin release/v2.1.0
git push origin --tags

# 6. Criar PR
# Abra PR no GitHub

# 7. Após merge
git checkout main
git pull origin main

# 8. Criar Release no GitHub
# Vá para Releases -> New Release
# Use tag criado
# Cole CHANGELOG
# Adicione arquivo binário (se houver)
```

### Versionamento

Seguir SemVer:
- **2.0.0** - Major (quebra compatibilidade)
- **2.1.0** - Minor (nova feature)
- **2.1.1** - Patch (bug fix)

---

## 📝 Manutenção de Documentação

### Arquivos Principais

- **README.md** - Documentação principal (mantém atualizado)
- **CONTRIBUTING.md** - Guia de contribuição (rara mudança)
- **BUGS.md** - Bug tracking (rara mudança)
- **CHANGELOG.md** - Histórico (atualizado em cada release)
- **SECURITY.md** - Políticas segurança (importante!)
- **SUPPORT.md** - FAQ e suporte (manter atualizado)

### Checklist de Documentação

Para cada release:
- [ ] README reflete funcionalidades atuais
- [ ] CHANGELOG completo
- [ ] Exemplos funcionam
- [ ] Links não quebrados
- [ ] Português está correto

---

## 🔧 Ferramentas e Scripts

### Verificações Automáticas

```bash
# ShellCheck
shellcheck windows-app-support.sh

# Verificar links
npx broken-link-checker README.md

# Spell check
aspell check *.md
```

### CI/CD Configuration

O projeto pode ter:
- GitHub Actions para testes
- Dependabot para atualizações
- Code coverage

Configurar em `.github/workflows/`

---

## 👥 Moderação da Comunidade

### Código de Conduta

- Respeito mútuo
- Sem discriminação
- Sem spam
- Foco construtivo

### Ações

1. **Warning** - Primeira vez
2. **Timeout** - Reincidência
3. **Ban** - Reincidência grave

### Exemplos

❌ **Não permitido:**
- Insultos
- Discriminação
- Spam/Trolling
- NSFW content

✅ **Permitido:**
- Crítica construtiva
- Desacordo respeitoso
- Humor apropriado
- Debate técnico

---

## 💬 Comunicação

### Canais Oficiais

- GitHub Issues
- GitHub Discussions
- GitHub Releases (anúncios)

### Mensagens

- **Respostas rápidas:** 24-48h
- **Issues críticos:** < 24h
- **Planos:** Comunicar com antecedência

### Tom

- Profissional mas amigável
- Claro e conciso
- Grato pela contribuição
- Honesto sobre limitações

---

## 🎓 Onboarding de Novos Maintainers

### Checklist

- [ ] Acesso ao repositório
- [ ] Permissões PyPI/Releases
- [ ] Acesso ao email do projeto
- [ ] Adicionar a MAINTAINERS.md
- [ ] Revisar políticas deste documento
- [ ] Shadow de 1-2 semanas
- [ ] Primeiro release guiado

### Responsabilidades

- Manter código de conduta
- Revisar PRs com qualidade
- Triagem de issues
- Comunicar decisões
- Lidar com segurança

---

## 📊 Métricas

### O que Monitorar

```bash
# Issues abertas vs fechadas
# PRs em review
# Tempo médio de resolução
# Satisfação da comunidade
# Tráfego downloads
```

### Relatório Mensal

Sugestão de template:

```markdown
## Relatório Mensal - Janeiro 2026

### Números
- Issues: 5 abertas, 3 fechadas
- PRs: 2 merged
- Contribuidores: 3 novos

### Principais Mudanças
- Feature X adicionada
- Bug Y corrigido

### Próximos Passos
- Release planejada
- Documentação a atualizar
```

---

## 🔒 Segurança

### Processo

1. Receber report privado
2. Confirmar recebimento (24h)
3. Investigar (7-14 dias)
4. Corrigir
5. Divulgar

### Patch

- Lançar versão de segurança ASAP
- Crédito público ao pesquisador
- Anúncio em comunidades

---

## ⚖️ Governança

### Decisões Maiores

Discutir com:
- Outros maintainers
- Comunidade (Discussions)
- Considerar roadmap

### Processo

1. Propor em Discussion
2. Debater 1-2 semanas
3. Votação (se necessário)
4. Comunicar decisão
5. Implementar

---

## 📚 Recursos

### Git

- [Git Book](https://git-scm.com/book)
- [GitHub Docs](https://docs.github.com)

### Bash

- [Bash Manual](https://www.gnu.org/software/bash/manual/)
- [ShellCheck](https://www.shellcheck.net/)

### Gestão

- [Open Source Guide](https://opensource.guide/)
- [Governance Models](https://opensource.guide/how-to-govern/)

---

## 🆘 Emergências

### Segurança Crítica

1. Notificar outros maintainers
2. Criar branch privado
3. Correção ASAP
4. Release segurança emergencial
5. Comunicado público

### Outage/Downtime

1. Investigar causa
2. Hotfix se possível
3. Comunicação transparente
4. Post-mortem

---

## 🎉 Celebrando Marcos

- 1º ano: Agradecimento
- 1000 stars: Mensagem especial
- 100 contribuidores: Destaque
- 10k downloads: Anúncio

Manter comunidade motivada!

---

**Obrigado por manter este projeto vivo!** 🙏

*Última atualização: 9 de janeiro de 2026*
