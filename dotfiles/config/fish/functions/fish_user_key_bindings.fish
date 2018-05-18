function fish_user_key_bindings
	fish_default_key_bindings

	# Key sequences based on http://www.leonerd.org.uk/hacks/fixterms
	bind \u009b'127;5u' backward-kill-word  # Ctrl+Backspace: delete 1 word to the left
	bind \e'[127;5u' backward-kill-word     # Ctrl+Backspace: delete 1 word to the left
	bind \u009b'1;5D' backward-word         # Ctrl+Left: move 1 word to the left
	bind \e'[1;5D' backward-word            # Ctrl+Left: move 1 word to the left
	bind \u009b'1;5C' forward-word          # Ctrl+Right: move 1 word to the right
	bind \e'[1;5C' forward-word             # Ctrl+Right: move 1 word to the right
	bind \u009b'3;5~' kill-word             # Ctrl+Delete: delete 1 word to the right
	bind \e'[3;5~' kill-word                # Ctrl+Delete: delete 1 word to the right

	# Backwards-compatibility for urxvt
	bind \eOd backward-word       # Ctrl+Left: move 1 word to the left
	bind \eOc forward-word        # Ctrl+Right: move 1 word to the right
	bind \e'[3^' kill-word        # Ctrl+Delete: delete 1 word to the right
	bind \ch backward-kill-word   # Ctrl+Backspace: delete 1 word to the left
end
