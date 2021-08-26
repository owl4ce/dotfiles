#!/usr/bin/env perl

# obmenu-generator - schema file

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

## Text editor
my $editor = $CONFIG->{editor};

our $SCHEMA = [
    {sep => "QUICK START"},

    #         COMMAND                                                     LABEL                     ICON
    {beg  => ["Launch Apps",                                                                        "$ENV{HOME}/.icons/gladient/search.png"]},
    {cat  => ["utility",                                                  "Accessories",            "applications-utilities"]},
    {cat  => ["development",                                              "Development",            "applications-development"]},
    {cat  => ["education",                                                "Education",              "applications-science"]},
    {cat  => ["game",                                                     "Games",                  "applications-games"]},
    {cat  => ["graphics",                                                 "Graphics",               "applications-graphics"]},
    {cat  => ["audiovideo",                                               "Multimedia",             "applications-multimedia"]},
    {cat  => ["network",                                                  "Network",                "applications-internet"]},
    {cat  => ["office",                                                   "Office",                 "applications-office"]},
    {cat  => ["other",                                                    "Other",                  "applications-other"]},
    {cat  => ["settings",                                                 "Settings",               "applications-accessories"]},
    {cat  => ["system",                                                   "System",                 "applications-system"]},
    {end  => undef},
    
    {sep  => undef},
    
    {item => ["~/.scripts/default-apps/launch terminal",                  "Open Terminal",          "$ENV{HOME}/.icons/gladient/term.png"]},
    {item => ["~/.scripts/default-apps/launch filemanager",               "Open File Manager",      "$ENV{HOME}/.icons/gladient/file-manager.png"]},
    
    {sep  => undef},
    
    {beg  => ["Screenshot",                                                                         "$ENV{HOME}/.icons/gladient/shot.png"]},
    {item => ["~/.scripts/shot-now delay",                                "Now",                    "$ENV{HOME}/.icons/gladient/shot.png"]},
    {item => ["~/.scripts/shot-timer",                                    "After ..s",              "$ENV{HOME}/.icons/gladient/shot.png"]},
    {item => ["~/.scripts/shot-seldraw",                                  "Select window or draw",  "$ENV{HOME}/.icons/gladient/shot.png"]},
    {end  => undef},
    
    {sep  => undef},
    
    {pipe => ["~/.config/openbox/pipe-menu/ob-randr.py",                  "Monitor Settings",       "$ENV{HOME}/.icons/gladient/mon-settings.png"]},
    {obgenmenu => ["Advanced Settings",                                                             "$ENV{HOME}/.icons/gladient/settings.png"]},
    
    {sep  => undef},
    
    {sep => "SESSIONS"},
    
    {beg  => ["Theme Styling",                                                                      "$ENV{HOME}/.icons/gladient/themer.png"]},
    {item => ["~/.scripts/default-apps/launch terminal -e ~/.config/openbox/visual-mode/wally","Change Wallpaper","$ENV{HOME}/.icons/gladient/wally.png"]},
    {item => ["~/.config/openbox/visual-mode/termody",                    "Reverse Terminal Visual","$ENV{HOME}/.icons/gladient/term.png"]},
    {sep  => undef},
    {item => ["~/.scripts/default-apps/launch terminal -e ~/.config/openbox/visual-mode/ob-button","Change Button Style","$ENV{HOME}/.icons/gladient/obt-c.png"]},
    {item => ["~/.config/openbox/visual-mode/ob-button swap",             "Swap Button [L/R]",      "$ENV{HOME}/.icons/gladient/obt-s.png"]},
    {sep  => undef},
    {item => ["~/.config/openbox/visual-mode/mode-toggle minimal",        "Toggle Minimal Mode",    "$ENV{HOME}/.icons/gladient/minimal.png"]},
    {item => ["~/.config/openbox/visual-mode/mode-toggle",                "Switch Visual Mode",     "$ENV{HOME}/.icons/gladient/visual.png"]},
    {end  => undef},
    
    {sep  => undef},
    
    {item => ["~/.config/openbox/visual-mode/mode-toggle just_ui",        "Restart UI",             "$ENV{HOME}/.icons/gladient/re-ui.png"]},
    
    {sep  => undef},
    
    {item => ["~/.scripts/default-apps/launch lockscreen",                "Lockscreen",             "$ENV{HOME}/.icons/gladient/lock.png"]},
    
    {exit => ["Exit Openbox",                                                                       "$ENV{HOME}/.icons/gladient/logout.png"]},
]
