# Set default XCompose that is triggered with CapsLock
tee ~/.XCompose >/dev/null <<EOF
include "%H/.local/share/omarchy/config/xcompose"

# Identification
<Multi_key> <space> <n> : "$OMARCHY_USER_NAME"
<Multi_key> <space> <e> : "$OMARCHY_USER_EMAIL"
EOF
