function newbranch --description "Interactively open a new branch based on the JIRA ticket in the clipboard"
	argparse --stop-nonopt f/from= h/help -- $argv
	or return
	if set -q _flag_help
		_newbranch_help
		return 0
	end

	set -l ticket_id (wl-paste | rg -o '\bOF-\d+')

	echo (set_color yellow)For ticket (set_color -o)$ticket_id(set_color normal;set_color yellow):(set_color normal) (jira-terminal detail -f summary $ticket_id)

	if set -q _flag_from
		git checkout $_flag_from
	else
		git checkout master
	end

	git pull

	read -f -p 'set_color green; echo -n branch name; set_color normal; echo ": "' -c $ticket_id-(jira-terminal detail -f summary $ticket_id | tr '[:upper:] ' '[:lower:]-') branch_name; or return

	git checkout -b $branch_name
end

function _newbranch_help
	printf %s\n \
		"Usage: newbranch [options]" \
		"" \
		"Interactively open a new branch based on the JIRA ticket in the clipboard." \
		"The JIRA ticket may be specified by copying any string containing the OF-*** ID, including the ticket's URL." \
		"" \
		"Options:" \
		"  -f or --from=REF  specify the ref (branch name) to branch from" \
		"  -h or --help      print this help message"
end
