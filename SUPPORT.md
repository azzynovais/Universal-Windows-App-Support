# 🤝 SUPORTE e AJUDA

Precisa de ajuda? Está documentado aqui!

## 📚 Recursos de Suporte

### 1️⃣ Documentação

- **[README.md](README.md)** - Documentação principal e tutorial
- **[CONTRIBUTING.md](CONTRIBUTING.md)** - Como contribuir
- **[BUGS.md](BUGS.md)** - Como reportar bugs
- **[CHANGELOG.md](CHANGELOG.md)** - Histórico de versões

### 2️⃣ GitHub

- **[Issues](https://github.com/azzynovais/Universal-Windows-App-Support/issues)** - Reporte bugs
- **[Discussions](https://github.com/azzynovais/Universal-Windows-App-Support/discussions)** - Faça perguntas
- **[Wiki](https://github.com/azzynovais/Universal-Windows-App-Support/wiki)** - Guias avançados (em construção)

### 3️⃣ Comunidade

- Comunidades Linux no Reddit
- Fóruns de sua distribuição
- Discord/Slack de comunidades Linux locais

---

## ❓ FAQ - Perguntas Frequentes

### Instalação

**P: Como instalar?**
```bash
curl -sSL https://raw.githubusercontent.com/azzynovais/Universal-Windows-App-Support/main/windows-app-support.sh | bash
```

**P: Dá para instalar em [minha distro]?**
A: Provavelmente! Temos suporte para:
- ✅ Debian/Ubuntu (e derivados)
- ✅ Fedora/RHEL
- ✅ Arch/Manjaro
- ✅ openSUSE
- ✅ Gentoo, Void, NixOS
- ⚠️ Outras (tenta auto-detectar)

**P: Preciso remover Wine antes?**
A: Não! O script verifica e instala tudo que falta.

**P: Vai dar error em WSL/WSL2?**
A: Não é suportado oficialmente, mas pode funcionar parcialmente.

### Uso

**P: Como instalar um aplicativo Windows?**
A: Três formas:
1. Procure "Windows Applications Support" no menu
2. Execute: `~/.local/bin/windows-support-launcher`
3. Linha de comando: `wine aplicativo.exe`

**P: Bottles ou Wine? Qual usar?**
A: Bottles é mais fácil para iniciantes. Wine é mais leve.

**P: Como desinstalar?**
```bash
./windows-app-support.sh
# Escolha "Uninstall"
```

**P: Pode desinstalar Wine completamente?**
A: O script não remove Wine (outros apps podem usar). Para remover:
```bash
sudo apt remove wine  # ou dnf/pacman/zypper
```

### Performance

**P: Está muito lento!**
A: Tente:
1. Use Wine ao invés de Bottles (mais leve)
2. Feche outros programas
3. Aumentar RAM alocada para Wine/Bottles
4. Usar versão Wine mais recente

**P: Como aumentar performance?**
```bash
# Desabilitar efeitos visuais
export CSMT=off
wine aplicativo.exe

# Mostrar FPS
export DXVK_HUD=fps
wine aplicativo.exe
```

### Compatibilidade

**P: Meu aplicativo não funciona!**
A:
1. Tente com Bottles (melhor compatibilidade)
2. Instale componentes Windows: `winetricks vcrun2019`
3. Veja ProtonDB para jogos
4. Reporte no [BUGS.md](BUGS.md)

**P: E programas com DRM/proteção?**
A: Provavelmente não funcionarão por limitações técnicas.

**P: Jogos com anti-cheat funcionam?**
A: Não, geralmente incompatíveis.

### Problemas Comuns

**P: Wine command not found**
```bash
# Ubuntu/Debian
sudo apt install wine

# Fedora
sudo dnf install wine

# Arch
sudo pacman -S wine

# openSUSE
sudo zypper install wine
```

**P: Erro de permissão (Permission denied)**
```bash
chmod +x windows-app-support.sh
./windows-app-support.sh
```

**P: Flatpak não funciona**
```bash
# Reinstalar Flatpak
sudo apt install flatpak  # ou distro equivalente

# Adicionar Flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Instalar Bottles
flatpak install flathub com.usebottles.bottles
```

**P: Bottles não abre**
```bash
# Tente executar via terminal
flatpak run com.usebottles.bottles

# Se tiver erro, reinstale
flatpak remove com.usebottles.bottles --force
flatpak install flathub com.usebottles.bottles
```

**P: .msi não instala**
```bash
# MSI é formato de instalador Windows
# Tente extrair com: msiexec /a arquivo.msi /qb TARGETDIR=~/Windows/drive_c/Program\ Files
# Ou use Bottles (interface mais amigável)
```

### Troubleshooting Avançado

**P: Como ver logs do Wine?**
```bash
# Logs gerais
cat ~/.local/share/windows-support.log

# Logs do Wine (debug)
WINEDEBUG=+all wine aplicativo.exe > wine.log 2>&1

# Logs do Flatpak
flatpak install --user -v com.usebottles.bottles 2>&1 | tee flatpak.log
```

**P: Como resetar Wine?**
```bash
# CUIDADO: Remove todos os aplicativos instalados!
rm -rf ~/.wine
rm -rf ~/.local/share/wine

# Reinstalar
./windows-app-support.sh
```

**P: Como mudar Wineprefix?**
```bash
# Criar novo prefix
export WINEPREFIX=~/.wine-novo
wine aplicativo.exe

# Usar um existente
export WINEPREFIX=~/.wine-backup
wine aplicativo.exe
```

---

## 🆘 Quando Pedir Ajuda

### Procure em:

1. **Este documento** - Muito provavelmente a resposta está aqui
2. **[README.md](README.md)** - Troubleshooting section
3. **[BUGS.md](BUGS.md)** - Para reportar bugs
4. **[Discussions](https://github.com/azzynovais/Universal-Windows-App-Support/discussions)** - Pergunte à comunidade

### Ao Pedir Ajuda, Forneça:

- ✅ Versão do Linux (output de `lsb_release -a`)
- ✅ Output completo do erro
- ✅ Qual aplicativo está testando
- ✅ O que já tentou
- ✅ Log completo (se possível)

### Exemplo de Boa Pergunta

```markdown
## Problema: Falha ao instalar Wine no Fedora 37

### Sistema
- Fedora 37 x86_64
- DNF (gerenciador de pacotes padrão)

### Erro
[Cole output completo do erro aqui]

### O que já tentei
1. Verificar conexão de internet
2. Atualizar pacotes: `sudo dnf update`
3. Reinstalar script

### Informações adicionais
[Qualquer coisa relevante]
```

---

## 💡 Dicas e Truques

### Performance

```bash
# Modo janela (mais rápido)
wine --explorer /desktop=Wine,1024x768 aplicativo.exe

# Full screen
wine aplicativo.exe

# Com hardware aceleração (requer dxvk)
export DXVK=1
wine aplicativo.exe
```

### Desenvolvimento

```bash
# Debug de Bottles
FLATPAK_DEBUG=1 flatpak run com.usebottles.bottles

# Shell dentro do container Flatpak
flatpak run --devel com.usebottles.bottles bash
```

### Backup e Restore

```bash
# Backup de configuração Wine
cp -r ~/.wine ~/.wine.backup

# Restore
rm -rf ~/.wine
cp -r ~/.wine.backup ~/.wine
```

---

## 📞 Contato e Redes Sociais

### Oficial

- 🐙 GitHub: [azzynovais/Universal-Windows-App-Support](https://github.com/azzynovais/Universal-Windows-App-Support)
- 💬 Discussions: [GitHub Discussions](https://github.com/azzynovais/Universal-Windows-App-Support/discussions)
- 📝 Issues: [GitHub Issues](https://github.com/azzynovais/Universal-Windows-App-Support/issues)

### Comunidades

- Reddit: r/linux, r/linuxmint, r/Ubuntu, r/Fedora, r/archlinux
- LinuxBR (Brasil)
- Linux hispano
- Comunidade Linux Francesa

---

## 🎓 Recursos de Aprendizado

### Wine

- [Wine Documentation](https://wiki.winehq.org/)
- [Wine AppDB](https://appdb.winehq.org/)
- [ProtonDB](https://protondb.com/)

### Bottles

- [Bottles Documentation](https://docs.usebottles.com/)
- [Bottles GitHub](https://github.com/usebottles/bottles)

### Flatpak

- [Flatpak Documentation](https://docs.flatpak.org/)
- [Flathub](https://flathub.org/)

### Linux

- [Linux Foundation](https://www.linuxfoundation.org/)
- [Distrowatch](https://distrowatch.com/)
- [ArchWiki](https://wiki.archlinux.org/) (útil para qualquer distro)

---

## 🐛 Relatório de Bugs vs Pergunta

### Reporte um BUG se:
- ✅ Script falha ou trava
- ✅ Erro consistente e reproduzível
- ✅ Diferente do comportamento esperado

### Faça uma PERGUNTA se:
- ❓ Não sabe como usar
- ❓ Quer saber compatibilidade
- ❓ Precisa de ajuda com configuração
- ❓ Não tem certeza se é bug

---

## 📊 Status de Suporte

| Nível | Tempo de Resposta | Descrição |
|-------|-------------------|-----------|
| 🔴 Critical | < 24h | Quebra de funcionalidade |
| 🟠 High | 2-3 dias | Funcionalidade prejudicada |
| 🟡 Medium | 1-2 semanas | Melhoria ou sugestão |
| 🟢 Low | Conforme time | Documentação ou cosmético |

---

## ✅ Checklist de Suporte

Antes de pedir ajuda:

- [ ] Li a documentação relevante
- [ ] Procurei no FAQ
- [ ] Testei em outra distribuição (se possível)
- [ ] Verifiquei conexão de internet
- [ ] Copiei output completo do erro
- [ ] Descrevia passos para reproduzir
- [ ] Incluí informações do sistema

---

**Agradecemos sua paciência e confiança!** 🙏

*Última atualização: 9 de janeiro de 2026*
