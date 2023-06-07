function newcommit --description "Interactively commit staged changes using the JIRA ticket in the branch name"
	argparse --stop-nonopt h/help -- $argv
	or return
	if set -q _flag_help
		_newcommit_help
		return 0
	end

	set -l branch_name (git branch --show-current)
	set -l ticket_id (echo $branch_name | rg -o '\bOF-\d+')

	echo (set_color yellow)Current branch:(set_color normal) $branch_name
	echo (set_color yellow)For ticket (set_color -o)$ticket_id(set_color normal;set_color yellow):(set_color normal) (jira-terminal detail -f summary $ticket_id)
	read -f -p 'set_color green; echo -n commit message; set_color normal; echo ": "' -c $ticket_id": " commit_message; or return

	git commit -m $commit_message $argv
end

function _newcommit_help
	printf %s\n \
		"Usage: newcommit [options]" \
		"" \
		"Interactively commit staged changes using the JIRA ticket in the branch name." \
		"This assumes the current branch name includes a JIRA ticket ID of the form OF-***." \
		"" \
		"Options:" \
		"  -h or --help      print this help message"
end
