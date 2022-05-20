#!/usr/bin/env perl

# FILE: ~/.config/obmenu-generator/schema.pl
# -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-
# DESC: obmenu-generator - schema file
# -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-
# aHR0cHM6Ly9naXRodWIuY29tL293bDRjZS9kb3RmaWxlcwo=

=for comment

    item:      add an item inside the menu               {item => ["command", "label", "icon"]},
    cat:       add a category inside the menu             {cat => ["name", "label", "icon"]},
    sep:       horizontal line separator                  {sep => undef}, {sep => "label"},
    pipe:      a pipe menu entry                         {pipe => ["command", "label", "icon"]},
    file:      include the content of an XML file        {file => "/path/to/file.xml"},
    raw:       any XML data supported by Openbox          {raw => q(...)},
    beg:       begin of a category                        {beg => ["name", "icon"]},
    end:       end of a category                          {end => undef},
    obgenmenu: generic menu settings                {obgenmenu => ["label", "icon"]},
    exit:      default "Exit" action                     {exit => ["label", "icon"]},

=cut

# NOTE:
#    * Keys and values are case sensitive. Keep all keys lowercase.
#    * ICON can be a either a direct path to an icon or a valid icon name
#    * Category names are case insensitive. (X-XFCE and x_xfce are equivalent)

require "$ENV{HOME}/.config/obmenu-generator/config.pl";

# Text editor
my $editor = $CONFIG->{editor};

our $SCHEMA = [
    {sep       => "QUICK START"},
    
    #              COMMAND                                                                                                      LABEL                                ICON
    {beg       => ["Launch Apps",                                                                                                                                    "$ENV{HOME}/.icons/Gladient/find.png"]},
    {cat       => ["utility",                                                                                                   "Accessories",                       "applications-utilities"]},
    {cat       => ["development",                                                                                               "Development",                       "applications-development"]},
    {cat       => ["education",                                                                                                 "Education",                         "applications-science"]},
    {cat       => ["game",                                                                                                      "Games",                             "applications-games"]},
    {cat       => ["graphics",                                                                                                  "Graphics",                          "applications-graphics"]},
    {cat       => ["audiovideo",                                                                                                "Multimedia",                        "applications-multimedia"]},
    {cat       => ["network",                                                                                                   "Network",                           "applications-internet"]},
    {cat       => ["office",                                                                                                    "Office",                            "applications-office"]},
    {cat       => ["other",                                                                                                     "Other",                             "applications-other"]},
    {cat       => ["settings",                                                                                                  "Settings",                          "applications-accessories"]},
    {cat       => ["system",                                                                                                    "System",                            "applications-system"]},
    {end       => undef},
    
    {sep       => undef},
    
    {item      => ["$ENV{HOME}/.scripts/launch-apps.sh terminal",                                                               "Open Terminal",                     "$ENV{HOME}/.icons/Gladient/terminal.png"]},
    {item      => ["$ENV{HOME}/.scripts/launch-apps.sh file_manager",                                                           "Open File Manager",                 "$ENV{HOME}/.icons/Gladient/file-manager.png"]},
    
    {sep       => undef},
    
    {beg       => ["Screenshot",                                                                                                                                     "$ENV{HOME}/.icons/Gladient/screenshot.png"]},
    {item      => ["$ENV{HOME}/.scripts/screenshot-screen.sh",                                                                  "Screen",                            "$ENV{HOME}/.icons/Gladient/screenshot.png"]},
    {item      => ["$ENV{HOME}/.scripts/screenshot-selection.sh",                                                               "Select or Draw",                    "$ENV{HOME}/.icons/Gladient/screenshot.png"]},
    {item      => ["$ENV{HOME}/.scripts/screenshot-countdown.sh",                                                               "Countdown ?s",                      "$ENV{HOME}/.icons/Gladient/screenshot.png"]},
    {end       => undef},
    
    {sep       => undef},
    
    {pipe      => ["$ENV{HOME}/.config/openbox/pipe-menu/ob-randr.py",                                                          "Monitor Settings",                  "$ENV{HOME}/.icons/Gladient/monitor-settings.png"]},
    {obgenmenu => ["Advanced Settings",                                                                                                                              "$ENV{HOME}/.icons/Gladient/advanced-settings.png"]},
    
    {sep       => undef},
    
    {sep       => "SESSIONS"},
    
    {beg       => ["Appearance",                                                                                                                                     "$ENV{HOME}/.icons/Gladient/appearance.png"]},
    {item      => ["$ENV{HOME}/.config/openbox/joyful-desktop/terminal-set.sh reverse",                                         "Reverse Terminal BG/FG",            "$ENV{HOME}/.icons/Gladient/terminal-reverse-visual.png"]},
    {item      => ["$ENV{HOME}/.scripts/launch-apps.sh terminal -e $ENV{HOME}/.config/openbox/joyful-desktop/wallpaper-set.sh", "Change X Wallpaper",                "$ENV{HOME}/.icons/Gladient/wallpaper.png"]},
    {sep       => undef},
    {item      => ["$ENV{HOME}/.scripts/launch-apps.sh terminal -e $ENV{HOME}/.config/openbox/joyful-desktop/ob-button-set.sh", "Change Window Button-Style",        "$ENV{HOME}/.icons/Gladient/ob-button-change.png"]},
    {item      => ["$ENV{HOME}/.config/openbox/joyful-desktop/ob-button-set.sh swap",                                           "Swap Window Button-Location",       "$ENV{HOME}/.icons/Gladient/ob-button-swap.png"]},
    {sep       => undef},
    {item      => ["$ENV{HOME}/.config/openbox/joyful-desktop/toggle-mode.sh mode",                                             "Toggle Mode",                       "$ENV{HOME}/.icons/Gladient/mode.png"]},
    {item      => ["$ENV{HOME}/.config/openbox/joyful-desktop/toggle-mode.sh",                                                  "Switch Theme",                      "$ENV{HOME}/.icons/Gladient/theme.png"]},
    {end       => undef},
    
    {sep       => undef},
    
    {item      => ["$ENV{HOME}/.config/openbox/joyful-desktop/toggle-mode.sh apply",                                            "Restart UI",                        "$ENV{HOME}/.icons/Gladient/restart-ui.png"]},
    
    {sep       => undef},
    
    {item      => ["loginctl --no-ask-password lock-session",                                                                   "Lock",                              "$ENV{HOME}/.icons/Gladient/lock.png"]},
    
    {sep       => undef},
    
    {exit      => ["Exit Openbox",                                                                                                                                   "$ENV{HOME}/.icons/Gladient/logout.png"]},
]
