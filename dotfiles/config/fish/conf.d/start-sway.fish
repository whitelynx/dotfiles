if [ -z "$DISPLAY" -a -z "$WAYLAND_DISPLAY" -a -n "$XDG_VTNR" -a 2 -eq "$XDG_VTNR" ]
	startsway
end
