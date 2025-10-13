# Moonarch

**Moonarch - omarchy debloat **

Custom fork of .

Moonarch is a custom fork from [Omarchy](https://github.com/basecamp/omarchy), heavily tailored for my own personal use, while maintaining it core framework and installation methodology.
I've eliminated several unnecessary hardware support, added AMD and LTS support, refactor themes and config handling, and more.

### **Motivations**

- I always wanted to automate the installation but as a self learner I have gaps regarding default practices, etc, hence I ended up patching on the fly.
- I have some poor and unfinished arch linux automations, but reviewing how omarchy works it end up being an incredible starting point since it follows the very minimal standard archlinux base installation, with a nice and readable source code to edit. Its very hard to break things.
- Omarchy includes a fully functional wayland/hyprland support that works NVIDIA multi head out of the box (fuck you nvidia). I wouldn't take the risk of migrate from X11 to wayland while actively working in job-projects.

---

## 📊 **Major Differences from Omarchy**

### **🔧 Hardware Support Changes**
| Component | Omarchy | Moonarch | Rationale |
|-----------|---------|----------|-----------|
| **Apple Hardware** | ✅ Full T2/SPI/BCM support | ❌ **REMOVED** | Personal use - AMD+NVIDIA setup |
| **Intel Graphics** | ✅ VA-API drivers | ❌ **REMOVED** | AMD integrated + NVIDIA discrete |
| **AMD F13 Audio** | ✅ Specific audio fixes | ❌ **REMOVED** | Non-target hardware |
| **NVIDIA Support** | ✅ Standard | ✅ **ENHANCED** | Optimized for hybrid setup |
| **Printing/Discovery** | ✅ CUPS + Avahi | ✅ **PRESERVED** | Essential functionality |

### **📦 Package Optimization**
| Package | Status | Change Reason |
|---------|--------|---------------|
| `omarchy-lazyvim` | **REMOVED** | Now managed via dotfiles |
| `libva-intel-driver` | **REMOVED** | Intel hardware eliminated |
| `xournalpp` | **REMOVED** | Non-essential drawing app |
| Development tools (cargo, clang, llvm) | **PRESERVED** | Essential for development |
| Font packages (Noto, Nerd fonts) | **PRESERVED** | Full typography support |

### **🎨 Configuration Architecture**
| System | Omarchy Path | Moonarch Path | Architecture |
|--------|--------------|---------------|-------------|
| **Themes** | `~/.config/omarchy/themes/` | `~/dotfiles/themes/` | Complete dotfiles migration |
| **Branding** | `~/.config/omarchy/branding/` | `~/dotfiles/branding/` | Dotfiles-managed ASCII art |
| **Neovim** | Package-based (`omarchy-lazyvim`) | `~/dotfiles/nvim/` → `~/.config/nvim/` | Symlink architecture |
| **Theme Current** | `~/.config/omarchy/themes/current/` | `~/dotfiles/themes/current/` | Preserved functionality |

---

## 🏗 **Detailed File Structure**

### **Critical: `install/config/` Directory Analysis**

The `install/config/` directory is the **heart of the system configuration**. Here's the complete structure with detailed explanations:


---

## 🎨 **Dotfiles**

Implements a comprehensive dotfiles-first approach that **completely detaches** from Omarchy's `~/.config/omarchy` dependencies.

**Why?:** 
- Config files are located and splitted in several files that doesn't match with my brain.
- I dont like to have a modded app like omarchy-chromium.

#### **Dotfiles Structure**
```bash
~/dotfiles/
├── 📁 themes/                        # 🎨 THEME MANAGEMENT SYSTEM
│   ├── 📁 current/                   # Active theme symlinks
│   │   ├── theme -> ../kanagawa/     # Current theme pointer
│   │   └── background -> ../kanagawa/backgrounds/1-kanagawa.jpg
│   ├── 📁 kanagawa/                  # Kanagawa dark theme (wave variant)
│   │   ├── 📁 backgrounds/           # Theme wallpapers
│   │   ├── alacritty.toml           # Terminal colors
│   │   ├── neovim.lua               # 📝 Neovim theme integration
│   │   ├── waybar.css               # Status bar styling
│   │   ├── walker.css               # App launcher theme
│   │   ├── hyprlock.conf            # Lock screen theme
│   │   ├── mako.ini                 # Notification styling
│   │   ├── btop.theme               # System monitor theme
│   │   ├── chromium.theme           # Browser theme
│   │   └── [other app themes]
│   └── 📁 kanagawa-light/            # Kanagawa light theme (lotus variant)
├── 📁 branding/                      # 🎭 SYSTEM BRANDING
│   ├── about.txt                    # System information display
│   ├── screensaver.txt              # ASCII art screensaver
│   ├── icon.txt                     # System icon (ASCII)
│   └── logo.txt                     # System logo (ASCII)
└── 📁 nvim/                         # 📝 NEOVIM CONFIGURATION
    ├── lazyvim.json                 # LazyVim configuration
    ├── 📁 lua/plugins/              # Custom plugins
    └── 📁 plugin/after/             # Plugin overrides
```

#### **Symlink Architecture**
The dotfiles system uses intelligent symlinking to maintain theme coherence:

```bash
# Theme System Links
~/.config/nvim -> ~/dotfiles/nvim/                    # Neovim config
~/dotfiles/themes/current/theme -> ~/dotfiles/themes/kanagawa/  # Current theme
~/dotfiles/themes/current/background -> ~/dotfiles/themes/kanagawa/backgrounds/1-kanagawa.jpg

# Application Theme Links  
~/.config/nvim/lua/plugins/theme.lua -> ~/dotfiles/themes/current/theme/neovim.lua
~/.config/btop/themes/current.theme -> ~/dotfiles/themes/current/theme/btop.theme  
~/.config/mako/config -> ~/dotfiles/themes/current/theme/mako.ini
```

### **Theme Management Scripts (Updated)**
All 12 `bin/omarchy-theme-*` scripts have been updated for dotfiles architecture:

```bash
# Core Theme Operations
omarchy-theme-set <theme>           # Switch to specific theme
omarchy-theme-next                  # Cycle through available themes  
omarchy-theme-list                  # Show available themes
omarchy-theme-current              # Display active theme

# Theme Management
omarchy-theme-install <repo>       # Install theme from Git repository
omarchy-theme-remove <theme>       # Remove installed theme
omarchy-theme-update               # Update all themes from Git

# Application-Specific Theming
omarchy-theme-set-browser          # Apply browser theme
omarchy-theme-set-gnome           # Apply GNOME theme  
omarchy-theme-set-vscode          # Apply VS Code theme
omarchy-theme-bg-next             # Cycle background images
```

**Critical Path Changes:**
- `THEMES_DIR`: `~/.config/omarchy/themes` → `~/dotfiles/themes`
- `CURRENT_THEME_DIR`: `~/.config/omarchy/themes/current` → `~/dotfiles/themes/current`
- All theme operations now target dotfiles structure

---

## ⚙️ **Installation Process Differences**

### **Installation Stages Comparison**
| Stage | Omarchy | Moonarch Status | Key Changes |
|-------|---------|----------------|-------------|
| **1. Helpers** | Core utilities | ✅ **UNCHANGED** | Essential framework preserved |
| **2. Preflight** | System preparation | ✅ **UNCHANGED** | Installation integrity critical |  
| **3. Packaging** | Package installation | 🔄 **OPTIMIZED** | 3 packages removed, webapps preserved |
| **4. Config** | System configuration | 🔥 **MAJOR DEBLOAT** | 6 hardware files removed, dotfiles integration |
| **5. Login** | Boot & authentication | ✅ **UNCHANGED** | System integrity critical |
| **6. Post-install** | Final setup | 🔄 **CLEANED** | Apple T2 repository removed |
| **7. First-run** | Initial experience | ✅ **UNCHANGED** | Optimal for personal use |


TODO: THIS HAVE TO BE COMPARED WITH THE REAL OMARCHY MASTER BRANCH.

### **Package Installation Changes**
```bash
# install/omarchy-base.packages (109 packages)
# REMOVED:
- omarchy-lazyvim                    # Now dotfiles-managed
- xournalpp                         # Non-essential drawing app

# PRESERVED (as requested):
+ slack-desktop                     # Personal productivity  
+ cups, cups-browsed, cups-filters  # Complete printing stack
+ cargo, clang, llvm               # Development toolchain
+ all Noto fonts + Nerd fonts      # Complete typography

# install/omarchy-other.packages (40 packages)  
# REMOVED:
- libva-intel-driver               # Intel hardware support
```

---

## 🚀 **Installation Instructions**

### **Prerequisites**
- **Target System**: Arch Linux base installation
- **Hardware**: AMD + NVIDIA support, but full discrete graphics is recommended  
- **User Setup**: Single-user environment with sudo access
- **Dotfiles**: `~/dotfiles/` directory will be created/managed by installer

### **Quick Install**
```bash
# Bootstrap installation
curl -fsSL https://raw.githubusercontent.com/aldochaconc/moonarch/main/boot.sh | bash

# Or clone and install locally
git clone https://github.com/aldochaconc/moonarch.git ~/.local/share/omarchy
~/.local/share/omarchy/install.sh
```

### **Custom Installation Options**
```bash
# Use specific branch if you want to
OMARCHY_REF="development" bash boot.sh

# Use custom fork  
OMARCHY_REPO="yourusername/moonarch" bash boot.sh
```

### **Post-Installation Setup**

#### **1. Dotfiles Configuration**
```bash
# The installer automatically creates:
~/dotfiles/themes/         # Theme management system
~/dotfiles/branding/       # System branding files
~/dotfiles/nvim/          # Neovim configuration

# Verify theme system:
omarchy-theme-current      # Should show: kanagawa
omarchy-theme-list         # Should show available themes
```

#### **2. Theme Customization**
```bash
# Switch themes
omarchy-theme-set kanagawa-light    # Light variant
omarchy-theme-set kanagawa          # Dark variant (default)

# Cycle backgrounds  
omarchy-theme-bg-next              # Next wallpaper in current theme

# Install additional themes
omarchy-theme-install https://github.com/user/theme-repo
```

#### **3. Neovim Setup Verification**
```bash
# Verify Neovim dotfiles integration
ls -la ~/.config/nvim          # Should be symlink to ~/dotfiles/nvim
nvim                          # LazyVim should load with theme integration
```

---

## 🔍 **Technical Specs**

TODO: REVIEW THIS AI GENERATED BULLSHIT

### **Critical Configuration Scripts**

#### **`install/config/theme.sh`** - Dotfiles Theme Integration
```bash
# Creates dotfiles theme structure
mkdir -p ~/dotfiles/themes/current

# Sets initial theme (kanagawa in dotfiles)  
ln -snf ~/dotfiles/themes/kanagawa ~/dotfiles/themes/current/theme
ln -snf ~/dotfiles/themes/current/theme/backgrounds/1-kanagawa.jpg ~/dotfiles/themes/current/background

# Links applications to current theme
ln -snf ~/dotfiles/themes/current/theme/neovim.lua ~/.config/nvim/lua/plugins/theme.lua
ln -snf ~/dotfiles/themes/current/theme/btop.theme ~/.config/btop/themes/current.theme
ln -snf ~/dotfiles/themes/current/theme/mako.ini ~/.config/mako/config
```

#### **`install/config/branding.sh`** - Dotfiles Branding Setup
```bash
# Creates dotfiles branding structure
mkdir -p ~/dotfiles/branding

# Copies branding files to dotfiles
cp ~/.local/share/omarchy/icon.txt ~/dotfiles/branding/
cp ~/.local/share/omarchy/logo.txt ~/dotfiles/branding/

# Applications reference dotfiles branding
# - fastfetch config points to ~/dotfiles/branding/about.txt
# - screensaver uses ~/dotfiles/branding/screensaver.txt  
# - menu system references ~/dotfiles/branding/
```

#### **`install/config/lazyvim.sh`** - Dotfiles Neovim Integration  
```bash
# Creates dotfiles Neovim structure
mkdir -p ~/dotfiles/nvim

# Symlinks dotfiles to active config
ln -snf ~/dotfiles/nvim ~/.config/nvim

# Result: Complete Neovim configuration in dotfiles
# - Theme integration via ~/dotfiles/themes/current/theme/neovim.lua
# - LazyVim configuration in ~/dotfiles/nvim/
# - No omarchy-lazyvim package dependency
```

### **Plymouth Boot Splash Customization**
- **Logo**: Custom branding in `default/plymouth/logo.png`
- **Background**: Solid black background (`omarchy.script` lines 3-4)
- **Theme**: Seamless boot experience with personalized assets

### **Web Applications System**
The webapp installation system creates desktop applications for web services:
```bash
# Installed via install/packaging/webapps.sh:
Discord, GitHub, Google Calendar, Google Drive, Gmail,
Google Translate, Reddit, Spotify, WhatsApp, YouTube

# Each creates: ~/.local/share/applications/[AppName].desktop  
# Launches via: omarchy-launch-webapp (browser app mode)
# Dependencies: omarchy-chromium package (preserved)
```

---

## 🤝 **Credits & License**

Moonarch is completely based on the [Omarchy Project](https://github.com/basecamp/omarchy) by Basecamp.

**Original Omarchy**: Full-featured Arch Linux installation framework  
**Moonarch Fork**: Personal-use optimization with dotfiles integration

This project maintains the same MIT license as the original Omarchy project.

---

## 🚀 **Quick Start Summary**

1. **Install**: `curl -fsSL https://raw.githubusercontent.com/aldochaconc/moonarch/main/boot.sh | bash`
2. **Verify Themes**: `omarchy-theme-current` (should show kanagawa)
3. **Check Dotfiles**: `ls ~/dotfiles/` (themes, branding, nvim directories)
4. **Customize**: Use `omarchy-theme-*` commands and edit `~/dotfiles/`

**Result**: Fully functional Arch Linux system with dotfiles-managed configuration, optimized for AMD+NVIDIA hardware, with streamlined personal-use focus.