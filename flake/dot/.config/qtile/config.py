from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, ScratchPad, DropDown, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile import qtile
#from libqtile.command import lazy
from qtile_extras import widget
from datetime import datetime
import iwlib
import dbus_next
#import pytz
#from pytz import timezone

## Mouse Callback functions ##
#def spawn_pulsemixer():
#    qtile.spawn("pavucontrol")
## Mouse Callback functions end ##

mod = "mod4"
terminal = "kitty"
White = '#FFFFFF'
LightPink = '#FFB6C1'
Lavender = '#E6E6FA'
Peach = '#FFDAB9'
MintGreen = '#98FB98'
BabyBlue = '#89CFF0'
PaleYellow = '#FFFF99'
LightPurple = '#B19CD9'
LightGreen = '#90EE90'
LightCoral = '#F08080'
PaleTurquoise = '#AFEEEE'
LightGray = '#D3D3D3'
Black = '#000000'
Magenta = '#FF0088'

darkbar = "#12121299"
macbar = "#EFEFEFDD"
fshadow = "#444440"
inactivec = "#888880"

color1 = Black
color2 = Black
colorsup = MintGreen

barcolor = macbar
primarytext = Black
alt_text = LightCoral

## Top bar widget variables ##
cpu = widget.CPUGraph(
    padding=5,
    border_color=Black,
    graph_color=color1,
    fill_color=White,
    border_width=1,
    type='line',
    line_width=2
)
mem = widget.MemoryGraph(
    padding=5,
    border_color=Black,
    graph_color=color1,
    fill_color=White,
    border_width=1,
    type='line',
    line_width=2
)
clock = widget.Clock(
    padding=5,format="%m-%d %a %I:%M %p",
    font="Ubuntu Bold",
    fontshadow=fshadow,
    foreground=primarytext,
    fontsize=24
)
crl = widget.CurrentLayoutIcon(
    scale=0.7,
    use_mask=True,
    foreground=primarytext
)

gbox = widget.GroupBox(
    disable_drag=True,
    center_aligned=False,
    font="Ubuntu",
    fontshadow=fshadow,
    fontsize=26,
    margin_y=3,
    margin_x=0,
    padding_y=0,
    padding_x=3,
    borderwidth=1,
    active=color1,
    inactive=inactivec,
    highlight_method="text",
    this_current_screen_border=Magenta,
    this_screen_border=White,
    other_current_screen_border=MintGreen,
    other_screen_border=PaleTurquoise,
    foreground=primarytext,
    urgent_border=Black,
)

gbox2 = widget.GroupBox(
    disable_drag=True,
    center_aligned=False,
    font="Ubuntu",
    fontshadow=fshadow,
    fontsize=26,
    margin_y=3,
    margin_x=0,
    padding_y=0,
    padding_x=3,
    borderwidth=1,
    active=color1,
    inactive=inactivec,
    highlight_method="block",
    this_current_screen_border=colorsup,
    this_screen_border=White,
    other_current_screen_border='#f777f7',
    other_screen_border=Magenta,
    foreground=primarytext,
    urgent_border=Black,
)

task = widget.TaskList(
    title_width_method='uniform',
    border=color1,
    borderwidth=1.5,
    highlight_method='border',
    icon_size=0,
    font="Ubuntu",
    fontsize=22,
    urgent_border="#AEC6CF",
    foreground=primarytext,
    margin=1.6,
)
clip = widget.Clipboard(
    max_width=45,
    font="Ubuntu",
    fontsize=24,
    timeout=0,
    foreground=primarytext,
)
bat = widget.Battery(
    font="Ubuntu",
    fontsize=24,
    foreground=primarytext,
    format='{char} {percent:2.0%}'
)

net = widget.Net(
    font="Ubuntu",
    fontsize=24,
    interface="wlp1s0",
    format='{down:6.2f}{down_suffix:<2}↓↑{up:6.2f}{up_suffix:<2}',
    foreground=primarytext,
)

pulse = widget.Volume(
    padding=5,
    update_interval=0.005,
    font="Ubuntu",
    foreground=primarytext,
    fontsize=24,
)

pex = widget.PulseVolume(
    padding=5,
    #update_interval=0.2,
    font="Ubuntu",
    foreground=primarytext,
    fontsize=24,
    #mouse_callbacks={'Button1': spawn_pulsemixer}
)

sep = widget.Sep(
    padding=5
)

sp = widget.TextBox(
    "Sp:",
    font="Ubuntu Bold",
    fontshadow=fshadow,
    foreground=primarytext,
    fontsize=24
)

spa = widget.Spacer(
    length=5,
)

wifi = widget.WiFiIcon(
    interface='wlp1s0',
    active_colour=primarytext,
    foreground=primarytext,
    font='Ubuntu',
    inactive_colour=inactivec
)

## Top bar widget variables end##

## Top bar variables ##
sc1 = Screen(
    top=bar.Bar([
        spa,
        spa,
        crl,
        gbox,
        sep,
        task,
        clip,
        sep,
        cpu,
        mem,
        sep,
        sp,
        pex,
        sep,
        clock,
        sep,
        bat,
        sep,
        wifi,
        spa,
    ],
        size=35,
        background=barcolor,
        # background="#333333BB",
    ),
)

sc2 = Screen(
    top=bar.Bar([
        spa,
        spa,
        crl,
        gbox,
        sep,
        clip,
        sep,
        cpu,
        mem,
        sep,
        sp,
        pex,
        sep,
        clock,
        sep,
        bat,
        sep,
        wifi,
        spa,
    ],
        size=35,
        background=barcolor,
        # background="#333333BB",
    ),
)
## Top bar variables end ##


keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus to down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus to up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),

    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "BackSpace", lazy.spawn("neovide"), desc="Launch neovide"),

    Key([mod], "period", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "comma", lazy.prev_layout(), desc="Toggle between layouts"),

    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),

    # Custom keybindings

    Key([mod], "d", lazy.spawn("dmenu_run -fn 'Terminus:size=12' -nb '#EFEFEF' -nf '#000000'")),
    Key([mod], "b", lazy.spawn("librewolf")),
    Key([mod], "a", lazy.spawn("arandr")),
    Key([mod], "v", lazy.spawn("virt-manager")),
    Key([mod], "e", lazy.spawn("pcmanfm")),

    Key([mod], "f", lazy.window.toggle_fullscreen()),

    Key([mod, "shift"], "f", lazy.spawn("flameshot gui")),

    #Key([mod, "shift"], "period", lazy.spawn("kitty --execute 'pulsemixer'")),
    #Key([mod, "shift"], "comma", lazy.spawn("kitty --execute 'gtop'")),
###
    Key([mod], "slash", lazy.window.toggle_maximize(), desc="Toggle maximize"),
    Key([mod, "control"], "m", lazy.window.toggle_minimize(), desc="Toggle minimize"),

    # switch focus to next/prev monitor
    Key([mod], 'Tab', lazy.next_screen(), desc='Next monitor'),

    Key([mod, "control"], "f", lazy.window.toggle_floating(), desc="Toggle floating",),

    Key([mod, "control"], "l",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "h",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "k",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "j",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),
        Key([mod], "y", lazy.group["y"].toscreen()),
        Key([mod], "u", lazy.group["u"].toscreen()),
        Key([mod], "i", lazy.group["i"].toscreen()),
        Key([mod], "o", lazy.group["o"].toscreen()),
        Key([mod], "p", lazy.group["p"].toscreen()),
        Key([mod], "n", lazy.group["n"].toscreen()),
        Key([mod], "m", lazy.group["m"].toscreen()),
        Key([mod], "x", lazy.group["x"].toscreen()),


        Key([mod, "shift"], "y", lazy.window.togroup("y", switch_group=True)),
        Key([mod, "shift"], "u", lazy.window.togroup("u", switch_group=True)),
        Key([mod, "shift"], "i", lazy.window.togroup("i", switch_group=True)),
        Key([mod, "shift"], "o", lazy.window.togroup("o", switch_group=True)),
        Key([mod, "shift"], "p", lazy.window.togroup("p", switch_group=True)),
        Key([mod, "shift"], "n", lazy.window.togroup("n", switch_group=True)),
        Key([mod, "shift"], "m", lazy.window.togroup("m", switch_group=True)),
        Key([mod, "shift"], "x", lazy.window.togroup("x", switch_group=True)),

        Key([mod], "semicolon", lazy.group['scratchpad'].dropdown_toggle('term')),
        Key([mod], "apostrophe", lazy.group['scratchpad'].dropdown_toggle('vim')),
        Key([mod, "control"], "period", lazy.group['scratchpad'].dropdown_toggle('pavu')),
        Key([mod, "control"], "comma", lazy.group['scratchpad'].dropdown_toggle('blueman')),
]

groups = [
    Group(
        "y",
        label="T2",
        layout='monadwide',
        matches=[Match(wm_class=["emacs" ])]
    ),  # Group 3
    Group(
        "u",
        label="T1",
        layout='spiral',
        # matches=[Match(wm_class=["kitty"])]
    ),
    Group(
        "i",
        label="WWW",
        layout='columns',
        matches=[Match(wm_class=["libreWolf", "Navigator", "firefox", "chromium"])]
    ),  # Group 1
    Group(
        "o",
        label="CTL",
        layout='max',
        matches=[Match(wm_class=[
            "arandr",
            # "pavucontrol",
            "nitrogen",
            "pulsemixer",
            "gtop",
            "htop",
            "xbindkeys-config",
            "xinput-gui"
        ])]
    ),
    Group(
        "p",
        label="UTIL",
        layout='max',
        matches=[Match(wm_class=["libreoffice",
            "Meld",
            "org.remmina.Remmina",
            "gnome-multi-writer",
            "wireshark",
            "putty",
            "GParted",
            "bottles",
            ".arandr-wrapped",
            # ".blueman-manager-wrapped"
        ])]
    ),
    Group(
        "n",
        label="FILE",
        layout='max',
        matches=[Match(wm_class=["pcmanfm", "evince"])]
    ),
    Group(
        "m",
        label="VIRSH",
        layout='max',
        matches=[Match(wm_class=["virt-manager"])]
    ),  # Group 7
    Group(
        "x",
        label="GFX",
        layout='max',
        matches=[Match(wm_class=[
            "Signal",
            "discord",
            "greenlight",
            "ardour-8.6.0",
            "bitwig",
            "gns3",
            "obs",
            "gns3-gui",
            "steam",
            "drawing",
            "mscore",
            "kdenlive",
            "gzdoom",
            "lutris",
            ".gamescope-wrapped",
            "mixxx",
            "dolphin-emu",
            "Ryujinx",
            "AppRun",
        ])]
    ),


    ScratchPad("scratchpad", [
        DropDown("pavu", "pavucontrol", opacity=0.9, height=0.6, on_focus_lost_hide=False),
        DropDown("blueman", "blueman-manager", opacity=0.9, height=0.6, on_focus_lost_hide=False),
        DropDown("term", "kitty", opacity=0.9, height=0.6, on_focus_lost_hide=False),
        DropDown(
            "vim",
            "kitty -e nvim",
            x=0.05,
            y=0.15,
            width=0.9,
            height=0.85,
            opacity=0.9,
            on_focus_lost_hide=False
        )
    ]),
]

layouts = [
    layout.Columns(
        split=False,
        margin=3,
        border_width=2,
        #border_focus=White,
        #border_normal=Black,
        border_focus_normal=Black,
        border_focus_stack=White,
        num_columns=2,
    ),
    # layout.Bsp(border_width=0, margin=2),
    # layout.Matrix(columns=1),
    # layout.Stack(num_stacks=2, border_width=0, border_focus=Black),
    layout.Spiral(
        border_width=0,
        margin=5,
        main_pane="top",
        clockwise=False,
        new_client_position="after_current",
        ratio=0.57
    ),
    layout.MonadTall(border_width=0, border_focus=Black, margin=5),
    layout.MonadWide(border_width=0, border_focus=White, margin=5),
    # layout.MonadThreeCol(),
    # layout.ScreenSplit(),
    # layout.Slice(),
   #  layout.TreeTab(
   #       vspace=10,
   #       font='Ubuntu Bold Bold',
   #       fontsize=15,
   #       sections=[''],
   #       panel_width=115,
   #       inactive_bg='#808080',
   #       inactive_fg=White,
   #       active_bg=White,
   #       active_fg=Black,

   #   ),
    #layout.Tile(add_on_top=False),
    #layout.RatioTile(),
    layout.Floating(border_width=1, border_focus=White,),
    layout.Max(margin=2),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="sans",
    fontsize=17,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    sc1,
    sc2,
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = True
floating_layout = layout.Floating(border_width=1, border_focus=White,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        # Match(wm_class="neovide"),  # gitk
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="vlc"),  # gitk
        Match(wm_class="pavucontrol"),  # gitk
        Match(wm_class=".blueman-manager.wrapped"),  # gitk
        Match(wm_class="Alacritty"),  # gitk
        Match(wm_class="feh"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
  #  auto_fullscreen = True

)
auto_fullscreen = True
focus_on_window_activation = 'focus'
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
