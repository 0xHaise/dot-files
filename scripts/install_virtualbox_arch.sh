#!/usr/bin/env bash
# ============================================================
# Script: install_virtualbox_arch.sh
# Descripción: Automatiza la instalación de VirtualBox y sus dependencias en Arch Linux.
# Autor: 0xHaise
# ============================================================

set -euo pipefail

# --- Funciones de utilidad ---
check_root() {
    if [[ "$EUID" -ne 0 ]]; then
        echo "[ERROR] Este script debe ejecutarse como root (usa sudo)." >&2
        exit 1
    fi
}

pkg_installed() {
    pacman -Qi "$1" &>/dev/null
}

install_pkg() {
    local pkg="$1"
    if pkg_installed "$pkg"; then
        echo "[INFO] $pkg ya está instalado."
    else
        echo "[INFO] Instalando $pkg..."
        pacman -S --noconfirm --needed "$pkg"
    fi
}

install_aur_pkg() {
    local pkg="$1"
    if command -v yay &>/dev/null; then
        if yay -Qi "$pkg" &>/dev/null; then
            echo "[INFO] $pkg ya está instalado."
        else
            echo "[INFO] Instalando $pkg desde AUR..."
            sudo -u "$SUDO_USER" yay -S --noconfirm "$pkg"
        fi
    else
        echo "[ADVERTENCIA] 'yay' no está instalado. Omitiendo paquete AUR: $pkg"
    fi
}

load_modules() {
    echo "[INFO] Cargando módulos del kernel..."
    modprobe vboxdrv
    modprobe vboxnetadp
    modprobe vboxnetflt
    modprobe vboxpci || true
}

# --- Inicio del script ---
check_root

echo "[INFO] Actualizando repositorios..."
pacman -Syu --noconfirm

echo "[INFO] Detectando kernel actual..."
KERNEL_VER=$(uname -r)
if [[ $KERNEL_VER == *"lts"* ]]; then
    HEADER_PKG="linux-lts-headers"
else
    HEADER_PKG="linux-headers"
fi
echo "[INFO] Kernel detectado: $KERNEL_VER"
echo "[INFO] Usando headers: $HEADER_PKG"

echo "[INFO] Instalando dependencias..."
install_pkg "$HEADER_PKG"
install_pkg "dkms"
install_pkg "virtualbox"
install_pkg "virtualbox-host-dkms"
install_pkg "virtualbox-guest-iso"

# --- Cargar módulos ---
load_modules

# --- Extensión opcional desde AUR ---
echo
read -p "¿Deseas instalar VirtualBox Extension Pack desde AUR? (s/N): " resp
if [[ "$resp" =~ ^[sS]$ ]]; then
    install_aur_pkg "virtualbox-ext-oracle"
fi

# --- Agregar usuario actual al grupo vboxusers ---
if [[ -n "${SUDO_USER:-}" ]]; then
    echo "[INFO] Añadiendo a ${SUDO_USER} al grupo vboxusers..."
    gpasswd -a "$SUDO_USER" vboxusers
else
    echo "[ADVERTENCIA] No se detectó usuario principal, omitiendo grupo."
fi

echo "[INFO] Instalación completada. Reinicia el sistema antes de usar VirtualBox."

