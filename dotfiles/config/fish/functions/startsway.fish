# Defined in /tmp/fish.RG4gxf/startsway.fish @ line 2
function startsway --description 'Start the Sway Wayland compositor'
	export (grep -v '^#\|^$' ~/.config/environment.d/01-native-wayland.conf)

	set -x XDG_SESSION_TYPE wayland

	exec sway
end
