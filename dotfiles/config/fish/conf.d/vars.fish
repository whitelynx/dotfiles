#set -xg EDITOR (which gvim)
set -xg EDITOR (which nvim)
for dir in ~/bin ~/.local/bin ~/.cargo/bin ~/Library/Android/sdk/platform-tools
	if test -d $dir
		set PATH $PATH $dir
	end
end
set -xg HOMEBREW_GITHUB_API_TOKEN {{@@ env['HOMEBREW_GITHUB_API_TOKEN'] @@}}

set -x VIRTUAL_ENV_DISABLE_PROMPT 1

set fish_color_search_match --background=222


# bobthefish prompt theme config:
set -g default_user {{@@ env['USER'] @@}}
set -g theme_color_scheme zenburn
#set -g theme_display_hg yes
set -g theme_display_ruby no
set -g theme_display_user yes
set -g theme_display_vi yes
set -g theme_display_vi_hide_mode default
set -g theme_title_display_process yes
set -g theme_date_format "+%Y-%m-%d %H:%M:%S"
