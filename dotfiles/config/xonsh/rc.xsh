# vim: ft=python

$XONSH_SHOW_TRACEBACK = True

import os.path
from datetime import datetime
from pprint import pprint

from prompt_toolkit.keys import Keys
from prompt_toolkit.filters import Condition, EmacsInsertMode, ViInsertMode

$XONSH_TRACEBACK_LOGFILE = os.path.expanduser('~/.local/share/xonsh/tracebacks.log')
$CASE_SENSITIVE_COMPLETIONS = ''
$DYNAMIC_CWD_ELISION_CHAR = '…'
#$ = "(66.0, '%')"
#$DYNAMIC_CWD_WIDTH = (66.0, '%')
$HISTCONTROL = 'ignoredups'
#$MOUSE_SUPPORT = '1'
$MOUSE_SUPPORT = '0'
#$ = "['/home/whitelynx/bin',  '/usr/local/sbin', '/usr/local/bin', '/usr/bin', '/usr/lib/jvm/default/bin', '/usr/bin/site_perl', '/usr/bin/vendor_perl', '/usr/bin/core_perl', '/home/whitelynx/.local/bin', '/home/whitelynx/.cargo/bin']"
$PATH = [os.path.expanduser('~/bin'),  '/usr/local/sbin', '/usr/local/bin', '/usr/bin', '/usr/lib/jvm/default/bin', '/usr/bin/site_perl', '/usr/bin/vendor_perl', '/usr/bin/core_perl', os.path.expanduser('~/.local/bin'), os.path.expanduser('~/.cargo/bin')]
#$UPDATE_COMPLETIONS_ON_KEYPRESS = '1'
$UPDATE_OS_ENVIRON = '1'
$XONSH_COLOR_STYLE = 'arduino'
$XONSH_DATETIME_FORMAT = '%Y-%m-%d %H:%M:%S'
#$ = "(32768, 'commands')"
$XONSH_HISTORY_SIZE = (32768, 'commands')
$PROJECT_DIRS = [os.path.expanduser('~/Development')]
#$PL_TOOLBAR = 'who>virtualenv>branch>cwd>full_proc'

#$PROMPT = '{bg#333}🐚  {short_cwd} {NO_COLOR}{#333}{curr_branch:{branch_bg_color} {gitstatus} {NO_COLOR}{branch_color}} '
#$PROMPT = '{bg#333}🐍  {short_cwd} {NO_COLOR}{#333}{curr_branch:{branch_bg_color} {gitstatus} {NO_COLOR}{branch_color}} '
#$PROMPT = '{bg#333} {#8CD0D3}{user}@{hostname} {#000}▗▞▘ {#FFF}{short_cwd} {NO_COLOR}{#333}{curr_branch:▛▘{branch_bg_color} {gitstatus} {NO_COLOR}{branch_color}}▛▘{NO_COLOR}'
#$RIGHT_PROMPT = '{#333}  '

def return_code():
    if __xonsh_history__.rtns:
        ret_code = __xonsh_history__.rtns[-1]
        if ret_code != 0:
            return ret_code
    return None

def short_cwd_dir():
    short_cwd = $PROMPT_FIELDS['short_cwd']()
    return '' if short_cwd == '~' else short_cwd.rsplit('/', 1)[0] + '/'

$PROMPT_FIELDS['prompt_end_color'] = lambda: '{#222}' if $PROMPT_FIELDS['prompt_end'] == '$' else '{#400}'
$PROMPT_FIELDS['return_code'] = return_code
$PROMPT_FIELDS['short_cwd_dir'] = short_cwd_dir
$PROMPT_FIELDS['datetime'] = lambda: datetime.now().strftime($XONSH_DATETIME_FORMAT)
$PROMPT_FIELDS['gitstatus_custom'] = lambda: ($PROMPT_FIELDS['gitstatus']() or '').replace('{NO_COLOR}', '').replace('|', ' ')
$PROMPT_FIELDS['branch_bg_color_custom'] = lambda: '{bg#8F8}' if $PROMPT_FIELDS['branch_bg_color']() == '{BACKGROUND_GREEN}' else '{bg#D88}'

def custom_prompt():
    prompt = []
    if $PROMPT_FIELDS['return_code']():
        prompt.append('{bg#F77}{#000} !{return_code} {#222}▗▟')
    #prompt.append('{bg#222} {#8CD0D3}{user}@{hostname} {#000}▗▞▘ {#FFF}{short_cwd} ')
    #prompt.append('{bg#222} {#8CD0D3}{user}@{hostname} {#222}{bg#444}▛▘ {#FFF}{short_cwd} ')
    prompt.append('{bg#222} {#8CD0D3}{user}@{hostname} {#222}{bg#444}▛▘ {#AAA}{short_cwd_dir}{BOLD_#FFF}{cwd_base} ')
    if $PROMPT_FIELDS['curr_branch']():
        prompt.append('{#444}{branch_bg_color_custom}▛▘ {#000}{gitstatus_custom} ')
    #prompt.append('{#000}▗▟{NO_COLOR}')
    prompt.append('{prompt_end_color}▗▟{NO_COLOR}{prompt_end_color}{NO_COLOR} ')
    return ''.join(prompt)

$PROMPT = custom_prompt
$RIGHT_PROMPT = '{#333}  {datetime}'

#$XONSH_GITSTATUS_HASH = ':'
#$XONSH_GITSTATUS_BRANCH = '{CYAN}'
#$XONSH_GITSTATUS_OPERATION = '{CYAN}'
#$XONSH_GITSTATUS_STAGED = '{RED}●'
#$XONSH_GITSTATUS_CONFLICTS = '{RED}×'
#$XONSH_GITSTATUS_CHANGED = '{BLUE}+'
#$XONSH_GITSTATUS_UNTRACKED = '…'
#$XONSH_GITSTATUS_STASHED = '⚑'
#$XONSH_GITSTATUS_CLEAN = '{BOLD_GREEN}✓'
#$XONSH_GITSTATUS_AHEAD = '↑·'
#$XONSH_GITSTATUS_BEHIND = '↓·'

$XONSH_GITSTATUS_HASH = ':'
$XONSH_GITSTATUS_BRANCH = ' '
$XONSH_GITSTATUS_OPERATION = ''
$XONSH_GITSTATUS_STAGED = '●'
$XONSH_GITSTATUS_CONFLICTS = '×'
$XONSH_GITSTATUS_CHANGED = '+'
$XONSH_GITSTATUS_UNTRACKED = '…'
#$XONSH_GITSTATUS_STASHED = '■'
$XONSH_GITSTATUS_STASHED = '$'
$XONSH_GITSTATUS_CLEAN = '✓'
$XONSH_GITSTATUS_AHEAD = ' +'
$XONSH_GITSTATUS_BEHIND = ' -'

#$XONSH_STDERR_POSTFIX
#A format string, using the same keys and colors as ``$PROMPT``, that
#is appended whenever stderr is displayed. This may be used in
#conjunction with ``$XONSH_STDERR_PREFIX`` to start the block.For
#example, to have stderr appear on a red background, the prefix &
#postfix pair would be "" & "".
#default value: ''
#current value: ''
#>>>
#
#$XONSH_STDERR_PREFIX
#A format string, using the same keys and colors as ``$PROMPT``, that
#is prepended whenever stderr is displayed. This may be used in
#conjunction with ``$XONSH_STDERR_POSTFIX`` to close out the block.For
#example, to have stderr appear on a red background, the prefix &
#postfix pair would be "" & "".
#default value: ''
#current value: ''


@events.on_ptk_create
def custom_keybindings(bindings, **kw):
    handler = bindings.registry.add_binding

    @handler(Keys.ControlH)
    def delete_word_left(event):
        event.current_buffer.insert_text('dwl')

    @handler(Keys.ControlDelete)
    def delete_word_right(event):
        event.current_buffer.insert_text('dwr')


#xontrib load coreutils distributed docker_tabcomplete jedi mpl prompt_ret_code vox vox_tabcomplete avox powerline click_tabcomplete fzf-widgets schedule
#xontrib load coreutils distributed docker_tabcomplete mpl prompt_ret_code vox vox_tabcomplete powerline click_tabcomplete fzf-widgets schedule avox
xontrib load coreutils distributed docker_tabcomplete mpl vox vox_tabcomplete click_tabcomplete fzf-widgets schedule avox
