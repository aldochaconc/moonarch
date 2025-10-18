MOONARCH_MIGRATIONS_STATE_PATH=~/.local/state/moonarch/migrations
mkdir -p $MOONARCH_MIGRATIONS_STATE_PATH

for file in ~/.local/share/moonarch/migrations/*.sh; do
  touch "$MOONARCH_MIGRATIONS_STATE_PATH/$(basename "$file")"
done
