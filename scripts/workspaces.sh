#!/usr/bin/env bash

SDIR="$HOME/rofi-settings-menu/scripts"

bspwm_rename_desktops() {
	NO_OF_DESKTOPS="$(bspc query -D --names | wc -l)"
	CMD="bspc monitor -d"

	for i in $( seq 1 $NO_OF_DESKTOPS ); do
		CMD+=" d$i"	
	done

	$CMD
}

bspwm_pick_remove_desktop() {
	OPTIONS="$(bspc query -D --names | sed ':a;N;$!ba;s/\n/|/g')" 

	DESKTOP_TO_REMOVE="$(echo -n $OPTIONS | \
			rofi -no-config -no-lazy-grab -sep "|" -dmenu -i -p '' \
			-theme $SDIR/rofi/workspaces.rasi)"

	bspc desktop "$DESKTOP_TO_REMOVE" -r
	bspwm_rename_desktops
}

bspwm_workspace_menu() {
	OPTIONS=" Add workspace| Remove workspace" 
 
	ACTION="$(echo -n $OPTIONS | \
			rofi -no-config -no-lazy-grab -sep "|" -dmenu -i -p '' \
			-theme $SDIR/rofi/workspaces.rasi)"

	case "$ACTION" in
		*"Add workspace")
			bspc monitor -a "d$(echo $(bspc query -D --names | wc -l) + 1 | bc)"
			;;
		*"Remove workspace")
			bspwm_pick_remove_desktop
			;;
	esac
}

i3_workspace_menu() {
	echo "i3"
}

if [[ "$DESKTOP_SESSION" == "bspwm" ]]; then
	bspwm_workspace_menu
elif [[ "$DESKTOP_SESSION" == "bspwm" ]]; then
	i3_workspace_menu
# else
# 	echo "To be added"
fi
