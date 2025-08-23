# RiceInstaller para Fedora

Este es el instalador adaptado de los dotfiles de gh0stzk para sistemas Fedora.

## 🚀 Características

- **Adaptado para Fedora**: Utiliza `dnf` en lugar de `pacman`
- **Repositorios COPR**: Usa repositorios COPR para paquetes adicionales
- **Gestión de paquetes**: Instalación automática de dependencias desde repositorios oficiales de Fedora
- **Backup automático**: Respaldos de configuraciones existentes
- **Instalación limpia**: Configuración completa del entorno de escritorio

## 📋 Requisitos

- Fedora 38 o superior
- Conexión a internet
- Usuario no root (el script se ejecuta como usuario normal)
- Permisos sudo configurados

## 🛠️ Instalación

1. **Clona el repositorio**:

   ```bash
   git clone https://github.com/gh0stzk/dotfiles.git
   cd dotfiles
   ```

2. **Ejecuta el instalador**:
   ```bash
   chmod +x RiceInstaller
   ./RiceInstaller
   ```

## 📦 Paquetes que se instalan

### Repositorios oficiales de Fedora:

- **Entorno de escritorio**: bspwm, sxhkd, polybar, picom
- **Terminales**: alacritty, kitty
- **Herramientas**: fzf, eza, bat, yazi, tmux
- **Multimedia**: mpd, ncmpcpp, mpv, playerctl
- **Utilidades**: dunst, rofi, feh, maim, xclip
- **Desarrollo**: git, neovim, geany, rustup
- **Fuentes**: google-noto-sans-fonts, google-noto-mono-fonts, liberation-fonts

### Repositorios COPR:

- **eww-git**: Widgets para polybar
- **fzf-tab-git**: Completado mejorado para zsh

## 🔧 Diferencias con la versión de Arch

### Gestión de paquetes:

- ✅ `dnf` en lugar de `pacman`
- ✅ Repositorios COPR en lugar de AUR
- ✅ Grupos de paquetes de Fedora

### Repositorios:

- ❌ No se usan repositorios personalizados de gh0stzk
- ❌ No se usa Chaotic-AUR
- ✅ Repositorios oficiales de Fedora + COPR

### Paquetes específicos:

- ✅ Fuentes de Google Noto en lugar de fuentes específicas de Arch
- ✅ `python3-gobject` en lugar de `python-gobject`
- ✅ `ImageMagick` en lugar de `imagemagick`

## 🎨 Características incluidas

### Entorno de escritorio:

- **bspwm**: Gestor de ventanas tiling
- **polybar**: Barra de estado personalizable
- **picom**: Compositor de ventanas
- **rofi**: Lanzador de aplicaciones

### Terminal y shell:

- **zsh**: Shell con autocompletado y sintaxis
- **alacritty/kitty**: Terminales rápidas
- **tmux**: Multiplexador de terminal

### Herramientas de desarrollo:

- **neovim**: Editor de texto avanzado
- **geany**: Editor ligero
- **git**: Control de versiones

### Multimedia:

- **mpd + ncmpcpp**: Servidor y cliente de música
- **mpv**: Reproductor de video
- **playerctl**: Control de reproductores

## 🔄 Backup automático

El script respalda automáticamente:

- Configuraciones existentes en `~/.config/`
- Archivos de configuración en `$HOME`
- Perfil de Firefox (opcional)
- Configuración de Neovim (opcional)

Los respaldos se guardan en `~/.RiceBackup/` con timestamp.

## 🚨 Notas importantes

1. **Reinicio requerido**: Después de la instalación, es necesario reiniciar el sistema
2. **Permisos sudo**: El script requiere permisos sudo para instalar paquetes
3. **Conexión a internet**: Necesaria para descargar paquetes y repositorios
4. **Espacio en disco**: Asegúrate de tener suficiente espacio libre

## 🐛 Solución de problemas

### Error de permisos:

```bash
sudo usermod -aG wheel $USER
# Luego cerrar sesión y volver a iniciar
```

### Paquetes no encontrados:

```bash
sudo dnf update
sudo dnf search <nombre-del-paquete>
```

### Repositorios COPR:

```bash
sudo dnf install -y copr-cli
sudo dnf copr enable -y atim/eww-git
```

## 📝 Logs

El script genera logs detallados en:

- `$HOME/RiceError.log`: Errores durante la instalación

## 🤝 Contribuciones

Si encuentras problemas específicos de Fedora, por favor:

1. Revisa los logs de error
2. Verifica que estés usando una versión compatible de Fedora
3. Abre un issue en el repositorio original

## 📄 Licencia

Este proyecto está bajo la licencia GPL-3.0. Ver el archivo LICENSE para más detalles.

---

**Nota**: Esta es una adaptación no oficial para Fedora del instalador original de Arch Linux. Para soporte oficial, consulta el repositorio original de gh0stzk.
