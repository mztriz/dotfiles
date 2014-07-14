xrdb ~/.Xresources
xrandr --output VGA-0 --off --output DVI-1 --mode 1280x1024 --pos 0x0 --rotate left --output DVI-0 --off --output HDMI-0 --off

[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
mkfifo "$PANEL_FIFO"
exec gnome-session
