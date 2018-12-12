# Defined in /tmp/fish.eFUuuX/tl.fish @ line 2
function tl --description 'List contents of directory tree using long format'
	exa --tree -l --git $argv
end
