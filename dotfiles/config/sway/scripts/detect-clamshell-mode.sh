#!/usr/bin/bash
PRIMARY_OUTPUT=$(awk '/^set \$primary_output /{print gensub(/^set \$primary_output "(.+)".*/, "\\1", 1)}' "$HOME/.config/sway/config")
if grep -q open /proc/acpi/button/lid/LID0/state; then
    swaymsg output "$PRIMARY_OUTPUT" enable
else
    swaymsg output "$PRIMARY_OUTPUT" disable
fi
