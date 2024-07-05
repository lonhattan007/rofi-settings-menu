# My Linux settings menu

A todo list for my settings menu that and is WM/DE-independent 
and works on multiple distros

## Display layout and resolution

Spawn `arandr`.

## Screens

Depends on the WM, spawn a rofi script for each to:
- [ ] Manually attach/detach a screen from a port
- [ ] Create workspaces for new screens 
- [ ] Move workspaces from a screen to be detached to other screens
- [ ] Migrate workspaces from the primary screen to other screens
- [ ] Append workspace for current monitor

## Sound

- [x] Spawn `pavucontrol`.

## Network menu

- [x] Handle something like this

```bash
!#/bin/sh
# nm-menu.sh
unset TERMCOLOR
TERM=x-term nmtui
```

```bash
kitty --class Nmtui ./nm-menu.sh >/dev/null 2>&1
```

```bash
alacritty --class Nmtui --command ./nm-menu.sh >/dev/null 2>&1
```

- [x] WM should have rule for classname `Nmtui` to be floating.

## VPN

- [x] Simply spawn `protonvpn-app`.

- [ ] Might work on other interfaces later.

## Bluetooth

May be spawn `blueman-manager`, I don't really use bluetooth on my Linux setup.

## Theme switcher

- [x] Just stick to the current set of themes first, this might get complicated. 
