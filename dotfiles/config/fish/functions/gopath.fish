# Defined in /tmp/fish.gHtYX8/gopath.fish @ line 2
function gopath --description 'Set GOPATH and add its bin directory to PATH'
	set -x GOPATH $argv
	set -x PATH $PATH $GOPATH/bin
end
