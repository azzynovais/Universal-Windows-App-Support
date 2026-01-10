#!/usr/bin/env bash
set -e

# ===== Detect distro & language =====
if [ -f /etc/os-release ]; then
    source /etc/os-release
    distro=$ID
else
    echo "[ERROR] Could not detect your Linux distribution."
    exit 1
fi

# Normalize distro names
case "$distro" in
    rhel|centos|almalinux|rocky) distro="fedora";;
    neon|kubuntu|xubuntu|lubuntu|ubuntu-budgie) distro="ubuntu";;
    endeavouros) distro="arch";;
esac

lang="${LANG%%_*}"

# ===== Multi-language strings =====
translate() {
    case "$lang" in
        pt)
            t_title="Suporte a Aplicativos Windows"
            t_question="O que deseja fazer?"
            t_install="Instalar / Integrar"
            t_uninstall="Desinstalar"
            t_nothing="Nada"
            t_installing="[INFO] Instalando Wine, Flatpak, Bottles e criando launcher/menu..."
            t_installed="[INFO] Instalação concluída!"
            t_uninstalling="[INFO] Desinstalando Wine, Flatpak, Bottles e removendo launcher/menu..."
            t_uninstalled="[INFO] Desinstalação concluída!"
            t_canceled="Nenhuma ação realizada."
            t_drag_msg="Arraste um programa (.exe/.msi) para instalar:"
            t_bottles="Instalar via Bottles"
            t_wine="Instalar via Wine"
            t_cancel="Cancelar"
            t_success="Pronto! Suporte a aplicativos Windows está configurado."
            t_flatpak_info="Configurando Flatpak e Flathub..."
            ;;
        es)
            t_title="Soporte de Aplicaciones Windows"
            t_question="¿Qué desea hacer?"
            t_install="Instalar / Integrar"
            t_uninstall="Desinstalar"
            t_nothing="Nada"
            t_installing="[INFO] Instalando Wine, Flatpak, Bottles y creando launcher/menu..."
            t_installed="[INFO] ¡Instalación completada!"
            t_uninstalling="[INFO] Desinstalando Wine, Flatpak, Bottles y eliminando launcher/menu..."
            t_uninstalled="[INFO] ¡Desinstalación completada!"
            t_canceled="Ninguna acción realizada."
            t_drag_msg="Arrastre un programa (.exe/.msi) para instalar:"
            t_bottles="Instalar con Bottles"
            t_wine="Instalar con Wine"
            t_cancel="Cancelar"
            t_success="¡Listo! El soporte de aplicaciones Windows está configurado."
            t_flatpak_info="Configurando Flatpak y Flathub..."
            ;;
        fr)
            t_title="Support des Applications Windows"
            t_question="Que voulez-vous faire ?"
            t_install="Installer / Intégrer"
            t_uninstall="Désinstaller"
            t_nothing="Rien"
            t_installing="[INFO] Installation de Wine, Flatpak, Bottles et création du launcher/menu..."
            t_installed="[INFO] Installation terminée !"
            t_uninstalling="[INFO] Désinstallation de Wine, Flatpak, Bottles et suppression du launcher/menu..."
            t_uninstalled="[INFO] Désinstallation terminée !"
            t_canceled="Aucune action effectuée."
            t_drag_msg="Glissez un programme (.exe/.msi) pour installer:"
            t_bottles="Installer via Bottles"
            t_wine="Installer via Wine"
            t_cancel="Annuler"
            t_success="Fait ! Le support des applications Windows est configuré."
            t_flatpak_info="Configuration de Flatpak et Flathub..."
            ;;
        de)
            t_title="Windows-Anwendungsunterstützung"
            t_question="Was möchten Sie tun?"
            t_install="Installieren / Integrieren"
            t_uninstall="Deinstallieren"
            t_nothing="Nichts"
            t_installing="[INFO] Installiere Wine, Flatpak, Bottles und erstelle Launcher/Menu..."
            t_installed="[INFO] Installation abgeschlossen!"
            t_uninstalling="[INFO] Deinstalliere Wine, Flatpak, Bottles und entferne Launcher/Menu..."
            t_uninstalled="[INFO] Deinstallation abgeschlossen!"
            t_canceled="Keine Aktion durchgeführt."
            t_drag_msg="Ziehen Sie ein Programm (.exe/.msi) hierher, um es zu installieren:"
            t_bottles="Installieren mit Bottles"
            t_wine="Installieren mit Wine"
            t_cancel="Abbrechen"
            t_success="Fertig! Windows-Anwendungsunterstützung ist konfiguriert."
            t_flatpak_info="Konfiguriere Flatpak und Flathub..."
            ;;
        *)
            t_title="Windows Applications Support"
            t_question="What do you want to do?"
            t_install="Install & Integrate"
            t_uninstall="Uninstall"
            t_nothing="Do nothing"
            t_installing="[INFO] Installing Wine, Flatpak, Bottles and creating launcher/menu..."
            t_installed="[INFO] Installation completed successfully!"
            t_uninstalling="[INFO] Uninstalling Wine, Flatpak, Bottles and removing launcher/menu..."
            t_uninstalled="[INFO] Uninstallation completed!"
            t_canceled="No action performed."
            t_drag_msg="Drag a program (.exe/.msi) to install:"
            t_bottles="Install via Bottles"
            t_wine="Install via Wine"
            t_cancel="Cancel"
            t_success="Done! Windows app support is ready."
            t_flatpak_info="Installing Flatpak and Flathub repository..."
            ;;
    esac
}
translate

# ===== Install packages by distro =====
install_packages() {
    echo "[INFO] Detecting package manager..."

    case "$distro" in
        ubuntu|linuxmint|debian|elementary|pop)
            echo "[INFO] Debian/Ubuntu-based system detected"
            sudo apt update
            sudo apt install -y wine wine32 wine64 winetricks flatpak kdialog icoutils wget desktop-file-utils cabextract
            ;;
        fedora|rhel|centos|almalinux|rocky)
            echo "[INFO] RedHat-based system detected"
            sudo dnf install -y wine winetricks flatpak kdialog icoutils desktop-file-utils cabextract glibc-devel.i686
            ;;
        opensuse*|suse)
            echo "[INFO] openSUSE detected"
            sudo zypper --non-interactive install wine winetricks wine-mono wine-gecko flatpak kdialog icoutils desktop-file-utils cabextract
            ;;
        arch|manjaro|endeavouros|garuda)
            echo "[INFO] Arch-based system detected"
            sudo pacman -Sy --noconfirm wine winetricks flatpak kdialog icoutils desktop-file-utils cabextract
            ;;
        gentoo)
            echo "[INFO] Gentoo detected"
            sudo emerge --ask=n app-emulation/wine app-portage/gentoolkit flatpak kde-apps/kdialog
            ;;
        void)
            echo "[INFO] Void Linux detected"
            sudo xbps-install -S -u xbps || true
            sudo xbps-install -y wine winetricks flatpak icoutils desktop-file-utils cabextract
            ;;
        nixos)
            echo "[INFO] NixOS detected - using Flake or nix-shell"
            echo "[WARNING] Please use NixOS flakes or nix-shell for Wine environment"
            ;;
        *)
            echo "[WARNING] Unknown Linux distribution: $distro"
            echo "[INFO] Attempting generic installation..."
            if command -v apt &>/dev/null; then
                sudo apt install -y wine winetricks flatpak kdialog icoutils desktop-file-utils cabextract
            elif command -v dnf &>/dev/null; then
                sudo dnf install -y wine winetricks flatpak kdialog icoutils desktop-file-utils cabextract
            elif command -v pacman &>/dev/null; then
                sudo pacman -Sy --noconfirm wine winetricks flatpak kdialog icoutils desktop-file-utils cabextract
            else
                echo "[ERROR] Could not find a supported package manager."
                echo "[INFO] Please install wine, winetricks, flatpak, kdialog manually."
                exit 1
            fi
            ;;
    esac
}

# ===== Setup Flatpak and Flathub =====
setup_flatpak_flathub() {
    echo "[INFO] $t_flatpak_info"

    # Add Flathub remote
    if ! flatpak remote-list | grep -q flathub; then
        echo "[INFO] Adding Flathub repository..."
        flatpak remote-add --if-not-exists --user flathub https://flathub.org/repo/flathub.flatpakrepo
    fi

    # Install Bottles from Flathub
    echo "[INFO] Installing Bottles..."
    flatpak install --user -y flathub com.usebottles.bottles 2>/dev/null || \
    flatpak install --system -y flathub com.usebottles.bottles 2>/dev/null || \
    echo "[WARNING] Could not install Bottles from Flathub"
}

# ===== Create drag & drop launcher and .desktop =====
create_drag_drop_launcher() {
    mkdir -p ~/.local/bin ~/.local/share/windows-support-icons ~/.local/share/applications
    LOG_FILE="$HOME/.local/share/windows-support.log"
    LAUNCHER_PATH="$HOME/.local/bin/windows-support-launcher"

    cat > "$LAUNCHER_PATH" <<'EOF'
#!/usr/bin/env bash
set -e
LOG_FILE="$HOME/.local/share/windows-support.log"
ICON_DIR="$HOME/.local/share/windows-support-icons"
mkdir -p "$ICON_DIR"

# Multi-language
lang="${LANG%%_*}"
case "$lang" in
    pt) t_title="Suporte a Aplicativos Windows"; t_drag_msg="Arraste um programa (.exe/.msi) para instalar:"; t_bottles="Instalar via Bottles"; t_wine="Instalar via Wine"; t_cancel="Cancelar";;
    es) t_title="Soporte de Aplicaciones Windows"; t_drag_msg="Arrastre un programa (.exe/.msi) para instalar:"; t_bottles="Instalar con Bottles"; t_wine="Instalar con Wine"; t_cancel="Cancelar";;
    fr) t_title="Support des Applications Windows"; t_drag_msg="Glissez un programme (.exe/.msi) pour installer:"; t_bottles="Installer via Bottles"; t_wine="Installer via Wine"; t_cancel="Annuler";;
    de) t_title="Windows-Anwendungsunterstützung"; t_drag_msg="Ziehen Sie ein Programm (.exe/.msi) hierher, um es zu installieren:"; t_bottles="Installieren mit Bottles"; t_wine="Installieren mit Wine"; t_cancel="Abbrechen";;
    *) t_title="Windows Applications Support"; t_drag_msg="Drag a program (.exe/.msi) to install:"; t_bottles="Install via Bottles"; t_wine="Install via Wine"; t_cancel="Cancel";;
esac

EXE_FILE=$(kdialog --title "$t_title" --getopenfilename "$HOME" "*.exe *.msi" "$t_drag_msg")
[ -z "$EXE_FILE" ] && exit 0

# Extract icon
ICON_PATH="$ICON_DIR/$(basename "$EXE_FILE" | sed 's/\..*$//').png"
if command -v wrestool &>/dev/null && command -v icotool &>/dev/null; then
    wrestool -x -t14 "$EXE_FILE" | icotool -x -o "$ICON_PATH" 2>/dev/null || ICON_PATH=""
fi
[[ ! -f "$ICON_PATH" ]] && ICON_PATH="/usr/share/icons/hicolor/48x48/apps/wine.png"

# Choose installation method
METHOD=$(kdialog --title "$t_title" --menu "$t_drag_msg" \
    1 "$t_bottles" \
    2 "$t_wine" \
    3 "$t_cancel" \
    --geometry 400x250
)

timestamp=$(date +"%Y-%m-%d %H:%M:%S")
case "$METHOD" in
    1)
        echo "[$timestamp] Installed via Bottles: $EXE_FILE" >> "$LOG_FILE"
        flatpak run com.usebottles.bottles "$EXE_FILE"
        ;;
    2)
        echo "[$timestamp] Installed via Wine: $EXE_FILE" >> "$LOG_FILE"
        wine "$EXE_FILE"
        ;;
    3|""|*)
        echo "[$timestamp] Canceled: $EXE_FILE" >> "$LOG_FILE"
        kdialog --title "$t_title" --msgbox "$t_cancel"
        exit 0
        ;;
esac
EOF

    chmod +x "$LAUNCHER_PATH"

    # ===== Create .desktop and update desktop database =====
    DESKTOP_FILE="$HOME/.local/share/applications/windows-support.desktop"
    cat > "$DESKTOP_FILE" <<EOF
[Desktop Entry]
Name=Windows Applications Support
Name[pt_BR]=Suporte a Aplicativos Windows
Comment=Install and run Windows programs
Comment[pt_BR]=Instalar e executar programas do Windows
Exec=$LAUNCHER_PATH
Icon=wine
Terminal=false
Type=Application
Categories=System;Utility;
MimeType=application/x-ms-dos-executable;application/x-msi;
EOF

    # Update desktop database
    update-desktop-database ~/.local/share/applications || true
}

uninstall_all() {
    flatpak uninstall -y com.usebottles.bottles || true
    rm -f ~/.local/bin/windows-support-launcher
    rm -f ~/.local/share/applications/windows-support.desktop
    update-desktop-database ~/.local/share/applications || true
}

# ===== Main menu =====
MAIN_CHOICE=$(kdialog --title "$t_title" --menu "$t_question" \
    1 "$t_install" \
    2 "$t_uninstall" \
    3 "$t_nothing" \
    --geometry 400x250
)

case "$MAIN_CHOICE" in
    1)
        echo "$t_installing"
        install_packages
        setup_flatpak_flathub
        create_drag_drop_launcher
        echo "$t_installed"
        kdialog --title "$t_title" --msgbox "$t_success" 2>/dev/null || true
        ;;
    2)
        echo "$t_uninstalling"
        uninstall_all
        echo "$t_uninstalled"
        ;;
    3|""|*)
        echo "$t_canceled"
        exit 0
        ;;
esac
