module.exports = {
    config: {
        // default font size in pixels for all tabs
        fontSize: 11,

        // font family with optional fallbacks
        fontFamily: '"Input Mono", Input, Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',

        // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
        cursorColor: 'rgba(248,28,229,0.75)',

        // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
        cursorShape: 'BLOCK',

        // color of the text
        foregroundColor: '#fff',

        // terminal background color
        //backgroundColor: '#000',
        //backgroundColor: '#80000000',
        backgroundColor: 'rgba(0, 0, 0, 0.5)',

        // border color (window, tabs)
        borderColor: '#333',

        // custom css to embed in the main window
        css: 'body { background-color: rgba(0,0,0,0.5) }',

        // custom css to embed in the terminal window
        termCSS: '',

        // custom padding (css format, i.e.: `top right bottom left`)
        padding: '0 1px',

        showHamburgerMenu: true,

        bell: false,

        // the full list. if you're going to provide the full color palette,
        // including the 6 x 6 color cubes and the grayscale map, just provide
        // an array here instead of a color map object
        colors: {
            black: '#000000',
            red: '#ff0000',
            green: '#33ff00',
            yellow: '#ffff00',
            blue: '#0066ff',
            magenta: '#cc00ff',
            cyan: '#00ffff',
            white: '#d0d0d0',
            lightBlack: '#808080',
            lightRed: '#ff0000',
            lightGreen: '#33ff00',
            lightYellow: '#ffff00',
            lightBlue: '#0066ff',
            lightMagenta: '#cc00ff',
            lightCyan: '#00ffff',
            lightWhite: '#ffffff'
        },

        // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
        // if left empty, your system's login shell will be used by default
        shell: '/usr/bin/fish',

        // for advanced config flags please refer to https://hyper.is/#cfg

        tabIcons: {
            mapIcons: {
                nodejs: ['node', 'n_'],
                python: ['python', 'ipython', 'IPython:'],
            }
        }
    },

    keymaps: {
        'moveWordLeft': 'ctrl+left',
        'moveWordRight': 'ctrl+right',
        'deleteWordLeft': 'ctrl+backspace',
        'deleteWordRight': 'ctrl+del',
    },

    // a list of plugins to fetch and install from npm
    // format: [@org/]project[#version]
    // examples:
    //   `hyperpower`
    //   `@company/project`
    //   `project#1.0.1`
    plugins: [
        //'hyperclean',
        //'hyperpower',
        //'hyperterm-dibdabs',
        'hyperterm-bold-tab',
        'hyperterm-tabs',
        'hyper-tab-icons',
        'hyperterm-cursor',
        'hyperterm-lastpass',
        'hyper-font-smoothing',
        'hyper-search',
        'hypercwd',
        'hyperlinks',
        'hyper-blink',
    ],

    // in development, you can create a directory under
    // `~/.hyper_plugins/local/` and include it here
    // to load it and avoid it being `npm install`ed
    localPlugins: [
        //'hyperterm-keys',
    ]
};
