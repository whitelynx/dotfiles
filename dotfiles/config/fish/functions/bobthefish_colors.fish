function bobthefish_colors -S -d 'Define a custom bobthefish color scheme'

  # optionally include a base color scheme...
  __bobthefish_colors zenburn

  set -l grey       333333 # a bit darker than normal zenburn grey
  set -l darkgrey   191919
  set -l black      000000
  set -l red        CC9393
  set -l brightred  FF5353
  set -l green      7F9F7F
  set -l darkgreen  3F7F3F
  set -l yellow     E3CEAB
  set -l orange     DFAF8F
  set -l darkorange 6F3F00
  set -l blue       8CD0D3
  set -l white      EEEEDD

  # then override everything you want! note that these must be defined with `set -x`
  set -x color_initial_segment_exit  $darkorange $brightred --bold
  set -x color_initial_segment_su    $darkorange $brightred --bold
  set -x color_initial_segment_jobs  $darkorange $blue --bold
  set -x color_path                  $grey $white
  set -x color_path_basename         $grey $white --bold
  set -x color_path_nowrite          $grey $red
  set -x color_path_nowrite_basename $grey $red --bold
  set -x color_repo                  $green $grey
  set -x color_repo_work_tree        $green $grey --bold
  set -x color_repo_dirty            $red $grey
  set -x color_repo_staged           $yellow $grey
  set -x color_vi_mode_default       $grey $yellow --bold
  set -x color_vi_mode_insert        $green $grey --bold
  set -x color_vi_mode_visual        $yellow $grey --bold
  set -x color_vagrant               $darkgreen $grey --bold
  set -x color_username              $darkgrey $blue
  set -x color_hostname              $darkgrey $blue
  set -x color_rvm                   $red $darkgrey  --bold
  set -x color_virtualfish           $blue $darkgrey --bold
  set -x color_virtualgo             $blue $black --bold
  set -x color_desk                  $blue $black --bold
end
