if exists("did_load_filetypes")
	finish
endif

augroup filetypedetect
	" autocmd! commands to set the filetype go here
	autocmd! BufNewFile,BufRead *.bat,*.sys setfiletype dosbatch

	" Detect wscript files as Python code
	autocmd! BufNewFile,BufRead wscript setfiletype python

	" Detect Pyrex/Cython files as Python code (even though that's only
	" partially true)
	autocmd! BufNewFile,BufRead *.pyx *.px[id] setfiletype python

	" Detect Scons files as Python code
	autocmd! BufNewFile,BufRead Sconstruct setfiletype python
	autocmd! BufNewFile,BufRead Sconscript setfiletype python

	" Detect WSGI scripts as Python code
	autocmd! BufNewFile,BufRead *.wsgi setfiletype python

	" Detect Twisted application files as Python code
	autocmd! BufNewFile,BufRead *.tac setfiletype python

	" Detect JSON files
	autocmd! BufNewFile,BufRead *.json,.jshintrc,.bowerrc,*.mml setfiletype json
	" Detect JSON files as JavaScript
	"autocmd! BufNewFile,BufRead *.json,.jshintrc,.bowerrc,*.mml setfiletype javascript

	" Detect CSON files as CoffeeScript
	autocmd! BufNewFile,BufRead *.cson setfiletype coffee

	" Detect YAML files
	"autocmd! BufNewFile,BufRead *.gyp,*.gypi setfiletype yaml
	autocmd! BufNewFile,BufRead *.raml setfiletype yaml

	" Detect Riot.js tag files
	" Using https://github.com/nicklasos/vim-jsx-riot:
	"autocmd! BufNewFile,BufRead *.tag setfiletype javascript | let b:syntastic_checkers = []
	" Using my own syntax:
	autocmd! BufNewFile,BufRead *.tag setfiletype htmlriot | let b:syntastic_checkers = ['jshint']

	" Detect authrc files
	autocmd! BufNewFile,BufRead .authrc setfiletype json

	" Detect Tumblr themes
	autocmd! BufNewFile,BufRead *.tumblr.html setfiletype tumblr

	" Detect html files as Django templates (most of my HTML work is in Django)
	autocmd! BufNewFile,BufRead *.html setfiletype htmldjango

	" Detect librocket's XHTML and CSS files correctly.
	autocmd! BufNewFile,BufRead *.rml setfiletype xhtml
	autocmd! BufNewFile,BufRead *.rcss setfiletype css

	" Detect Weex components as Vue.js files.
	autocmd! BufNewFile,BufRead *.we setfiletype vue.html.javascript.css

	" Detect configuration templates as straight configuration files
	autocmd! BufNewFile,BufRead *.conf.in setfiletype cfg

	" freetds.conf is (mostly) in INI format
	autocmd! BufNewFile,BufRead freetds.conf setfiletype dosini

	" cSound syntax and templates
	autocmd! BufNewFile,BufRead *.orc,*.sco,*.csd source $VIMRUNTIME/syntax/csound.vim
	autocmd! BufNewFile,BufRead *.csd source $VIMRUNTIME/macros/csound_macros.vim
	autocmd! BufNewFile *.csd 0r $VIMRUNTIME/templates/template.csd
	autocmd! BufNewFile *.orc 0r $VIMRUNTIME/templates/template.orc

	" Piklab's project files are XML
	autocmd! BufNewFile,BufRead *.piklab setfiletype xml

	" Drools (JBoss Rules) rules set
	autocmd! BufNewFile,BufRead *.drl setfiletype drools

	" Extra Erlang file extensions not normally auto-detected
	autocmd! BufNewFile,BufRead *.{xrl,yrl,app.src},rebar.config,reltool.config,app.config,.erlang setfiletype erlang

	" Markdown file extensions
	autocmd! BufNewFile,BufRead *.markdown,*.md,*.mdown,*.mkd,*.mkdn setfiletype markdown

	" PEG.js grammar
	autocmd! BufNewFile,BufRead *.pegjs setfiletype pegjs

	" Mail
	autocmd! BufNewFile,BufRead *mutt-* setfiletype mail

	" PostgreSQL
	autocmd! BufNewFile,BufRead *.psql setfiletype pgsql
	autocmd! BufNewFile,BufRead *.pgsql setfiletype pgsql

	" Google Protocol Buffers
	autocmd! BufNewFile,BufRead *.proto setfiletype proto

	" Shaders
	autocmd! BufNewFile,BufRead *.{cg,fx,sha} setfiletype cg
	autocmd! BufNewFile,BufRead *.{frag,vert,fp,vp,glsl} setfiletype glsl

	" DBus configuration
	autocmd! BufNewFile,BufRead /etc/dbus-1/*.conf setfiletype xml
	autocmd! BufNewFile,BufRead /etc/dbus-1/{system,session}.d/*.conf setfiletype xml

	" Systemd configuration
	autocmd! BufNewFile,BufRead */systemd/*.* setfiletype dosini

	" Nginx configuration
	autocmd! BufNewFile,BufRead */nginx{,-*}/*,{,*.}nginx{,.*}.conf setfiletype nginx

	" Oracle SQL*Plus temporary file
	autocmd! BufNewFile,BufRead afiedt.buf setfiletype plsql

	" Dockerfiles with suffixes
	autocmd! BufNewFile,BufRead Dockerfile.*,Dockerfile-* setfiletype dockerfile
augroup END
