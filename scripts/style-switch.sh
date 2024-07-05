#!/usr/bin/env bash

SDIR="$HOME/.config/polybar/catppuccin/scripts"

OPTIONS=" Latte| Frappe| Macchiato| Mocha"

THEME="$(echo -n $OPTIONS | \
		rofi -no-config -no-lazy-grab -sep "|" -dmenu -i -p '' \
		-theme $SDIR/rofi/styles.rasi)"

case "$THEME" in
	*Latte) "$SDIR"/styles.sh --latte ;;
	*Frappe) "$SDIR"/styles.sh --frappe ;;
	*Macchiato) "$SDIR"/styles.sh --macchiato ;;
	*Mocha) "$SDIR"/styles.sh --mocha ;;
esac
