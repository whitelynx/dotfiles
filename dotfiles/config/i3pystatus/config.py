from i3pystatus import Status

status = Status(standalone=True)

# Displays clock like this:
# Tue 2014-07-30 23:59:46 -6:00
status.register("clock",
    color="#888888",
    #format="%a %-d %b %X KW%V",
    format=('%a %Y-%m-%d <span color="#0099ff">%H:%M:%S</span> Boston', 'America/New_York'),
    hints={"markup": "pango"})

status.register("moon",
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

status.register("clock",
    color="#555555",
    #format="%a %-d %b %X KW%V",
    format=('%a %Y-%m-%d <span color="#005588">%H:%M:%S</span> Berlin', 'Europe/Berlin'),
    hints={"separator": False, "markup": "pango"})

# Shows the average load of the last minute and the last 5 minutes
# (the default value for format is used)
#status.register("load")

# Graph CPU usage
status.register("cpu_usage_graph",
    graph_style='blocks',
    #graph_style='braille-peak',
    #graph_style='braille-snake',
    #graph_style='braille-fill',
    graph_width=60,
    interval=0.5,
    #format='<span font="Braille 10" font_stretch="ultracondensed" letter_spacing="-1024">{cpu_graph}</span>',
    #format='<span font="creep 14">{cpu_graph}</span>',
    #format='<span font="VerticalBar 8">{cpu_graph}</span>',
    format='<span font="SlimBarGraph 8">{cpu_graph}</span>',
    hints={"markup": "pango"})

# Shows your CPU temperature, if you have a Intel CPU
status.register("temp",
    format="🌡 {temp:.1f}°C")

# GPU temp
#status.register("gpu_temp")

# This would look like this when discharging:
# 🔋⬇ 77.81% [56.15%] 2h:41m
# Like this when charging:
# 🔋⚡🔌 92.24% [74.33%] 22m
# And like this if full:
# 🔋𝍤 100.0% [91.21%]
#
# This would also display a desktop notification (via D-Bus) if the percentage
# goes below 5 percent while discharging. The block will also color RED.
# If you don't have a desktop notification daemon yet, take a look at dunst:
#   http://www.knopwob.org/dunst/
status.register("battery",
    format="{status} {percentage:.1f}% ({percentage_design:.1f}%) {remaining}",
    status={
        "DPL": "🔋⃠",  # "Depleted", since the abbreviation isn't directly obvious.
        "DIS": "🔋⬇",
        "CHR": "🔋⚡🔌",
        "FULL": "🔋𝍤",
    },
    alert=True,
    alert_percentage=13,
    critical_level_percentage=7,
    critical_level_command="sudo systemctl hybrid-sleep")

# Displays internet connection status
#status.register("online")

# Shows the address and up/down state of eth0. If it is up the address is shown in
# green (the default value of color_up) and the CIDR-address is shown
# (i.e. 10.10.10.42/24).
# If it's down just the interface name (eth0) will be displayed in red
# (defaults of format_down and color_down)
#
# Note: the network module requires PyPI package netifaces
status.register("network",
    interface="enp61s0",
    format_up="🖧 {v4}",
    format_down="🖧")

status.register("network",
    interface="enp0s20f0u5",
    format_up="🖧 {v4}",
    format_down="🖧")

# Note: requires both netifaces and basiciw (for essid and quality)
status.register("network",
    interface="wlp62s0",
    format_up="📶 {essid} {quality:.1f}% {v4}",
    format_down="📶")

# Shows disk usage of /
# Format:
# 42/128G [86G]
status.register("disk",
    path="/",
    format="{used}/{total}G [{avail}G]")

# Show the current state of the keyboard locks
status.register("keyboard_locks",
    caps_on='<span bgcolor="yellow" color="black">CAPS</span>',
    caps_off='',
    num_on='<span bgcolor="green" color="black">NUM</span>',
    num_off='',
    scroll_on='<span bgcolor="blue" color="black">SCR</span>',
    scroll_off='',
    color="#888888",
    hints={"markup": "pango"})

# Shows pulseaudio default sink volume
#
# Note: requires libpulseaudio from PyPI
#status.register("pulseaudio",
#    format="♪{volume}")

# Shows alsa default mixer volume
#
# Note: requires pyalsaaudio from PyPI
status.register("alsa",
    format="🔉 {volume}%",
    format_muted="🔇 MUTE")

# Shows mpd status
# Format:
# Cloud connected▶Reroute to Remain
#status.register("mpd",
#    format="{title}{status}{album}",
#    status={
#        "pause": "▷",
#        "play": "▶",
#        "stop": "◾",
#    })

status.run()
