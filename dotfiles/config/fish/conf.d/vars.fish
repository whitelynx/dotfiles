#set -xg EDITOR (which gvim)
set -xg EDITOR (which nvim)

for browser in firefox-developer-edition firefox brave chromium chromium-browser chrome chrome-browser
	if command -s $browser >/dev/null
		set -xg BROWSER (which $browser)
		break
	end
end

for chromebrowser in chromium chromium-browser brave chrome chrome-browser
	if command -s $chromebrowser >/dev/null
		set -xg CHROME_EXECUTABLE (which $chromebrowser)
		break
	end
end

set -xg PYENV_ROOT $HOME/.pyenv
set -xg NVM_DIR $HOME/.nvm

for dir in ~/bin $PYENV_ROOT/bin ~/.local/bin ~/.cargo/bin ~/Library/Android/sdk/platform-tools ~/Library/Python/*/bin ~/Development/go/bin
	if test -d $dir
		set PATH $dir $PATH
	end
end

for dir in $HOME/Android/Sdk /opt/android-sdk
	if test -d $dir
		set -xg ANDROID_HOME $dir
		break
	end
end

{%@@ if 'HOMEBREW_GITHUB_API_TOKEN' in env @@%}
set -xg HOMEBREW_GITHUB_API_TOKEN {{@@ env['HOMEBREW_GITHUB_API_TOKEN'] @@}}
{%@@ endif @@%}

set -x VIRTUAL_ENV_DISABLE_PROMPT 1

set fish_color_search_match --background=222

if command -s pyenv >/dev/null
	status is-interactive; and pyenv init --path | source
	pyenv init - | source
	pyenv virtualenv-init - | source
end


# bobthefish prompt theme config:
set -g default_user {{@@ env['USER'] @@}}
set -g theme_color_scheme zenburn
#set -g theme_display_hg yes
set -g theme_display_ruby no
set -g theme_display_user yes
set -g theme_display_hostname ssh
set -g theme_display_vi yes
set -g theme_display_vi_hide_mode default
set -g theme_title_display_process yes
set -g theme_date_format "+%Y-%m-%d %H:%M:%S"

# If https://starship.rs is installed, use it:
if command -s starship >/dev/null
	starship init fish | source
end
