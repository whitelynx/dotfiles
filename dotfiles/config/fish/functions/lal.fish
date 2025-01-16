# Defined in /tmp/fish.4qV0QE/lal.fish @ line 2
function lal --description 'List contents of directory, including hidden files in directory using long format'
	eza -la --git $argv
end
