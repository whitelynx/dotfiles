" Vim/NeoVim Configuration
" Maintainer:   David H. Bronke <whitelynx@gmail.com>
" Filename:     init.vim
" Installation:
"	- Save this file at /etc/xdg/nvim/init.vim or ~/.config/nvim/init.vim for
"		NeoVim, or at /etc/vimrc or ~/.vimrc for original Vim
"	- Install "vim-plug" at the same place:
"
"		curl -fLo /etc/xdg/nvim/autoload/plug.vim --create-dirs \
"			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
"		(see https://github.com/junegunn/vim-plug for more information on
"		installing "vim-plug")
"	- Start "nvim"
"	- Run ":PlugInstall" and ":UpdateRemotePlugins"

scriptencoding utf-8


"== Global Settings ==
" These settings modify how this .vimrc configures other things. You should
" probably go over them.

" Change the leader to `,` instead of `\`
" This changes what`s used on leader-based keybindings; e.g., `,t` (show
" TaskList), `,l` (show QuickFix list), `,s` (resync syntax), `,f` (toggle
" current fold), `,d` (toggle whitespace display), etc.
let g:mapleader = ','


"== Per-User Configuration ==
" Neutral setup:
" - Uses a relatively standard QWERTY-based keyboard layout.
" - Defaults to the 'redux' color scheme, falling back to 'luciusblack' and
"   finally 'pablo'.
command! -nargs=0 Neutral call QwertyKeys()


" My (whitelynx's) setup: Same as Neutral setup, but:
" - Uses a Dvorak-based keyboard layout.
" - Adds HTML bold, underline, and italic styling.
command! -nargs=0 WhiteLynx call DvorakKeys() | call WhiteLynxColors()


"== Shell fixes ==
" (if the shell is set to fish, Vim panics rather badly)
if $SHELL =~# 'bin/fish'
	set shell=/bin/sh
endif

" Prefer pipes over temp files.
if has('filterpipe')
	set noshelltemp
endif

" On Windows, under MSYS (e.g., the Git for Windows SDK), things don't quite work right out of the box.
if has('win32') && $SHELL =~# 'sh'
	set shellslash
	set shellcmdflag="-c"
	set shellpipe="2>&1| tee"
	set shellquote="\""
endif


"== Install Plugins ==
" This uses "vim-plug".

"Get the directory this file is in.
let s:plugRTP = expand('<sfile>:h')

" Discover the correct name of GNU Make.
let g:make = 'gmake'
if system('uname -o') =~# '^GNU/'
	let g:make = 'make'
endif

call plug#begin(s:plugRTP . '/plugged')

Plug 'Shougo/vimproc.vim', { 'do': g:make }
Plug 'Shougo/unite.vim'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/unite-outline'
Plug 'sgur/unite-qf'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " GitHub support for fugitive
Plug 'shumphrey/fugitive-gitlab.vim' " GitLab support for fugitive
Plug 'tommcdo/vim-fubitive' " Bitbucket support for fugitive
Plug 'ervandew/supertab'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'editorconfig/editorconfig-vim'
if has('nvim')
	Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
	Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
	Plug 'neovim/nvim-lspconfig'
else
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'dense-analysis/ale'
"Plug 'benekastah/neomake'
Plug 'https://gitlab.com/skewed-aspect/redux.vim.git'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'chrisbra/Colorizer'
Plug 'davidhalter/jedi-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'kalekundert/vim-coiled-snake'
Plug 'Konfekt/FastFold'
Plug 'chrisbra/matchit'

" Syntax plugins
Plug 'sheerun/vim-polyglot'
Plug 'alunny/pegjs-vim'
Plug 'artoj/qmake-syntax-vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'chikamichi/mediawiki.vim'
Plug 'posva/vim-vue'
Plug 'kelan/gyp.vim'
Plug 'chrisbra/csv.vim'
Plug 'dlmarquis/gcode.vim'
Plug 'hsanson/vim-openapi'
" Included in "sheerun/vim-polyglot":
"Plug 'aklt/plantuml-syntax'
"Plug 'isRuslan/vim-es6'
"Plug 'kballard/vim-fish'
"Plug 'peterhoeg/vim-qml'
"Plug 'groenewege/vim-less'
"Plug 'wavded/vim-stylus'
"Plug 'digitaltoad/vim-jade'
"Plug 'kchmck/vim-coffee-script'
"Plug 'exu/pgsql.vim'
"Plug 'mustache/vim-mustache-handlebars'

" Riot.js syntax
"Plug 'nicklasos/vim-jsx-riot'

" PowerShell syntax
"Plug 'PProvost/vim-ps1'

" ?
"Plug 'ivalkeen/vim-simpledb'
"Plug 'ivanov/vim-ipython'

" Necessary on Windows:
if has('win32')
	Plug 'xolox/vim-misc'
	Plug 'xolox/vim-shell'
endif

" web-indent has no git source?
"Plug 'web-indent'

"Plug '/home/dbronke/devel/other/carto/build/vim-carto', { 'type' : 'nosync' }
Plug 'whitelynx/carto', {'rtp': 'build/vim-carto/'}
"Plug 'whitelynx/django.vim'

call plug#end()


"== General Options ==
set modeline " This is considered unsafe by many; I find it useful
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set smartindent
"set showcmd " Disabled; see https://github.com/tpope/vim-sensible/issues/49
set incsearch
set hidden " Hide buffers when they are abandoned
set tabpagemax=30
set nofoldenable
set foldminlines=3 " 'fml' :P
set foldnestmax=3
set fillchars=fold:\ ,
set cursorline
set colorcolumn=80,100,120
set noruler " Turn off ruler, since we're including it in the status line
set nostartofline " Don't move to the first non-blank on the line any time you use "d", "<<", ">>", "G", "gg", etc.
set undofile
set undolevels=1000
set guioptions+=c " Use console-style dialogs, instead of gui-style (e.g., for "File has changed since editing started")
set title
set belloff=all " NO BELL >:o
set mouse=a

" If `pinfo` is present, use it for the K command instead of `man`.
if executable('pinfo')
	set keywordprg=pinfo
endif

"TODO: Look into using the 'linebreak', 'wrap', 'breakat', 'showbreak', etc. options.

if has('nvim')
	" shared data
	" - store file marks
	" - store marks for last 100 edited files
	" - store registers with up to 50 lines of data
	" - store registers with up to 10 Kb of data
	" - disable 'hlsearch' on startup
	" - don't write marks for:
	"   - files on removable media (d:, e: on win32; /media on *nix)
	"   - log and temporary files (/Temp, $HOME/Temp on win32; /tmp, /var on *nix)
	"   - remote filesystems (f:, i:, u:, z: on win32)
	if has('win32')
		set shada=!,f1,'100,<50,s10,h,rd:,re:,r/Temp,r$HOME/Temp,rf:,ri:,ru:,rz:
	elseif has('unix')
		set shada=!,f1,'100,<50,s10,h,r/media,r/tmp,r/var
	endif
else
	" viminfo:
	" - store file marks
	" - store marks for last 100 edited files
	" - store registers with up to 50 lines of data
	" - store registers with up to 10 Kb of data
	" - disable 'hlsearch' on startup
	" - don't write marks for:
	"   - files on removable media (d:, e: on win32; /media on *nix)
	"   - log and temporary files (/Temp, $HOME/Temp on win32; /tmp, /var on *nix)
	"   - remote filesystems (f:, i:, u:, z: on win32)
	if has('win32')
		set viminfo=f1,'100,<50,s10,h,rd:,re:,r/Temp,r$HOME/Temp,rf:,ri:,ru:,rz:
	elseif has('unix')
		set viminfo=f1,'100,<50,s10,h,r/media,r/tmp,r/var
	endif
endif

"-- VV --
" URL: https://github.com/vv-vim/vv
if exists('g:vv')
	VVset fontfamily=Input\ Mono\ Narrow
	VVset fontsize=11
endif


" Hide *.pyc, *.pyo, *.~?~, and .* files in the directory browser
let g:explHideFiles = '^\.,.*\.py[co],.*\.~[0-9]~$'

" Ignore archive files when detecting filetype
let g:ft_ignore_pat = '\.\(Z\|gz\|bz2\|zip\|tgz\|xz\|7z\|sz\|lz\|lzma\)$'


" Don't write .swp files or undo files in the current directory; useful when editing files in Dropbox
if has('win32')
	set directory=$HOME/Temp/_vim,/Temp/_vim
	set backupdir=$HOME/Temp/_vim/backup,/Temp/_vim/backup
	set undodir=$HOME/Temp/_vim/undo,/Temp/_vim/undo
	set viewdir=$HOME/Temp/_vim/view,/Temp/_vim/view
elseif has('unix')
	set directory=$HOME/tmp/.vim,/var/tmp,/tmp
	set backupdir=$HOME/tmp/.vim/backup,/var/tmp/vim-backup,/tmp/vim-backup
	set undodir=$HOME/tmp/.vim/undo,/var/tmp/vim-undo,/tmp/vim-undo
	set viewdir=$HOME/tmp/.vim/view,/var/tmp/vim-view,/tmp/vim-view
endif

" Make directories if they don't exist
let g:firstdir = get(split(&directory, ','), 0)
if !isdirectory(g:firstdir)
	call mkdir(g:firstdir, 'p')
endif
let g:firstdir = get(split(&backupdir, ','), 0)
if !isdirectory(g:firstdir)
	call mkdir(g:firstdir, 'p')
endif
let g:firstdir = get(split(&undodir, ','), 0)
if !isdirectory(g:firstdir)
	call mkdir(g:firstdir, 'p')
endif
let g:firstdir = get(split(&viewdir, ','), 0)
if !isdirectory(g:firstdir)
	call mkdir(g:firstdir, 'p')
endif


"== Displaying various whitespace characters ==
" Various space-related Unicode characters: ⎵␣⌴⍽ ␠_‾~
set nolist listchars=tab:⋮‥,trail:⎵,precedes:«,extends:»,eol:¶
" Execute `:set list!` or press `,d` to toggle this mode on and off.


"== Autocmd Group ==
" Define autocommands in a group, so we can easily clear them:
augroup vimrc

"== Colors ==

set background=dark

" Default to the redux colorscheme
try
	colorscheme redux
catch
	let g:colors_name = ''
endtry

if g:colors_name !=# 'redux'
	" If redux didn't load, try falling back to something else.
	try
		" Lucius color scheme with tweaks
		colorscheme luciusblack
	catch
		" Fall back to pablo with tweaks
        colorscheme pablo
        highlight Visual term=reverse guibg=#444444 ctermbg=82
        highlight Comment term=bold ctermfg=DarkGrey guifg=#aaaaaa
        highlight Folded term=standout ctermfg=Yellow ctermbg=82 guifg=Cyan guibg=Grey20
        highlight FoldColumn term=standout ctermfg=Yellow ctermbg=82 guifg=Cyan guibg=Grey20
        highlight Constant term=underline ctermfg=DarkCyan
	endtry

	" Use the colorsupport.vim plugin (vim script 2682) for terminal color support.

	" Better colors for the completion popup, selection, comments, and folds
	"highlight Pmenu guifg=#ffffff guibg=#333333 ctermfg=White ctermbg=DarkGray
	"highlight PmenuSel guibg=#000000 ctermbg=Black

	" Regardless of which color scheme I use, I like my colored columns and rows
	" to be subtle.
	highlight CursorColumn guibg=grey4
	highlight ColorColumn guibg=grey6
	highlight CursorLine guibg=grey10
endif

" Add missing colors for Markdown highlighting. (when using vim-markdown
" from https://github.com/tpope/vim-markdown.git)
highlight default link markdownCode String
highlight default link markdownCodeBlock String
highlight default link markdownLineBreak Todo
highlight default link markdownLinkTextDelimiter Delimiter
highlight default link markdownLinkDelimiter Delimiter
highlight default link markdownLink htmlLink

function! WhiteLynxColors()
	" Add HTML bold, underline, and italic styling.
	highlight htmlBold term=bold cterm=bold gui=bold
	highlight htmlUnderline term=underline cterm=underline gui=underline
	highlight htmlItalic term=italic cterm=italic gui=italic
	highlight htmlBoldUnderline term=bold,underline cterm=bold,underline gui=bold,underline
	highlight htmlBoldItalic term=bold,italic cterm=bold,italic gui=bold,italic
	highlight htmlUnderlineItalic term=underline,italic cterm=underline,italic gui=underline,italic
	highlight htmlBoldUnderlineItalic term=bold,underline,italic cterm=bold,underline,italic gui=bold,underline,italic
endfunction


"== Completion ==
" On completion (Tab if you have SuperTab installed) always show the
" completion menu, start out by inserting the longest common text, and show
" extra information about the current completion in the preview window.
set completeopt=menuone,menu,longest,preview

" Command-line completion - Not sure which of these I like better yet...
" Completion menu: show all matches, and cycle through them on <Tab>
"set wildmenu " Set by default in nvim.
" Shell-style completion: show all matches and complete the longest common text on <Tab>
"set wildmode=list:longest


"== Basic Key Bindings ==
" Change "cw" and "cW" to include the space after the word
nnoremap cw dwi
nnoremap cW dWi

" Run ctags to regenerate tags in the current directory
map <C-F12> :<C-u>call RunCTags()<CR>
" Use ",T" here because ",t" is mapped by the tasklist plugin
nnoremap <Leader>T :<C-u>call RunCTags()<CR>

" Build (:make) and then show the quickfix window if there's errors
map <F6> :<C-u>call Build()<CR>
nnoremap <Leader>B :<C-u>call Build()<CR>

" Open and jump to the QuickFix window. (useful for pyflakes and compiler
" errors)
nnoremap <Leader>l :<C-u>top copen<CR>

" Open and jump to the location list window. (useful for compiler and other
" errors)
nnoremap <Leader>L :<C-u>top lwindow<CR>

" Resync syntax
nnoremap <Leader>s :<C-u>syntax sync fromstart<CR>

" Open a scratch buffer in a split window
nnoremap <Leader>S :<C-u>call ScratchBuffer()<CR>

" Toggle the 'paste' option (useful for pasting text in a terminal)
nnoremap <Leader>p :<C-u>set paste!<CR>

" This is just me being lazy. (switches keyboard mappings to my preferred
" layout)
nnoremap <Leader>W :<C-u>WhiteLynx<CR>

" Reformat all code in the current buffer roughly according to our C++ coding
" style
nnoremap <Leader>rc :<C-u>call CReformat()<CR>

" Visual mode only: Create a skeleton implementation for the selected text
vnoremap <Leader>i :call CImplementationSkel()<CR>

" Toggle the 'list' option (display whitespace characters)
nnoremap <Leader>d :<C-u>set list!<CR>

" Join {motion} lines (like J, but accepts a {motion})
nnoremap <silent> <Leader>j :<C-u>set opfunc=JoinOperator<CR>g@


"== Filetype-Specific Key Mappings ==

" Marker to use for bulleted list items (should be one of: "-", "+", or "*")
let g:markdown_bulleted_list_marker = '-'

" Marker to use for numbered list items (should be one of: "." or ")")
let g:markdown_numbered_list_marker = '.'

" Make ATX-style headings two-sided? (insert '#' characters at the end as well as at the beginning of the line)
let g:markdown_atx_headers_two_sided = 0

function! FiletypeKeys()
	if &filetype ==# 'markdown'
		"" Make the current line a heading using the "ATX heading" style:
		"nnoremap <unique> <silent> <buffer> <LocalLeader>m1 :<C-u>call s:markdown_atxHeader('#')<CR>
		"nnoremap <unique> <silent> <buffer> <LocalLeader>m2 :<C-u>call s:markdown_atxHeader('##')<CR>
		"nnoremap <unique> <silent> <buffer> <LocalLeader>m3 :<C-u>call s:markdown_atxHeader('###')<CR>
		"nnoremap <unique> <silent> <buffer> <LocalLeader>m4 :<C-u>call s:markdown_atxHeader('####')<CR>
		"nnoremap <unique> <silent> <buffer> <LocalLeader>m5 :<C-u>call s:markdown_atxHeader('#####')<CR>
		"nnoremap <unique> <silent> <buffer> <LocalLeader>m6 :<C-u>call s:markdown_atxHeader('######')<CR>

		"" Same, but using a "setext heading" instead:
		"nnoremap <unique> <silent> <buffer> <LocalLeader>m! :<C-u>call s:markdown_setextHeader('=')<CR>
		"vnoremap <unique> <silent> <buffer> <LocalLeader>m! :<C-u>'<,'>call s:markdown_setextHeader('=')<CR>
		"nnoremap <unique> <silent> <buffer> <LocalLeader>m= :<C-u>call s:markdown_setextHeader('=')<CR>
		"vnoremap <unique> <silent> <buffer> <LocalLeader>m= :<C-u>'<,'>call s:markdown_setextHeader('=')<CR>
		"nnoremap <unique> <silent> <buffer> <LocalLeader>m@ :<C-u>call s:markdown_setextHeader('-')<CR>
		"vnoremap <unique> <silent> <buffer> <LocalLeader>m@ :<C-u>'<,'>call s:markdown_setextHeader('-')<CR>

		"" Make the current line a bulleted list item (or remove the list marker if already present):
		"nnoremap <unique> <silent> <buffer> <LocalLeader>m* :<C-u>call s:markdown_toggleBulletedLI()<CR>
		"vnoremap <unique> <silent> <buffer> <LocalLeader>m* :<C-u>'<,'>call s:markdown_toggleBulletedLI()<CR>
		"" Make the current line a numbered list item (or remove the list marker if already present):
		"nnoremap <unique> <silent> <buffer> <LocalLeader>m# :<C-u>call s:markdown_toggleNumberedLI()<CR>
		"vnoremap <unique> <silent> <buffer> <LocalLeader>m# :<C-u>'<,'>call s:markdown_toggleNumberedLI()<CR>

		"" Add a level of block quoting to the current line:
		"nnoremap <unique> <silent> <buffer> <LocalLeader>m> :<C-u>call s:markdown_addBlockQuote()<CR>
		"vnoremap <unique> <silent> <buffer> <LocalLeader>m> :<C-u>'<,'>call s:markdown_addBlockQuote()<CR>
		"" Remove a level of block quoting from the current line:
		"nnoremap <unique> <silent> <buffer> <LocalLeader>m< :<C-u>call s:markdown_removeBlockQuote()<CR>
		"vnoremap <unique> <silent> <buffer> <LocalLeader>m< :<C-u>'<,'>call s:markdown_removeBlockQuote()<CR>

		"" Possible bindings for <LocalLeader>m-:
		"" - Make the current line a level 2 "setext" heading.
		""nnoremap <unique> <silent> <buffer> <LocalLeader>m- :<C-u>call s:markdown_setextHeader('-')<CR>
		""vnoremap <unique> <silent> <buffer> <LocalLeader>m- :<C-u>call s:markdown_setextHeader('-')<CR>
		"" - Make the current line a bulleted list item.
		"nnoremap <unique> <silent> <buffer> <LocalLeader>m- :<C-u>call s:markdown_toggleBulletedLI<CR>
		"vnoremap <unique> <silent> <buffer> <LocalLeader>m- :<C-u>'<,'>call s:markdown_toggleBulletedLI<CR>
	endif
endfunction

let s:zeroToThreeIndentPat = ' \{0,3}'
let s:atxHeaderPrefixPat = '#\{1,6} \+'
let s:atxHeaderSuffixPat = ' \+#\+ *'
let s:setextHeaderUnderlinePat = '\n' . s:zeroToThreeIndentPat . '\%(-\+\|=\+\) *$'

function! s:markdown_atxHeader(atxPrefix) abort
	let l:replacement = a:atxPrefix . ' \1'
	if g:markdown_atx_headers_two_sided
		let l:replacement .= ' ' . a:atxPrefix
	endif
	execute line('.') . 'sm/^' . s:zeroToThreeIndentPat . '\%(' . s:atxHeaderPrefixPat
				\ . '\)\?\(.\{-}\)\%(' . s:atxHeaderSuffixPat . '\)\?$\%(' . s:setextHeaderUnderlinePat . '\)\?$/'
				\ . l:replacement . '/'
endfunction

function! s:markdown_setextHeader(underlineChar) range abort
	let l:maxLength = max(map(getline(a:firstline, a:lastline), 'matchend(v:val, ".*\\S")'))
	execute a:firstline . ',' . a:lastline . 'sm/^' . s:zeroToThreeIndentPat . '\%(' . s:atxHeaderPrefixPat
				\ . '\)\?\(.\{-}\)\%(' . s:atxHeaderSuffixPat . '\)\?$\%(' . s:setextHeaderUnderlinePat . '\)\?$/\1/'
	execute a:lastline . 'sm/$/\1/\r' . repeat(a:underlineChar, l:maxLength) . '/'
endfunction

function! s:markdown_getFirstNonBlankLine(first, last) abort
	" Find the first non-blank line in the range.
	let l:firstNonBlankLineNum = a:first
	let l:firstNonBlankLine = getline(l:firstNonBlankLineNum)
	while l:firstNonBlankLine !~# '\S' && l:firstNonBlankLineNum < a:last
		let l:firstNonBlankLineNum += 1
		let l:firstNonBlankLine = getline(l:firstNonBlankLineNum)
	endwhile
endfunction

function! s:markdown_getIndent(line) abort
	return escape(matchstr(a:line, '^\s*'), '\')
endfunction

function! s:markdown_toggleBulletedLI() range abort
	let l:firstNonBlankLineNum = s:markdown_getFirstNonBlankLine(a:firstline, a:lastline)
	let l:firstNonBlankLine = getline(l:firstNonBlankLineNum)
	let l:indent = s:markdown_getIndent(l:firstNonBlankLine)

	let l:substPrefix = l:firstNonBlankLineNum . ',' . a:lastline . 'sm/^\V' . l:indent . '\m\zs'
	if l:firstNonBlankLine =~# ('^\V' . l:indent . '\m[-+*] \{1,4}\S')
		execute l:substPrefix . '[-+*] \{1,4}\ze\S//'
	else
		execute l:substPrefix . '\%(\d\{1,9}[.)] \{1,4}\)\?/' . g:markdown_bulleted_list_marker . ' /'
	endif
endfunction

function! s:markdown_toggleNumberedLI() range abort
	let l:firstNonBlankLineNum = s:markdown_getFirstNonBlankLine(a:firstline, a:lastline)
	let l:firstNonBlankLine = getline(l:firstNonBlankLineNum)
	let l:indent = s:markdown_getIndent(l:firstNonBlankLine)

	let l:substPrefix = l:firstNonBlankLineNum . ',' . a:lastline . 's/^\V' . l:indent . '\m\zs'
	if l:firstNonBlankLine =~ ('^\V' . l:indent . '\m\d\{1,9}[.)] \{1,4}\S')
		execute l:substPrefix . '\d\{1,9}[.)] \{1,4}\ze\S//'
	else
		execute l:substPrefix . '\%([-+*] \{1,4}\)\?/1' . g:markdown_numbered_list_marker . ' /'
	endif
endfunction

function! s:markdown_addBlockQuote() range abort
	let l:firstNonBlankLineNum = s:markdown_getFirstNonBlankLine(a:firstline, a:lastline)
	let l:firstNonBlankLine = getline(l:firstNonBlankLineNum)
	let l:indent = s:markdown_getIndent(l:firstNonBlankLine)

	execute l:firstNonBlankLineNum . ',' . a:lastline . 's/^\V' . l:indent . '\m\zs/> /'
endfunction

function! s:markdown_removeBlockQuote() range abort
	let l:firstNonBlankLineNum = s:markdown_getFirstNonBlankLine(a:firstline, a:lastline)
	let l:firstNonBlankLine = getline(l:firstNonBlankLineNum)
	let l:indent = s:markdown_getIndent(l:firstNonBlankLine)

	execute l:firstNonBlankLineNum . ',' . a:lastline . 's/^\V' . l:indent . '\m\zs> //'
endfunction


"== Keyboard Mapping Functions ==
" These are used later to build the full set of key mappings.

" Start out with all options disabled by default.
let g:useDvorak = 0

" Keys to switch tabs, useful with `vim -p`.
function! TabSwitchKeys()
	command! GoToBufferOrTab tabnext
	command! LastBufferOrTab tablast
	command! NextBufferOrTab tabnext
	command! PrevBufferOrTab tabprevious

	if has('toolbar')
		" Update the 'Open' button on the toolbar to open in a tab.
		anoremenu 1.10 ToolBar.Open :browse confirm tabe<CR>
	endif
endfunction

" Keys to switch buffers, useful with any of the following:
" * minibufexpl original - http://www.vim.org/scripts/script.php?script_id=159
" * minibufexpl fholgado (newer) - https://github.com/fholgado/minibufexpl.vim
" * TabBar - http://www.vim.org/scripts/script.php?script_id=1338
function! BufferSwitchKeys()
	command! GoToBufferOrTab buffer
	command! LastBufferOrTab blast

	" If MiniBufExpl has set its commands, use them; otherwise, use :bnext and
	" :bprevious. (MiniBufExpl automatically filters out non-modifiable
	" buffers)
	if exists(':MBEbn')
		command! NextBufferOrTab MBEbn
		command! PrevBufferOrTab MBEbn
	else
		command! NextBufferOrTab bnext
		command! PrevBufferOrTab bprevious
	endif

	if has('toolbar')
		" Update the 'Open' button on the toolbar to open in a normal buffer.
		anoremenu 1.10 ToolBar.Open :browse confirm e<CR>
	endif
endfunction

" QWERTY-compatible key mappings
function! QwertyKeys()
	" Qwerty key mappings
	" Clean up Dvorak keymap
	"                     [revert to]
	silent! unmap h      " left
	silent! unmap t      " unknown
	silent! unmap n      " repeat latest search
	silent! unmap s      " right
	silent! unmap H      " unknown
	silent! unmap T      " unknown
	silent! unmap N      " repeat latest search, reversed
	silent! unmap S      " unknown
	silent! unmap l      " right
	silent! unmap L      " unknown
	silent! nunmap <C-t> " unknown
	silent! nunmap <C-n> " unknown
	silent! nunmap <C-s> " unknown
	" Movement
	"               [new]   [old]      [description]
	exec 'noremap'  '<Down>' 'gj'    | " down (next display line)
	exec 'noremap'  '<Up>'   'gk'    | " up (previous display line)
	exec 'noremap'  'j'      'gj'    | " down (next display line)
	exec 'noremap'  'k'      'gk'    | " up (previous display line)

	" Window Navigation
	"               [new]   [old]      [description]
	exec 'nnoremap' '<C-h>' '<C-W>h' | " next window to the left of the current
	exec 'nnoremap' '<C-j>' '<C-W>j' | " next window below the current
	exec 'nnoremap' '<C-k>' '<C-W>k' | " next window above the current
	exec 'nnoremap' '<C-l>' '<C-W>l' | " next window to the right of the current

	" Folding
	"               [new]     [old]   [description]
	exec 'nnoremap' '<space>' 'za'  | " toggle the fold under the cursor
	exec 'vnoremap' '<space>' 'zf'  | " create a fold from the current visual selection

	" Buffer/tab switching
	" Use Alt+[number] to switch to the numbered buffer (Alt+0 switches to the last buffer)
	nnoremap <A-1> :<C-u>GoToBufferOrTab 1<CR>
	nnoremap <A-2> :<C-u>GoToBufferOrTab 2<CR>
	nnoremap <A-3> :<C-u>GoToBufferOrTab 3<CR>
	nnoremap <A-4> :<C-u>GoToBufferOrTab 4<CR>
	nnoremap <A-5> :<C-u>GoToBufferOrTab 5<CR>
	nnoremap <A-6> :<C-u>GoToBufferOrTab 6<CR>
	nnoremap <A-7> :<C-u>GoToBufferOrTab 7<CR>
	nnoremap <A-8> :<C-u>GoToBufferOrTab 8<CR>
	nnoremap <A-9> :<C-u>GoToBufferOrTab 9<CR>
	nnoremap <A-0> :<C-u>LastBufferOrTab<CR>

	" Use Ctrl+Tab to switch to the next buffer, and Ctrl+Shift+Tab to switch
	" to the previous buffer. This lets miniBufExpl do the bindings. (?)
	nnoremap <C-Tab> :<C-u>NextBufferOrTab<CR>
	nnoremap <C-S-Tab> :<C-u>PrevBufferOrTab<CR>

	" Use Ctrl+f to switch to the next buffer, and Ctrl+s to switch to the
	" previous buffer.
	nnoremap <C-f> :<C-u>NextBufferOrTab<CR>
	nnoremap <C-s> :<C-u>PrevBufferOrTab<CR>

	" Easy switching!
	nnoremap <Leader>w :<C-u>call DvorakKeys()<CR>

	" Update g:useDvorak to match the current state.
	let g:useDvorak = 0
endfunction

" Dvorak-compatible key mappings
function! DvorakKeys()
	" Dvorak key remappings

	" Clean up QWERTY keymap
	"                     [revert to]
	silent! unmap j      "  down (next _logical_ line)
	silent! unmap k      "  up (previous _logical_ line)
	silent! nunmap <C-j> "  unknown
	silent! nunmap <C-k> "  unknown
	silent! nunmap <C-l> "  unknown

	" Movement
	"               [new]   [old]      [description]
	exec 'noremap'  'h'      'h'     | " left
	exec 'noremap'  't'      'gj'    | " down (next display line)
	exec 'noremap'  'n'      'gk'    | " up (previous display line)
	exec 'noremap'  's'      'l'     | " right
	exec 'noremap'  'H'      '0'     | " beginning of line
	exec 'noremap'  'T'      'L'     | " bottom of screen
	exec 'noremap'  'N'      'H'     | " top of screen
	exec 'noremap'  'S'      '$'     | " end of line
	exec 'noremap'  '<Down>' 'gj'    | " down (next display line)
	exec 'noremap'  '<Up>'   'gk'    | " up (previous display line)

	" Searching
	"               [new]   [old]      [description]
	exec 'noremap'  'l'      'n'     | " repeat latest search
	exec 'noremap'  'L'      'N'     | " repeat latest search, reversed

	" Window Navigation
	"               [new]   [old]      [description]
	exec 'nnoremap' '<C-h>' '<C-W>h' | " next window to the left of the current
	exec 'nnoremap' '<C-t>' '<C-W>j' | " next window below the current
	exec 'nnoremap' '<C-n>' '<C-W>k' | " next window above the current
	exec 'nnoremap' '<C-s>' '<C-W>l' | " next window to the right of the current

	" Folding
	"               [new]     [old]   [description]
	exec 'nnoremap' '<space>' 'za'  | " toggle the fold under the cursor
	exec 'vnoremap' '<space>' 'zf'  | " create a fold from the current visual selection

	" Buffer/tab switching
	" Use Alt+[number] to switch to the numbered buffer
	nnoremap <A-1> :<C-u>GoToBufferOrTab 1<CR>
	nnoremap <A-2> :<C-u>GoToBufferOrTab 2<CR>
	nnoremap <A-3> :<C-u>GoToBufferOrTab 3<CR>
	nnoremap <A-4> :<C-u>GoToBufferOrTab 4<CR>
	nnoremap <A-5> :<C-u>GoToBufferOrTab 5<CR>
	nnoremap <A-6> :<C-u>GoToBufferOrTab 6<CR>
	nnoremap <A-7> :<C-u>GoToBufferOrTab 7<CR>
	nnoremap <A-8> :<C-u>GoToBufferOrTab 8<CR>
	nnoremap <A-9> :<C-u>GoToBufferOrTab 9<CR>
	nnoremap <A-0> :<C-u>GoToBufferOrTab 10<CR>
	" Switch to buffer 11.
	nnoremap <A-[> :<C-u>GoToBufferOrTab 11<CR>
	" Switch to the last buffer.
	nnoremap <A-]> :<C-u>LastBufferOrTab<CR>

	" Use Ctrl+Tab to switch to the next buffer, and Ctrl+Shift+Tab to switch
	" to the previous buffer. This lets miniBufExpl do the bindings. (?)
	nnoremap <C-Tab> :<C-u>NextBufferOrTab<CR>
	nnoremap <C-S-Tab> :<C-u>PrevBufferOrTab<CR>

	" Use Ctrl+u to switch to the next buffer, and Ctrl+o to switch to the
	" previous buffer.
	nnoremap <C-u> :<C-u>NextBufferOrTab<CR>
	nnoremap <C-o> :<C-u>PrevBufferOrTab<CR>

	" Easy switching!
	nnoremap <Leader>w :<C-u>call QwertyKeys()<CR>

	" if vim-surround is installed, this will keep it from stealing 'cs' (should be the same as c<Right>)
	autocmd VimEnter * silent! nunmap cs

	" Update g:useDvorak to match the current state.
	let g:useDvorak = 1
endfunction


" Update the current key bindings with buffer- or tab-switching keys as
" appropriate.
"
" By default, use buffer-oriented (:bn, :bp, etc.) commands to switch files
" instead of tab-oriented (gT, gt, etc.) when binding the file switch keys.
" (<C-Tab>, <C-o>, <C-u>, <M-1>, etc.) If we detect that we've entered a tab,
" though, we switch to the tab-oriented commands.
"
" For the hasTabs parameter, you may specify:
" - 1 to enable
" - 0 to disable
" - -1 to keep the current value
function! UpdateHasTabs(hasTabs)
	if a:hasTabs >= 0
		let g:hasTabs = a:hasTabs
	endif

	if g:hasTabs
		" Close minibufexpl window if it's open.
		if exists(':CMiniBufExplorer')
			CMiniBufExplorer
		endif

		"TODO: Possibly close bufexplorer/tabbar window if either is open.

		call TabSwitchKeys()

		" If we're using tabs, we want the "Open" button on the toolbar to
		" actually do :tabe.
		if has('toolbar')
			an 1.10 ToolBar.Open :browse confirm tabe<CR>
		endif
	else
		"TODO: Possibly close any extra open tabs here so we just end up with
		" the current tab's window layout.

		call BufferSwitchKeys()

		" If we're using buffers, we want the "Open" button on the toolbar to
		" actually do :e.
		if has('toolbar')
			an 1.10 ToolBar.Open :browse confirm e<CR>
		endif
	endif
endfunction

" Detect when we're using tabs, and update keys automatically.
call UpdateHasTabs(0)
autocmd TabEnter * call UpdateHasTabs(1)


"== Keyboard Mapping Commands ==
" Show the current keyboard mapping state.
command! -nargs=0 ShowKB echo "Keyboard Layout:" (g:useDvorak ? "Dvorak" : "QWERTY") . ";  File Switching:" (g:hasTabs ? "tabs" : "buffers")

" Add commands to switch key binding options.
command! -nargs=0 ForceUseTabs call UpdateHasTabs(1)
command! -nargs=0 ForceUseBuffers call UpdateHasTabs(0)


"== GUI Fonts ==
" Set the font to drift, falling back to one of several alternatives
" (get drift from http://artwizaleczapka.sourceforge.net/ or
" http://sourceforge.net/projects/artwiz-latin1/)
" For Neovim-qt, see `ginit.vim`.
if has('gui_running')
	set guifont=drift\ 10,ProFont\ 10,progsole\ 10,ProggyTinyTTSZ\ 16,Terminus\ 12,Lucida\ Console\ 8
endif


"== Syntax Highlighting Options ==

" Python: Highlight numbers, builtin functions, standard exceptions, trailing whitespace, and mix of spaces and tabs.
let g:python_highlight_all = 1

" SQL: Default to the 'pgsql' type.
let g:sql_type_default = 'pgsql'
" For MS SQL, try 'sqlanywhere':
"let g:sql_type_default = 'sqlanywhere'

" SH: Default .sh files to bash syntax.
let g:is_bash = 1
let g:bash_is_sh = 1
" Enable folding on functions, heredocs, and if/do/for blocks
let g:sh_fold_enabled = 7


"-- Fallback bindings --
" (in case Unite isn't installed)

if executable('rg')
	nnoremap <Leader>/ :<C-u>rg<Space>
elseif executable('sift')
	nnoremap <Leader>/ :<C-u>sift<Space>
else
	nnoremap <Leader>/ :<C-u>grep<Space>
endif

" Open and jump to the location list window. (useful for compiler and other errors)
nnoremap <Leader>l :<C-u>top lopen<cr>

" Open and jump to the QuickFix window. (useful for pyflakes and compiler errors)
nnoremap <Leader>L :<C-u>top copen<cr>



"== Plugin Options ==

"-- vim-plug --
" URL: https://github.com/junegunn/vim-plug#installation

let g:plug_window = 'topleft new'

" Custom mappings for the vim-plug buffer
autocmd FileType vim-plug call s:vim_plug_buffer_settings()
function! s:vim_plug_buffer_settings()
	" Play nice with supertab
	let b:SuperTabDisabled = 1

	nmap <buffer> <Esc> :<C-u>bd<cr>
endfunction


"-- coq_nvim --
" URL: https://github.com/ms-jpq/coq_nvim

" Enable coq at startup.
let g:coq_settings = { 'auto_start': 'shut-up' }


"-- deoplete --
" URL: https://github.com/Shougo/deoplete.nvim

" Enable deoplete completion at startup.
let g:deoplete#enable_at_startup = 1


"-- ale --
" URL: https://github.com/dense-analysis/ale

let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_pattern_options = {
\	'\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\	'\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\}
let g:ale_linter_aliases = {
\	'vue': ['vue', 'javascript'],
\}
let g:ale_linters = {
\	'python': ['flake8'],
\	'vue': ['eslint', 'vls'],
\}
let g:ale_fixers = {
\   'python': [
\       'black',
\   ],
\   'javascript': [
\       'biome',
\       'eslint',
\       'prettier',
\       'trim_whitespace',
\   ],
\   'typescript': [
\       'biome',
\       'eslint',
\       'prettier',
\       'trim_whitespace',
\   ],
\   'svelte': [
\       'prettier',
\       'trim_whitespace',
\   ],
\}
if exists('g:vscode')
	let g:ale_virtualtext_cursor = 'disabled'
else
	let g:ale_virtualtext_cursor = 'all'
endif

autocmd SourcePre */plugin/ale.vim call s:ale_settings()
function! s:ale_settings()

	nmap <silent> <Leader>n <Plug>(ale_previous_wrap)
	nmap <silent> <Leader>t <Plug>(ale_next_wrap)

endfunction


"-- vim-gitgutter --
" URL: https://github.com/airblade/vim-gitgutter

" This plugin currently causes issues for me in both Vim and NeoVim on Windows; disable it there.
if has('win32')
	let g:gitgutter_enabled = 0
endif

autocmd SourcePre */plugin/gitgutter.vim call s:gitgutter_settings()
function! s:gitgutter_settings()

	" Tell vim-gitgutter to leave the sign column's background alone:
	let g:gitgutter_override_sign_column_highlight = 0

	" Ignore whitespace changes:
	let g:gitgutter_diff_args = '-w'

	nmap [h <Plug>(GitGutterPrevHunk)
	nmap ]h <Plug>(GitGutterNextHunk)
	nmap <Leader>gn <Plug>(GitGutterNextHunk)<cr>
	nmap <Leader>gN <Plug>(GitGutterPrevHunk)<cr>

	nmap <Leader>gg gg<Plug>(GitGutterNextHunk)<cr>
	nmap <Leader>G G<Plug>(GitGutterPrevHunk)<cr>

	nmap <Leader>ha <Plug>(GitGutterStageHunk)
	nmap <Leader>hs <Plug>(GitGutterStageHunk)
	nmap <Leader>hr <Plug>(GitGutterRevertHunk)
	nmap <Leader>ga <Plug>(GitGutterStageHunk)<cr>
	nmap <Leader>gr <Plug>(GitGutterRevertHunk)<cr>

	nmap <Leader>gp <Plug>(GitGutterPreviewHunk)<cr>

endfunction


"-- airline --
" URL: https://github.com/bling/vim-airline

" Automatically show all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1
" Show warnings/errors from ALE.
let g:airline#extensions#ale#enabled = 1

"TODO: Look at this: https://github.com/bling/vim-airline/#integrating-with-powerline-fonts
let g:airline_powerline_fonts = 1

let g:airline_theme = 'dark'


"-- vimproc --
" URL: https://github.com/Shougo/vimproc.vim
" Build: pushd ~/.vim/plugged/vimproc.vim; make; popd
" You'll want this for Unite's `file_rec/async` source. (see below)


"-- Unite --
" URL: https://github.com/Shougo/unite.vim

autocmd SourcePre */plugin/unite.vim call s:unite_settings()
function! s:unite_settings()

	call unite#filters#matcher_default#use(['matcher_fuzzy'])
	call unite#custom#source('file_rec/git,file_rec/async', 'matchers',
			\ ['matcher_default', 'matcher_hide_hidden_files', 'matcher_hide_current_file', 'matcher_project_ignore_files'])

	let g:unite_source_history_yank_enable = 1
	if executable('rg')
		let g:unite_source_grep_command = 'rg'
		let g:unite_source_grep_default_opts = '-n'
	elseif executable('sift')
		let g:unite_source_grep_command = 'sift'
		let g:unite_source_grep_default_opts = '-n'
	endif

	"nnoremap <Leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
	nnoremap <Leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/git:!<cr>
	nnoremap <Leader>F :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
	"nnoremap <Leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
	nnoremap <Leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
	nnoremap <Leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
	nnoremap <Leader>b :<C-u>Unite -no-split -buffer-name=buffer  -start-insert buffer<cr>
	nnoremap <Leader>/ :<C-u>Unite -no-split -buffer-name=grep    -start-insert grep:.<cr>
	nnoremap <Leader>g/ :<C-u>Unite -no-split -buffer-name=grep   -start-insert grep/git:.<cr>

	" Open and jump to the location list window. (useful for compiler and other errors)
	nnoremap <Leader>l :<C-u>top Unite -buffer-name="Location\ List" locationlist<cr>

	" Open and jump to the QuickFix window. (useful for pyflakes and compiler errors)
	nnoremap <Leader>L :<C-u>top Unite -buffer-name="Quickfix\ List" qf<cr>

	" Custom mappings for the unite buffer
	autocmd vimrc FileType unite call s:unite_buffer_settings()
	function! s:unite_buffer_settings()
		" Play nice with supertab
		let b:SuperTabDisabled = 1

		nmap <buffer> <Esc>   <Plug>(unite_exit)
		nmap <buffer> <C-l>   <Plug>(unite_redraw)

		" Enable navigation with up and down in insert mode
		imap <buffer> <down>  <Plug>(unite_select_next_line)
		imap <buffer> <up>    <Plug>(unite_select_previous_line)

		" Enable navigation with tab and shift-tab in insert mode
		imap <buffer> <Tab>   <Plug>(unite_select_next_line)
		imap <buffer> <S-Tab> <Plug>(unite_select_previous_line)
	endfunction

endfunction


"-- fugitive --
" URL: https://github.com/tpope/vim-fugitive

autocmd SourcePre */plugin/fugitive.vim call s:fugitive_settings()
function! s:fugitive_settings()

	"set statusline=%<%2*%{DirName(bufname(\"\"))}%3*%t%4*\ %h%m%r%w%q%y\ %{fugitive#statusline()}%#WarningMsg#%*%=%6*L%5*%l%1*/%6*%L%1*,%6*\ C%5*%c%7*%V\ %5*%p%6*%%
	set statusline=%<%2*%{bufname(\"\")}%3*%t%4*\ %h%m%r%w%q%y\ %{fugitive#statusline()}%#WarningMsg#%*%=%6*L%5*%l%1*/%6*%L%1*,%6*\ C%5*%c%7*%V\ %5*%p%6*%%

	vnoremap <silent> gho :GBrowse<CR>
	vnoremap <silent> ghc :GBrowse!<CR>

	nnoremap <silent> gho :.GBrowse<CR>
	nnoremap <silent> ghc :.GBrowse!<CR>

	vnoremap <Leader>gb :<C-u>'<,'>Git blame<CR>
	nnoremap <Leader>gb :Git blame<CR>

endfunction


"-- SuperTab --
" URL: https://github.com/ervandew/supertab
let g:SuperTabDefaultCompletionType = 'context'


"-- Task List --
" URL: http://www.vim.org/scripts/script.php?script_id=2607
let g:tlTokenList = ['FIXME', 'TODO', 'BUG', 'XXX']
let g:tlRememberPosition = 1


"-- surround.vim --
" URL: https://github.com/tpope/vim-surround

" Disable the surround plugin's mappings, since they take over 'cs' which
" breaks the Dvorak layout.
let g:surround_no_mappings = 1

"-- Colorizer --
" Use virtual text to render swatches at the end of lines
if has('nvim')
	let g:colorizer_use_virtual_text = 1
endif


"-- OmniCppComplete --
" Better omnicomplete than the original
" URL: http://www.vim.org/scripts/script.php?script_id=1520

let g:OmniCpp_NamespaceSearch = 1
let g:OmniCpp_GlobalScopeSearch = 1
let g:OmniCpp_ShowAccess = 1
let g:OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let g:OmniCpp_MayCompleteDot = 1 " autocomplete after .
let g:OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let g:OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let g:OmniCpp_DefaultNamespaces = ['std', '_GLIBCXX_STD']


"-- vim-javascript --
" Part of "vim-polyglot"
" URL: https://github.com/pangloss/vim-javascript
let g:javascript_plugin_jsdoc = 1

"-- vim-markdown --
" Part of "vim-polyglot"
" URL: https://github.com/plasticboy/vim-markdown
let g:vim_markdown_fenced_languages = ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini', 'js=javascript', 'csharp=cs']

"-- vim-svelte-plugin --
" Part of "vim-polyglot"
" URL: https://github.com/leafOfTree/vim-svelte-plugin
let g:vim_svelte_plugin_use_typescript = 1
let g:vim_svelte_plugin_use_sass = 1


"-- csv.vim --
" URL: https://github.com/chrisbra/csv.vim
" Default to a limited set of delimiters and strict columns, for performance.
" (if you change these settings, run :CSVInit to reinitialize the plugin)
let g:csv_delim_test = ',;|'
let g:csv_strict_columns = 1

"==== END PLUGINS ====


"== Custom Commands ==
" Edit the current .vimrc
command! -nargs=0 EditVimRC split <sfile>
" Reload the current .vimrc
command! -nargs=0 ReloadVimRC source <sfile>

" Revert patch changes in the selected range (see RevertPatchChanges() definition below)
command! -nargs=0 -range RevertPatchChanges <line1>,<line2>call RevertPatchChanges()


"== Custom Functions ==

function! CImplementationSkel() range
	" Convert method definitions (as copied from a header file) to skeleton
	" implementations.

	let className = input("Class Name: ")
	execute a:firstline . "," . a:lastline . 's/^[[:space:]]*\%(\%(virtual\|explicit\)[[:space:]]\+\)\?\%(\([^[:space:]]\+\%(<[^>]*>\)\?\)[[:space:]]\+\)\?\([~]\?[a-zA-Z0-9_]\+\)[[:space:]]*\((.*)\)\%([[:space:]]*=[[:space:]]*0\)\?;[[:space:]]*$' .
		\ '/\1 ' . className . '::\2\3\r{\r} \/\/ end \2/'
endfunction


" Custom operator: join {motion} lines (like J, but accepts a {motion})
function! JoinOperator(type, ...)
	'[,']join
endfunction


" Build (:make) and then show the quickfix window if there's errors
function! Build()
	silent! make
	if exists('g:loaded_unite')
		top Unite -buffer-name="Quickfix\ List" qf
	else
		cwindow
	endif
endfunction


function! CounterUp(...)
	" Use in a search/replace to insert an incrementing counter in each match:
	" :s/^/\=CounterUp() . ': '/
	" To start the counter at a number other than 0, pass the number as an
	" argument:
	" :s/^/\=CounterUp(1) . ': '/
	" If using this inside a custom command or key binding, you'll want to
	" first `:unlet g:Counter` (otherwise, the counter may not be reset!)

	if !exists('g:Counter')
		" First time using this counter; set from argument, or 0 if not given
		if a:0
			let g:Counter = a:0
		else
			let g:Counter = 0
		endif
	endif

	let g:Counter = g:Counter + 1

	return g:Counter - 1
endfunction
" Delete g:Counter when entering the command window.
" (A rough [poor] approximation of "before any command that uses CounterUp()")
autocmd CmdwinEnter * unlet g:Counter

" Copied from `:help :map-expression`:
"let counter = 0
"inoremap <expr> <C-L> ListItem()
"inoremap <expr> <C-R> ListReset()
"
"func ListItem()
"	let g:counter += 1
"	return g:counter . '. '
"endfunc
"
"func ListReset()
"	let g:counter = 0
"	return ''
"endfunc


function! ScratchBuffer()
	new
	setlocal buftype=nofile bufhidden=hide noswapfile
endfunction


function! MinDiff()
	let l:opt = ''
	if &diffopt =~# 'icase'
		let l:opt = l:opt . '-i '
	endif
	if &diffopt =~# 'iwhite'
		let l:opt = l:opt . '-b '
	endif
	silent execute '!diff -a -d --binary ' . l:opt . v:fname_in . ' ' . v:fname_new . ' > ' . v:fname_out
endfunction
set diffexpr=MinDiff()


" When editing a patch/diff file, this will revert any changes in the given range.
" (deleting lines starting with '+', and changing a leading '-' to ' ')
function! RevertPatchChanges() range
	let l:viewInfo = winsaveview()

	let l:lastline = a:lastline
	exec 'silent! ' . a:firstline . ',' . l:lastline . 's/\%(\_^diff .*\n\%(\w\+ .*\n\|--- .*\n\|+++ .*\n\)*\)\@<!\_^-/ /'

	let l:lineCountBefore = line('$')
	exec 'silent! ' . a:firstline . ',' . l:lastline . 'g/\%(\_^diff .*\n\%(\w\+ .*\n\|--- .*\n\|+++ .*\n\)*\)\@<!\_^+/d'
	let l:lineCountAfter = line('$')
	let l:lastline += l:lineCountAfter - l:lineCountBefore

	exec 'silent! ' . a:firstline . ',' . l:lastline . 's/\n@@ -\d\+,\d\+ +\d\+,\d\+ @@.*\%(\n .*\)*\ze\%(\n@@ \|\ndiff \|\n\?\%$\)//'

	call winrestview(l:viewInfo)
endfunction


" Strip trailing whitespace on save by default.
let b:remove_trailing_whitespace_on_save=1
function! RemoveTrailingWhitespace()
	if exists('b:remove_trailing_whitespace_on_save') && b:remove_trailing_whitespace_on_save
		let l:viewInfo = winsaveview()

		" I don't know how to satisfy vint's linting rules for the following
		" command, so we just disable them for that line...
		" vint: -ProhibitCommandWithUnintendedSideEffect -ProhibitCommandRelyOnUser
		keeppatterns %s/\m\s\+$//eI
		" vint: +ProhibitCommandWithUnintendedSideEffect +ProhibitCommandRelyOnUser

		call winrestview(l:viewInfo)
	endif
endfunction


" Custom line folding for Python
function! PythonFoldText()
	let l:line = substitute(getline(v:foldstart), '^\s*\|\s*$', '', 'g')
	return '+' . v:folddashes . ' ' . l:line . '  <' . (v:foldend - v:foldstart) . 'L>'
endfunction


"== Autocmd Hacks ==
if has('autocmd')
	"= General Tweaks =

	" Have Vim jump to the last position when reopening a file
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exec "normal! g`\"" | endif

	"= Per-Filetype Configuration =

	" PEP 80 indentation and sane autoindent for Python code
	autocmd FileType python let python_highlight_all=1 | setl tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab nosmartindent omnifunc=pythoncomplete#Complete foldtext=PythonFoldText()
	" omnifunc=pythonsyntaxcomplete#Complete

	" Some tweaks for Erlang code
	autocmd FileType erlang setl tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab smarttab nosmartindent
	" indentexpr=CustomErlangIndent(v:lnum)

	" C# indentation
	autocmd FileType cs setl tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab nosmartindent

	" Similar for LUA
	autocmd FileType lua setl tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab nosmartindent

	" Google Protocol Buffers .proto files
	autocmd FileType proto setl tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab smartindent

	" Delphi source files (.pas)
	autocmd FileType pascal let pascal_delphi=1 | let pascal_symbol_operator=1 | setl tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab smartindent

	" Strip trailing whitespace on save for most files.
	autocmd BufWritePre * call RemoveTrailingWhitespace()

	" Don't remove trailing whitespace if editing a file type for which it may be important.
	autocmd FileType * let b:remove_trailing_whitespace_on_save=1
	autocmd FileType diff let b:remove_trailing_whitespace_on_save=0
	autocmd FileType markdown let b:remove_trailing_whitespace_on_save=0
	autocmd FileType whitespace let b:remove_trailing_whitespace_on_save=0

	" Enable custom key mappings for various filetypes.
	autocmd FileType * call FiletypeKeys()

	let g:plsql_completions = '/usr/share/rlwrap/completions/sqlplus'
	if filereadable(g:plsql_completions)
		" Set options and load auto-completion words for PL/SQL
		autocmd FileType plsql setl tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab smartindent cpt=.,k,w,b,u,t,i ignorecase smartcase | let &dict .= (len(&dict) ? ',' : '').plsql_completions.','.plsql_completions.'.all,'.plsql_completions.'.functions,'.plsql_completions.'.tables,'.plsql_completions.'.user,'.plsql_completions.'.utl_packages,'.plsql_completions.'.helptopics'
	else
		" Auto-completion words missing; only set options
		autocmd FileType plsql setl tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab smartindent cpt=.,k,w,b,u,t,i ignorecase smartcase
	endif

	" gtkrc indentation
	autocmd FileType gtkrc setl tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab nosmartindent cindent cinoptions=+0,c0,(s,#1,m1 cinkeys-=0#

	" Javascript indentation
	autocmd FileType javascript setl tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab nosmartindent cindent cinoptions=j1,J1,m1

	" Nginx configuration files
	autocmd FileType nginx setl tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab smarttab cindent cinoptions=j1,J1,m1 cinkeys-=0#

	" YAML files
	autocmd FileType yaml setl tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab

	" AWS config files (dosini filetype)
	autocmd FileType dosini let g:colorizer_hex_pattern = ['color\s*=\s*', '\%(\x\{3}\|\x\{6}\)', '\>'] | ColorHighlight!

	" Default omnicomplete function
	if exists('+omnifunc')
		autocmd Filetype * if &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
	endif
endif


"== Enable Filetype Features ==

" Have Vim load indentation rules and plugins according to the detected filetype
filetype plugin indent on

" Make sure we have syntax highlighting! (put this last so we're sure all autocmds are loaded)
syntax on


"== Default User Configuration ==
" I suggest using one of the above commands.
" If you're not an advanced Vim user using a Dvorak layout, you probably want
" to use the "Neutral" configuration.
if $USER ==? 'whitelynx' || $USER ==? 'dbronke' || $USER ==? 'davidb' || $USER ==? 'davidbronke' || $USER ==? 'CORP\dbronke'
	WhiteLynx
else
	Neutral
endif

augroup END
