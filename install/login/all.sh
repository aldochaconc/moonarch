#!/bin/bash

run_logged $MOONARCH_INSTALL/login/plymouth.sh
run_logged $MOONARCH_INSTALL/login/limine-snapper.sh
run_logged $MOONARCH_INSTALL/login/enable-mkinitcpio.sh
run_logged $MOONARCH_INSTALL/login/alt-bootloaders.sh
