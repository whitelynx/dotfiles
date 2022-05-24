# Defined in /tmp/fish.RG4gxf/startsway.fish @ line 2
function startsway --description 'Start the Sway Wayland compositor'
	set -x XCURSOR_THEME xcursor-breeze
	set -x XCURSOR_SIZE 48
	set -x QT_SCALE_FACTOR 1
	set -x QT_QPA_PLATFORM wayland-egl
	set -x CLUTTER_BACKEND wayland
	set -x BEMENU_BACKEND wayland
	set -x MOZ_ENABLE_WAYLAND 1
	set -x SDL_VIDEODRIVER wayland
	set -x XDG_SESSION_TYPE wayland
	set -x XDG_CURRENT_DESKTOP kde
	exec sway
end
