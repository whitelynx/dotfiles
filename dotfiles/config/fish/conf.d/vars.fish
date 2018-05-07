#set -xg EDITOR (which gvim)
set -xg EDITOR (which nvim)
#set PATH $PATH ~/bin ~/.local/bin ~/Library/Python/2.7/bin
set PATH $PATH ~/bin ~/.local/bin ~/.cargo/bin
set -xg HOMEBREW_GITHUB_API_TOKEN {{@@ env['HOMEBREW_GITHUB_API_TOKEN'] @@}}

set -g default_user {{@@ env['USER'] @@}}
#set -g theme_display_hg yes
set -g theme_display_ruby no
set -g theme_display_user yes
set -g theme_display_vi yes
set -g theme_display_vi_hide_mode default
set -g theme_title_display_process yes
set -g theme_date_format "+%Y-%m-%d %H:%M:%S"
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

set fish_color_search_match --background=222


# Custom color scheme (based on zenburn) for bobthefish prompt theme:
set -g theme_color_scheme user

set -l grey   333333 # a bit darker than normal zenburn grey
set -l red    CC9393
set -l brightred    FF5353
set -l green  7F9F7F
set -l darkgreen  3F7F3F
set -l yellow E3CEAB
set -l orange DFAF8F
set -l darkorange 6F3F00
set -l blue   8CD0D3
set -l white  EEEEDD

set -g __color_initial_segment_exit     $darkorange $brightred --bold
set -g __color_initial_segment_su       $darkorange $brightred --bold
set -g __color_initial_segment_jobs     $darkorange $blue --bold

set -g __color_path                     $grey $white
set -g __color_path_basename            $grey $white --bold
set -g __color_path_nowrite             $grey $red
set -g __color_path_nowrite_basename    $grey $red --bold

set -g __color_repo                     $green $grey
set -g __color_repo_work_tree           $green $grey --bold
set -g __color_repo_dirty               $red $grey
set -g __color_repo_staged              $yellow $grey

set -g __color_vi_mode_default          $grey $yellow --bold
set -g __color_vi_mode_insert           $green $grey --bold
set -g __color_vi_mode_visual           $yellow $grey --bold

set -g __color_vagrant                  $darkgreen $grey --bold
set -g __color_username                 $grey $blue
set -g __color_rvm                      $red $grey --bold
set -g __color_virtualfish              $blue $grey --bold
