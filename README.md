# 🪟 Universal Windows App Support

Uma ferramenta intuitiva e universal para executar aplicativos Windows em qualquer distribuição Linux. Suporte multi-idioma e com interface gráfica amigável.

[![License: GPL v2](https://img.shields.io/badge/License-GPLv2-blue.svg)](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)

## 📋 Características

✅ **Suporte Universal**: Funciona em quase todas as distribuições Linux
✅ **Multi-idioma**: Português, Espanhol, Francês, Alemão e Inglês
✅ **Drag & Drop**: Arraste arquivos .exe/.msi diretamente
✅ **Flatpak Integrado**: Instala automaticamente Flatpak e Flathub
✅ **Duas Opções**: Wine nativo ou Bottles
✅ **Interface Gráfica**: KDialog amigável
✅ **Logging**: Rastreia aplicativos instalados

## 🚀 Instalação Rápida

```bash
# Baixar e executar
curl -sSL https://raw.githubusercontent.com/azzynovais/Universal-Windows-App-Support/main/windows-app-support.sh -o windows-app-support.sh
chmod +x windows-app-support.sh
./windows-app-support.sh
```

## 🐧 Distribuições Suportadas

| Família | Distribuições |
|---------|---------------|
| **Debian/Ubuntu** | Ubuntu, Mint, Debian, Elementary, Pop!_OS |
| **RedHat** | Fedora, RHEL, CentOS, AlmaLinux, Rocky |
| **Arch** | Arch, Manjaro, EndeavourOS, Garuda, CachyOS |
| **openSUSE** | Leap, Tumbleweed |
| **Independentes** | Gentoo, Void, NixOS |

## 📖 Como Usar

### Primeira Execução

```bash
./windows-app-support.sh
# Escolha "Install & Integrate"
```

O script instalará:
- Wine, Winetricks, Flatpak
- Flathub e Bottles
- Launcher no menu de aplicativos

### Usar Aplicativos Windows

**Opção 1: Arraste e Solte** (Fácil)
- Procure "Windows Applications Support" no menu
- Arraste um .exe ou .msi
- Escolha Bottles ou Wine

**Opção 2: Linha de Comando**
```bash
wine aplicativo.exe
flatpak run com.usebottles.bottles aplicativo.exe
```

## ⚙️ O que é Instalado

- **Wine/Wine64**: Compatibilidade Windows
- **Winetricks**: Componentes Windows
- **Flatpak**: Aplicativos isolados
- **Bottles**: Wine com interface
- **Flathub**: Repositório Flatpak

## 🗑️ Desinstalar

```bash
./windows-app-support.sh
# Escolha "Uninstall"
```

## 🐛 Reportar Bugs

Veja [BUGS.md](BUGS.md) para saber como reportar problemas.

Informações importantes:
- Distribuição Linux
- Versão do script
- Mensagem de erro completa
- Aplicativo testado

## 👥 Contribuir

Veja [CONTRIBUTING.md](CONTRIBUTING.md) para:
- Corrigir bugs
- Adicionar suporte para distros
- Melhorar traduções
- Submeter pull requests

## 🌍 Traduções

Ajude-nos a traduzir para mais idiomas!

Idiomas atuais:
- 🇵🇹 Português
- 🇪🇸 Espanhol
- 🇫🇷 Francês
- 🇩🇪 Alemão
- 🇬🇧 Inglês

## 📋 Troubleshooting

**Wine não encontrado:**
```bash
sudo apt install wine  # ou dnf/pacman/zypper
```

**Bottles não instala:**
```bash
flatpak install flathub com.usebottles.bottles
```

**Aplicativo não executa:**
1. Tente Bottles em vez de Wine
2. Instale componentes: `winetricks vcrun2019`
3. Veja [BUGS.md](BUGS.md)

## 💡 Dicas

```bash
# Ver histórico
cat ~/.local/share/windows-support.log

# Configurar Wine
winecfg

# Gerenciar componentes
winetricks
```

## 🤝 Comunidade

- 📝 [Issues](https://github.com/azzynovais/Universal-Windows-App-Support/issues)
- 💬 [Discussions](https://github.com/azzynovais/Universal-Windows-App-Support/discussions)
- 📢 [Contribuições](CONTRIBUTING.md)

## 📜 Licença

GPL v2 - Veja [LICENSE](LICENSE)

Software livre! 🎉

---

**Versão**: 2.0.0 | **Atualizado**: 9 de janeiro de 2026

*⭐ Star no GitHub para nos apoiar!*
