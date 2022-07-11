function fish_user_key_bindings
	fish_default_key_bindings

	function bind_csi -d "Bind a CSI escape sequence using either \\e[ or \\u009b" -a sequence command
		bind \u009b"$sequence" "$command"
		bind \e"[$sequence" "$command"
	end

	# Key sequences based on http://www.leonerd.org.uk/hacks/fixterms
	bind_csi '127;5u' backward-kill-word  # Ctrl+Backspace: delete 1 word to the left
	bind_csi '1;5D'   backward-word       # Ctrl+Left: move 1 word to the left
	bind_csi '1;5C'   forward-word        # Ctrl+Right: move 1 word to the right
	bind_csi '3;5~'   kill-word           # Ctrl+Delete: delete 1 word to the right

	# Backwards-compatibility for urxvt
	bind \eOd backward-word       # Ctrl+Left: move 1 word to the left
	bind \eOc forward-word        # Ctrl+Right: move 1 word to the right
	bind \ch backward-kill-word   # Ctrl+Backspace: delete 1 word to the left
	bind_csi '3^' kill-word       # Ctrl+Delete: delete 1 word to the right

	# Keep unused keys from dropping spam characters in the command line
	bind_csi '2~' true           # Insert
	bind_csi '2;3~' true         # Alt+Insert
	bind_csi '2;5~' true         # Ctrl+Insert
	bind_csi '1;5A' true         # Ctrl+Up
	bind_csi '1;5B' true         # Ctrl+Down
	bind_csi '27;5;65457~' true  # Ctrl+Numpad_1
	bind_csi '27;5;65465~' true  # Ctrl+Numpad_9
	bind_csi '27;5;65454~' true  # Ctrl+Numpad_.
end
