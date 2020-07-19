#!/usr/bin/perl

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
    
    #          COMMAND                                     LABEL                ICON
    {item => ["exo-open --launch TerminalEmulator",       "Open Terminal",         "utilities-terminal"]},
    
    {beg  => ["Launch Apps", "launch"]},
    #          NAME            LABEL                ICON
    {cat => ["utility",     "Accessories", "applications-utilities"]},
    {cat => ["development", "Development", "applications-development"]},
    {cat => ["education",   "Education",   "applications-science"]},
    {cat => ["game",        "Games",       "applications-games"]},
    {cat => ["graphics",    "Graphics",    "applications-graphics"]},
    {cat => ["audiovideo",  "Multimedia",  "applications-multimedia"]},
    {cat => ["network",     "Network",     "applications-internet"]},
    {cat => ["office",      "Office",      "applications-office"]},
    {cat => ["other",       "Other",       "applications-other"]},
    {cat => ["settings",    "Settings",    "applications-accessories"]},
    {cat => ["system",      "System",      "applications-system"]},
    {end  => undef},
    
    {sep  => undef},
    
    # Visual Mode
    {beg  => ["Visual Mode", "lookswitcher"]},
    {item => ["bash -c '~/.config/openbox/visual-mode/set-mechanical'" , "Mechanical Theme" , "keyboard"]},
    {item => ["bash -c '~/.config/openbox/visual-mode/set-eyecandy'"   , "Eyecandy Theme"   , "applications-graphics"]},
    {end  => undef},
    
    {pipe => ["python2 ~/.config/openbox/pipe-menu/ob-randr.py", "Monitor Settings", "system-config-display"]},
    {obgenmenu => ["Advanced Settings", "applications-engineering"]},
    
    # SESSIONS
    {sep => "SESSIONS"},
    
    # Pipe Menu
    #{pipe => ["~/.config/openbox/pipe-menu/date-menu.sh"                    , "Show Date"           , "date"]},
    #{pipe => ["bash -c '~/.config/openbox/pipe-menu/battery.sh'"            , "Battery Info"        , "battery"]},
    #{pipe => ["python2 ~/.config/openbox/pipe-menu/show_ob_keybindings.py"  , "Show Keybindings"    , "keyboard"]},
    #{pipe => ["python2 ~/.config/openbox/pipe-menu/ob-cpufreq.py"           , "HW Info"      , "cpu"]},
    #{pipe => ["perl ~/.config/openbox/pipe-menu/ob-sysinfo.pl"              , "System Info"         , "dialog-information"]},
    
    # Screenshot Menu
    {beg  => ["Screenshot"                                                    , "deepin-screenshot"]},
    {item => ["bash -c '~/.scripts/shot-now'"     , "Shot now"                , "deepin-screenshot"]},
    {item => ["bash -c '~/.scripts/shot-5sec'"    , "Shot in 5s"              , "deepin-screenshot"]},
    {item => ["bash -c '~/.scripts/shot-seldraw'" , "Select window or draw"   , "deepin-screenshot"]},
    {end  => undef},
    
    {sep  => undef},
    
    # Lockscreen Menu
    {item => ["bash -c '~/.scripts/lockscreen'", "Lockscreen", "system-lock-screen"]},
    
    # Logout Menu    
    {exit => ["Exit Openbox", "application-exit"]},

    ## This uses the "oblogout" menu
    # {item => ["oblogout", "Exit", "application-exit"]},
]
