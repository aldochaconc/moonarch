# Moonarch

Moonarch is a fork of [Omarchy](https://github.com/basecamp/omarchy) project, refactored for a dotfiles-centric architecture and tailored for my own specific personal use case (AMD+NVIDIA hybrid graphics, development focus).

It preserves Omarchy's installation methodology while introducing significant architectural changes to prioritize portability, less dependencies, user control, and a cleaner separation between the system framework and user configuration.

---

## **Dotfiles Model**

The most significant change in Moonarch is the move to a **"Full Symlink" dotfiles architecture**. This resolves the complex "bridge" configuration model of the original project and establishes `~/dotfiles` as the **single source of truth** for all user configurations.

### **Quick view**

1.  **Template Directory**: The repository now contains a `dotfiles_template/` directory, which holds the baseline user configurations for all supported applications (`hypr`, `alacritty`, `nvim`, etc.) and shell files (`.bashrc`, `.zshrc`).
2.  **Installation**:
    *   The installer first copies the entire contents of `dotfiles_template/` into the user's `~/dotfiles` directory. This becomes the user's personal, version-controllable configuration set.
    *   It then systematically creates **symlinks** from the standard configuration locations (`~/.config/`, `~/`) to the corresponding files and directories in `~/dotfiles`.
3.  **Result**: Applications look for their configs in the standard locations (e.g., `~/.config/hypr`), but they are transparently reading and writing directly to your version-controlled `~/dotfiles` repository. Any change you make is a change to your dotfiles.

### **Key Advantages**
*   **Single Source of Truth**: The `~/dotfiles` directory is the definitive state of the user environment.
*   **Instant Propagation**: Dotfiles changes are reflected instantly by applications.
*   **Portability**: To set up a new machine, simply clone your dotfiles repository and run the installer to create the symlinks.
 
## **Theming**

The `install/config/` directory is the **heart of the system configuration**. Here's the complete structure with detailed explanations:

*   **Themes**: All theme packs are copied to `~/dotfiles/themes`. The active theme is determined by a `~/dotfiles/themes/current` symlink. All 12 `omarchy-theme-*` scripts are fully functional and now operate on the `~/dotfiles` structure.
*   **Branding**: ASCII art for fastfetch and the screensaver are managed in `~/dotfiles/branding`.

---

## **Installation**

### **Quick Install**
```bash
# Bootstrap and install from the main branch
curl -fsSL https://raw.githubusercontent.com/aldochaconc/moonarch/main/boot.sh | bash
```

### **Local Install**
```bash
# Clone the repository
git clone https://github.com/aldochaconc/moonarch.git ~/.local/share/moonarch-install

# Run the installer
~/.local/share/moonarch-install/install.sh
```

### **Post-Installation**
After installation, your entire user configuration is ready to be managed from the `~/dotfiles` directory. You can initialize it as a Git repository, push it to a private remote, and begin customizing.

---

## **Credits & License**

Moonarch is completely based on the [Omarchy Project](https://github.com/basecamp/omarchy) by Basecamp. It stands on the shoulders of their excellent work in creating a readable, robust Arch Linux installation framework.

This project maintains the same MIT license as the original Omarchy project.