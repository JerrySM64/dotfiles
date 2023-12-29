from libqtile import bar
from .widgets import *
from libqtile.config import Screen
from modules.keys import terminal
import os
import subprocess

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(
                    padding=3, 
                    linewidth=0, 
                    background="#111111"
                    ),
                widget.Image(
                    filename='~/.config/qtile/nix-snowflake.png',
                    margin=3,
                    background="#111111",
                    mouse_callbacks={
                        'Button1':
                        lambda: qtile.spawn("rofi -show combi")
                    }
                    ),
                widget.Sep(
                    padding=4,
                    linewidth=0,
                    background="#111111"
                    ), 
                widget.GroupBox(
                    highlight_method='line',
                    this_screen_border="#6a1b9a",
                    this_current_screen_border="#6a1b9a",
                    active="#ffffff",
                    inactive="#848e96",
                    background="#111111",
                    font='JetBrains Mono Regular 12',
                    ),
                widget.TextBox(
                    text = '',
                    padding = 0,
                    fontsize = 28,
                    foreground='#111111',
                    background='#222222'
                    ),    
                widget.Prompt(
                    foreground = '#ffffff',
                    background = '#222222',
                    font = 'JetBrains Mono Regular 12'
                    ),
                widget.Spacer(
                    length=5,
                    background='#222222'
                    ),
                widget.WindowName(
                    foreground='#99c0de',
                    background='#222222',
                    fmt='{}',
                    font='JetBrains Mono Regular 12'
                    ),
                widget.Chord(
                    chords_colors={
                        'launch': ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                    ),
                widget.TextBox(
                    text = '',
                    padding = 0,
                    fontsize = 28,
                    foreground='#111111',
                    background='#222222'
                    ), 
                widget.Spacer(
                    length=8,
                    background = '#111111'
                    ),
                widget.Systray(
                    icon_size = 20,
                    background='#111111'
                    ),
                widget.Spacer(
                    length=8,
                    background = '#111111'
                    ),
                widget.GenPollText(
                    func = lambda: subprocess.check_output("printf $(uname -r)", shell=True, text=True),
                    foreground = '#ffffff',
                    background = '#111111',
                    fmt = ' {}',
                    font='JetBrains Mono Regular 12',
                    mouse_callbacks={
                        'Button1':
                        lambda: qtile.spawn("kitty -e /home/Jerry/.config/qtile/scripts/kernel-widget-function.sh")
                    }
                    ),
                widget.Spacer(
                    length=8,
                    background = '#111111'
                    ),
                widget.CPU(
                    format = ' {load_percent}%',
                    foreground = '#00ff00',
                    background = '#111111',
                    font='JetBrains Mono Regular 12',
                    ),
                widget.Spacer(
                    length=8,
                    background = '#111111'
                    ),
                widget.Memory(
                    foreground = '#ffff00',
                    background = '#111111',
                    mouse_callbacks = {'Button1': lambda: qtile.spawn('kitty -e btop')},
                    format = '{MemUsed: .0f}{mm}',
                    fmt = ' {} used',
                    font='JetBrains Mono Regular 12',
                    ),
                widget.Spacer(
                    length=8,
                    background = '#111111'
                    ),
                widget.Volume(
                    foreground = '#9925be',
                    background = '#111111',
                    fmt = ' {}',
                    font='JetBrains Mono Regular 12',
                    ),
                widget.Sep(
                    padding=10,
                    linewidth=0,
                    background='#111111'
                    ),  
                widget.Clock(
                    format='󰥔 %a %d.%m.%Y %H:%M %p',
                    background="#111111",
                    foreground='#9bd689',
                    font='JetBrains Mono Regular 12',),
                widget.TextBox(
                    text='',
                    mouse_callbacks= {
                        'Button1':
                        lambda: qtile.spawn(os.path.expanduser('~/.config/rofi/powermenu.sh'))
                    },
                    foreground='#e39378',
                    background="#111111"
                    ),
                widget.Sep(
                    padding=10,
                    linewidth=0,
                    background='#111111'
                    ), 
                
            ],
            30,  # height in px
            background="#222222"  # background color
        ),
    ),
]
