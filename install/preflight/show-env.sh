#!/bin/bash

gum log --level info "Installation Environment:"

env | grep -E "^(CHROOT_INSTALL|MOONARCH_ONLINE_INSTALL|MOONARCH_USER_NAME|MOONARCH_USER_EMAIL|USER|HOME|CUSTOM_REPO|CUSTOM_REF|MOONARCH_PATH)=" | sort | while IFS= read -r var; do
  gum log --level info "  $var"
done
