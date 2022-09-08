#!/usr/bin/env python

import os
import random
import subprocess
import sys

WALLPAPER_DIR = os.path.expanduser('~/Pictures/Wallpaper/pexels')

wallpaper_file = random.choice(os.listdir(WALLPAPER_DIR))
result = subprocess.run(['swaymsg', f'output * bg "{WALLPAPER_DIR}/{wallpaper_file}" fill'])
sys.exit(result.returncode)
