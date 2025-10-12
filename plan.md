# Omarchy Debloat Plan & Progress

## 1. Project Goal

The primary goal is to "debloat" the Omarchy installation process to create a "lighter process, not a lighter project." This means customizing the installed software and configurations for personal use, while keeping the core Omarchy installation framework and its scripts intact.

## 2. Requirements & Constraints

### Initial Requirements
- **Personal Use Focus**: Installation exclusively for single-user, known hardware setup
- **Non-Interactive**: Straightforward installation, not meant to be modified on the fly
- **Linux as Code**: Having Arch Linux configuration managed as code in repository

### Technical Requirements
- **Shell Compatibility**: Always check zsh compatibility, bash calls, bash scripts
- **Dotfiles Integration**: Detach `.config/omarchy` directory and bind to `~/dotfiles` repository
- **Configuration Management**: Use same pattern as Omarchy but inside `~/dotfiles` directory
- **Neovim Setup**: Nvim should point to dotfiles, themes stored in dotfiles, LazyVim integration
- **Hyprland Configuration**: Detailed handling of Hyprland configs, binds, centralized configs
- **Graphics Setup**: NVIDIA+AMD hybrid (offload to NVIDIA, keep AMD integrated), no hybrid graphics intended
- **Kernel Preference**: LTS kernel preferred (`linux-lts`), but scripts should verify compatibility
- **Hardware Constraints**: Apple support can be disabled to lower impact
- **Chromium**: Will not address omarchy-chromium detachment (future work)

### Structural Requirements
- **System Integrity**: Login, passwords, users management, boot loaders, firewalls, timezones must remain functional
- **Functionality Verification**: Always check functionality - this is not skippable
- **No Critical Removals**: Never remove packages that break other scripts at this stage
- **Framework Preservation**: Core Omarchy system scripts remain untouched

## 3. Methodology

- **File-by-File Analysis**: Comprehensive analysis of each script for purpose, dependencies, and functionality
- **Step-by-Step Validation**: No changes without explicit approval
- **Dependency Tracking**: Identify and preserve critical dependencies
- **Modular Commits**: Atomic, descriptive commits for tracking progress

## 4. Progress Summary

### Stage 1: `install/helpers/` ✅
- **Status**: Analysis complete
- **Decision**: No changes - core utilities preserved

### Stage 2: `install/preflight/` ✅  
- **Status**: Analysis complete
- **Decision**: No changes - system preparation scripts preserved

### Stage 3: `install/packaging/` ✅
- **Status**: Analysis complete
- **Changes**: Removed non-critical `xournalpp` package from `omarchy-base.packages`
- **Dependencies Preserved**: `xmlstarlet` and `python-terminaltexteffects` kept due to script dependencies

### Stage 4: `install/config/` ✅
- **Status**: COMPLETE - Comprehensive debloat and dotfiles migration achieved
- **Key Achievement**: Full detachment from `~/.config/omarchy` dependencies while maintaining functionality
- **Architecture Change**: Complete transition to dotfiles-based configuration management
- **Files Relocated**: All user configurations now managed through `~/dotfiles/` structure
- **Package Reduction**: Hardware-specific and unused packages removed
- **Scripts Optimized**: All installation scripts updated for personal use requirements

#### Major Debloat Achievements ✅

**Hardware Support Removed (6 files deleted):**
- `install/config/sudoless-asdcontrol.sh` - Apple display brightness control
- `install/config/hardware/fix-apple-t2.sh` - T2 MacBook kernel modules and firmware
- `install/config/hardware/fix-apple-spi-keyboard.sh` - Apple SPI keyboard drivers  
- `install/config/hardware/fix-apple-bcm43xx.sh` - Apple WiFi firmware
- `install/config/hardware/fix-fkeys.sh` - Apple F-key behavior modification
- `install/config/hardware/intel.sh` - Intel graphics acceleration drivers

**Package Dependencies Reduced:**
- Removed `omarchy-lazyvim` from `install/omarchy-base.packages` (109 lines ← 110 lines)
- **Rationale**: LazyVim now configured through dotfiles approach, eliminating package dependency

**Impact**: Significant reduction in installation footprint for Apple and Intel hardware support

#### Complete Dotfiles Integration ✅

**Branding System Migration:**
- `install/config/branding.sh`: Migrated from `~/.config/omarchy/branding/` to `~/dotfiles/branding/`
- `bin/omarchy-menu`: Updated Style menu branding file references
- `config/fastfetch/config.jsonc`: Updated logo source path to dotfiles
- `bin/omarchy-cmd-screensaver`: Updated screensaver text source to dotfiles
- **Result**: Complete elimination of omarchy branding dependencies

**LazyVim/Neovim Configuration:**
- `install/config/lazyvim.sh`: Complete rewrite for dotfiles-based configuration
- `install/packaging/lazyvim.sh`: Disabled omarchy package dependency
- **Architecture**: Creates symlink from `~/dotfiles/nvim` to `~/.config/nvim`
- **Theme Integration**: Automatic theme switching through `~/dotfiles/themes/current/theme/neovim.lua`
- **Result**: Fully detached Neovim configuration managed in dotfiles

#### Theme System Migration ✅ (Previous Achievement)
- **Complete Detachment**: Migrated entire theme system from `~/.config/omarchy/themes` to `~/dotfiles/themes`
- **Scripts Updated**: All 12 `bin/omarchy-theme-*` scripts migrated to use dotfiles paths
- **Configuration Updates**: CSS imports, hypr configs, waybar, swayosd all updated for dotfiles structure
- **Theme Switching**: Maintains same functionality with `omarchy-theme-set`, `omarchy-theme-next`, menu system
- **Current Theme System**: `~/dotfiles/themes/current/` now manages active theme symlinks
- **Kanagawa Themes**: Official kanagawa-dark (wave) and kanagawa-light (lotus) variants implemented
- **Bug Fix**: Corrected kanagawa theme name typo

#### Final Architecture ✅
**Complete Path Structure:**
1. **Project Source** (`config/`): Consolidated configuration source in repository
2. **Installation Target** (`~/.local/share/omarchy/config/`): Where configs get deployed  
3. **User Destination** (`~/.config/`): Where user's actual configs live
4. **Dotfiles Management** (`~/dotfiles/`): Complete user configuration system
   - `~/dotfiles/themes/` - Theme management with kanagawa variants
   - `~/dotfiles/branding/` - System branding and ASCII art
   - `~/dotfiles/nvim/` - Neovim LazyVim configuration

**Scripts Successfully Updated (Total: 18 files):**
- **Configuration Scripts (6)**: `branding.sh`, `lazyvim.sh`, `theme.sh`, `config.sh`, `xcompose.sh`, `gpg.sh`
- **Theme Management (12)**: All `bin/omarchy-theme-*` scripts use dotfiles paths
- **Integration Scripts (4)**: Menu system, fastfetch, screensaver, packaging
- **CSS Configuration (4)**: Walker themes, waybar, swayosd, hyprlock imports updated

## 5. Current Status

**Completed**: 
- ✅ **Stage 1**: `install/helpers/` - Core utilities analysis (no changes needed)
- ✅ **Stage 2**: `install/preflight/` - System preparation scripts analysis (no changes needed)  
- ✅ **Stage 3**: `install/packaging/` - Package optimization (`xournalpp` removed)
- ✅ **Stage 4**: `install/config/` - **MAJOR DEBLOAT COMPLETED**
  - Hardware support removal (Apple + Intel): 6 files deleted
  - Package dependencies reduced: `omarchy-lazyvim` removed  
  - Complete dotfiles integration: branding + LazyVim + themes
  - 18 scripts updated for dotfiles architecture
  - Full detachment from `~/.config/omarchy` achieved

**Ready for Atomic Commits**: Stage 4 changes validated and ready for conventional commits

**Next**: 
- ✅ **Stage 5**: `install/login/` - Boot loaders, Plymouth, authentication analysis
- ✅ **Stage 6**: `install/post-install/` - Final system setup and cleanup analysis
- ✅ **Stage 7**: `install/first-run/` - First-run experience optimization

**Final Goal**: Complete debloat achieving "lighter process, not lighter project" while maintaining all system integrity requirements
