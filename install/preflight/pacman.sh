if [[ -n ${MOONARCH_ONLINE_INSTALL:-} ]]; then
  # Install build tools
  sudo pacman -S --needed --noconfirm base-devel

  # Configure pacman
  sudo cp -f "${SHARE_DIR}/config/pacman/pacman.conf" /etc/pacman.conf
  sudo cp -f "${SHARE_DIR}/config/pacman/mirrorlist" /etc/pacman.d/mirrorlist

  # Refresh all repos
  sudo pacman -Syu --noconfirm
fi
