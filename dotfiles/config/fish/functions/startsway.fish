# Defined in /tmp/fish.RG4gxf/startsway.fish @ line 2
function startsway --description 'Start the Sway Wayland compositor'
	export (grep -v '^#\|^$' ~/.config/environment.d/01-native-wayland.conf)

	set -x XDG_SESSION_TYPE wayland

	if grep '^DRIVER=nvidia$' /sys/class/drm/card*/device/uevent &>/dev/null
		exec sway --unsupported-gpu
	else
		exec sway
	end
end
