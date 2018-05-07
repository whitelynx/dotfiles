function fish_user_key_bindings
	fish_default_key_bindings

	bind \eOd backward-word       # Ctrl+Left: move 1 word to the left
	bind \eOc forward-word        # Ctrl+Right: move 1 word to the right
	bind \e'[3^' kill-word        # Ctrl+Delete: delete 1 word to the right
	bind \ch backward-kill-word   # Ctrl+Backspace: delete 1 word to the left

	# Different keycodes produced inside tmux (byobu):
	bind \e'[1;5D' backward-word  # Ctrl+Left: move 1 word to the left
	bind \e'[1;5C' forward-word   # Ctrl+Right: move 1 word to the right
	bind \e'[3;5~' kill-word      # Ctrl+Delete: delete 1 word to the right
end

fzf_key_bindings
