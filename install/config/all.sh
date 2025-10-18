#!/bin/bash

run_logged $MOONARCH_INSTALL/config/config.sh
run_logged $MOONARCH_INSTALL/config/theme.sh
run_logged $MOONARCH_INSTALL/config/branding.sh
run_logged $MOONARCH_INSTALL/config/git.sh
run_logged $MOONARCH_INSTALL/config/gpg.sh
run_logged $MOONARCH_INSTALL/config/timezones.sh
run_logged $MOONARCH_INSTALL/config/increase-sudo-tries.sh
run_logged $MOONARCH_INSTALL/config/increase-lockout-limit.sh
run_logged $MOONARCH_INSTALL/config/ssh-flakiness.sh
run_logged $MOONARCH_INSTALL/config/detect-keyboard-layout.sh
run_logged $MOONARCH_INSTALL/config/mise-work.sh
run_logged $MOONARCH_INSTALL/config/fix-powerprofilesctl-shebang.sh
run_logged $MOONARCH_INSTALL/config/docker.sh
run_logged $MOONARCH_INSTALL/config/mimetypes.sh
run_logged $MOONARCH_INSTALL/config/localdb.sh
run_logged $MOONARCH_INSTALL/config/hardware/network.sh
run_logged $MOONARCH_INSTALL/config/hardware/set-wireless-regdom.sh
run_logged $MOONARCH_INSTALL/config/hardware/bluetooth.sh
run_logged $MOONARCH_INSTALL/config/hardware/printer.sh
run_logged $MOONARCH_INSTALL/config/hardware/usb-autosuspend.sh
run_logged $MOONARCH_INSTALL/config/hardware/ignore-power-button.sh
run_logged $MOONARCH_INSTALL/config/hardware/nvidia.sh