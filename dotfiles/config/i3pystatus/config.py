'''i3pystatus config

'''
from i3pystatus import Status

status = Status(standalone=True)  # pylint: disable=invalid-name

status.register(
    "clock",
    color="#888888",
    format=('%a %Y-%m-%d <span color="#0099ff">%H:%M:%S</span> Boston', 'America/New_York'),
    hints={"markup": "pango"})

status.register(
    "moon",
    format="{status}",
    #format='<span font="MoonPhase 8">{status}</span>',
    status={
        # Technically, these symbols are matched up in reverse (e.g., the "full moon" symbol is used for "New Moon")
        # because this is going to be drawn in a light color on a black background, instead of black on white.
        'New Moon':        '🌕',
        'Waxing Crescent': '🌖',
        'First Quarter':   '🌗',
        'Waxing Gibbous':  '🌘',
        'Full Moon':       '🌑',
        'Waning Gibbous':  '🌒',
        'Last Quarter':    '🌓',
        'Waning Crescent': '🌔'
    },
    #hints={"separator": False})
    hints={"separator": False, "markup": "pango"})

status.register(
    "clock",
    color="#555555",
    format=('%a %Y-%m-%d <span color="#005588">%H:%M:%S</span> Berlin', 'Europe/Berlin'),
    hints={"separator": False, "markup": "pango"})

#status.register("load")

status.register(
    "cpu_usage_graph",
    graph_style='blocks',
    #graph_style='braille-peak',
    #graph_style='braille-snake',
    #graph_style='braille-fill',
    graph_width=60,
    interval=0.5,
    #format='<span font="Braille 10" font_stretch="ultracondensed" letter_spacing="-1024">{cpu_graph}</span>',
    #format='<span font="creep 14">{cpu_graph}</span>',
    #format='<span font="VerticalBar 8">{cpu_graph}</span>',
    format=' <span font="SlimBarGraph 8">{cpu_graph}</span>',
    hints={"markup": "pango"})

status.register(
    "temp",
    format=" {temp:.1f}°C")

status.register("gpu_temp")

status.register(
    "battery",
    format="{status} {percentage:.1f}% ({percentage_design:.1f}%) {remaining}",
    status={
        "DPL": "",  # "Depleted", since the abbreviation isn't directly obvious.
        "DIS": "⬇",
        "CHR": "",
        "FULL": "",
    },
    alert=True,
    alert_percentage=13,
    critical_level_percentage=7,
    critical_level_command="sudo systemctl hybrid-sleep")

# Note: the network module requires PyPI package netifaces
status.register(
    "network",
    interface="enp61s0",
    format_up=" {v4}",
    format_down="")
status.register(
    "network",
    interface="enp0s20f0u5",
    format_up=" {v4}",
    format_down="")
status.register(
    "network",
    interface="enp0s20f0u2",
    format_up=" {v4}",
    format_down="")

# Note: requires both netifaces and basiciw (for essid and quality)
status.register(
    "network",
    interface="wlp62s0",
    format_up=" {essid} ▪ {quality:.1f}% ▪ {v4}",
    format_down="")

status.register(
    "disk",
    path="/",
    format=" {used}/{total}G [{avail}G]")

status.register(
    "keyboard_locks",
    caps_on='<span bgcolor="yellow" color="black">CAPS</span>',
    caps_off='',
    num_on='<span bgcolor="green" color="black">NUM</span>',
    num_off='',
    scroll_on='<span bgcolor="blue" color="black">SCR</span>',
    scroll_off='',
    color="#888888",
    hints={"markup": "pango"})

status.register(
    "pulseaudio",
    format=" {volume}% ({db} dB)",
    format_muted=" MUTE")

# Note: requires pyalsaaudio from PyPI
status.register(
    "alsa",
    format=" {volume}%",
    format_muted=" MUTE")

status.run()
