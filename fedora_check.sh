#!/bin/bash
# Fedora Compatibility Checker for RiceInstaller
# Verifica que el sistema sea compatible con el instalador

# Colors
CRE=$(tput setaf 1)    # Red
CYE=$(tput setaf 3)    # Yellow
CGR=$(tput setaf 2)    # Green
CBL=$(tput setaf 4)    # Blue
BLD=$(tput bold)       # Bold
CNC=$(tput sgr0)       # Reset colors

echo "${BLD}${CBL}=== Fedora Compatibility Checker ===${CNC}"
echo

# Check if running as root
if [ "$(id -u)" = 0 ]; then
    echo "${BLD}${CRE}❌ Error: This script should not be run as root${CNC}"
    exit 1
fi

# Check if we're on Fedora
if ! grep -q "Fedora" /etc/os-release 2>/dev/null; then
    echo "${BLD}${CRE}❌ Error: This script is designed for Fedora${CNC}"
    echo "Detected: $(grep PRETTY_NAME /etc/os-release | cut -d'"' -f2)"
    exit 1
fi

echo "${BLD}${CGR}✅ Fedora detected${CNC}"

# Check Fedora version
fedora_version=$(grep VERSION_ID /etc/os-release | cut -d'"' -f2)
echo "${BLD}${CBL}📋 Fedora version: ${fedora_version}${CNC}"

# Check if dnf is available
if ! command -v dnf >/dev/null 2>&1; then
    echo "${BLD}${CRE}❌ Error: dnf package manager not found${CNC}"
    exit 1
fi

echo "${BLD}${CGR}✅ dnf package manager available${CNC}"

# Check sudo access
if ! sudo -n true 2>/dev/null; then
    echo "${BLD}${CYE}⚠️  Warning: sudo access not configured${CNC}"
    echo "You may need to configure sudo access for your user"
    echo "Run: sudo usermod -aG wheel \$USER"
    echo "Then log out and log back in"
else
    echo "${BLD}${CGR}✅ sudo access configured${CNC}"
fi

# Check internet connection
if ! ping -q -c 1 -W 1 8.8.8.8 >/dev/null 2>&1; then
    echo "${BLD}${CRE}❌ Error: No internet connection detected${CNC}"
    exit 1
fi

echo "${BLD}${CGR}✅ Internet connection available${CNC}"

# Check available disk space (at least 2GB free)
free_space=$(df "$HOME" | awk 'NR==2 {print $4}')
free_space_gb=$((free_space / 1024 / 1024))

if [ "$free_space_gb" -lt 2 ]; then
    echo "${BLD}${CYE}⚠️  Warning: Low disk space (${free_space_gb}GB available)${CNC}"
    echo "Recommended: At least 2GB free space"
else
    echo "${BLD}${CGR}✅ Sufficient disk space (${free_space_gb}GB available)${CNC}"
fi

# Check if we're in HOME directory
if [ "$PWD" != "$HOME" ]; then
    echo "${BLD}${CYE}⚠️  Warning: Not in HOME directory${CNC}"
    echo "Current directory: $PWD"
    echo "Recommended: Run from $HOME"
else
    echo "${BLD}${CGR}✅ Running from HOME directory${CNC}"
fi

# Check for existing dotfiles
if [ -d "$HOME/dotfiles" ]; then
    echo "${BLD}${CYE}⚠️  Warning: Existing dotfiles directory found${CNC}"
    echo "The installer will backup existing configurations"
fi

echo
echo "${BLD}${CGR}=== System Check Complete ===${CNC}"
echo
echo "${BLD}${CBL}If all checks passed, you can run the RiceInstaller:${CNC}"
echo "chmod +x RiceInstaller"
echo "./RiceInstaller"
echo 