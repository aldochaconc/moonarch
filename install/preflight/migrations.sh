OMARCHY_MIGRATIONS_STATE_PATH=~/.local/state/omarchy/migrations
mkdir -p $OMARCHY_MIGRATIONS_STATE_PATH

for file in ~/.local/share/moonarch-install/migrations/*.sh; do
  touch "$OMARCHY_MIGRATIONS_STATE_PATH/$(basename "$file")"
done
