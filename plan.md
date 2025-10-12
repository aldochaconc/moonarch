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

### Stage 4: `install/config/` 🚧
- **Status**: In progress - Major consolidation completed
- **Key Achievement**: Consolidated all user/system configurations from `default/` to `config/`
- **Architecture Change**: Single source of truth for configurations in `config/` directory
- **Files Relocated**: `bashrc`, `zshrc`, `xcompose`, `gpg/`, `pacman/`, `hypr/apps/`, `walker/themes/`
- **Scripts Updated**: All installation scripts updated to use consolidated paths
- **Cleanup**: Removed redundant files while preserving legitimate assets

#### Consolidation Details
**Path Structure Established:**
1. **Project Source** (`config/`): Consolidated configuration source in repository
2. **Installation Target** (`~/.local/share/omarchy/config/`): Where configs get deployed
3. **User Destination** (`~/.config/`): Where user's actual configs live

**Scripts Updated:**
- `install/config/config.sh`: Updated for consolidated `zshrc`/`bashrc` paths
- `install/config/xcompose.sh`: Updated `xcompose` source path  
- `install/config/gpg.sh`: Updated GPG config source path
- `install/preflight/pacman.sh`: Updated pacman config source paths
- `config/hypr/apps.conf`: Updated internal Hyprland app config paths
- `config/walker/themes/*.css`: Updated CSS import paths

## 5. Current Status

**Completed**: Configuration consolidation architecture
**Next**: Continue Stage 4 analysis with `theme.sh` script
**Remaining**: Complete config stage analysis, then proceed to login and post-install stages
