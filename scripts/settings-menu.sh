#!/usr/bin/env bash

SDIR="$HOME/rofi-settings-menu/scripts"

MENU="  System info|  Display|󰍺  Workspaces|󰴸  Audio|󰏘  Themes|󱛇  Network|  Bluetooth|  VPN|󰏔  Software sources"

# Launch Rofi
OPTION="$(echo -n $MENU | \
		rofi -no-config -no-lazy-grab -sep "|" -dmenu -i -p '' \
		-theme $SDIR/rofi/settings.rasi)"

case "$OPTION" in
	*"System info")
		alacritty --command "$SDIR"/fetch.sh >/dev/null 2>&1
		;;
	*Display)
		arandr
		;;
	*Workspaces)
		"$SDIR/workspaces.sh"
		;;
	*Audio)
		pavucontrol
		;;
	*Themes)
		"$SDIR"/style-switch.sh
		;;
	*Network)
		alacritty --class Nmtui --command "$SDIR"/nm-menu.sh >/dev/null 2>&1
		;;
	*Bluetooth)
		blueman-manager
		;;
	*VPN)
		protonvpn-app
		;;
	*"Software sources")
		pkexec mintsources
		;;
esac
