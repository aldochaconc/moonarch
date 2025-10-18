source $MOONARCH_INSTALL/preflight/guard.sh
source $MOONARCH_INSTALL/preflight/begin.sh
run_logged $MOONARCH_INSTALL/preflight/show-env.sh
run_logged $MOONARCH_INSTALL/preflight/pacman.sh
run_logged $MOONARCH_INSTALL/preflight/migrations.sh
run_logged $MOONARCH_INSTALL/preflight/first-run-mode.sh
run_logged $MOONARCH_INSTALL/preflight/disable-mkinitcpio.sh
