#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

# Define locations
export MOONARCH_PATH="$HOME/.local/share/moonarch"
export MOONARCH_INSTALL="$MOONARCH_PATH/install"
export MOONARCH_INSTALL_LOG_FILE="/var/log/moonarch-install.log"
export PATH="$MOONARCH_PATH/bin:$PATH"

# Install
source "$MOONARCH_INSTALL/helpers/all.sh"
source "$MOONARCH_INSTALL/preflight/all.sh"
source "$MOONARCH_INSTALL/packaging/all.sh"
source "$MOONARCH_INSTALL/config/all.sh"
source "$MOONARCH_INSTALL/login/all.sh"
source "$MOONARCH_INSTALL/post-install/all.sh"