# Version:: $Id: data/subtle.rb,v 2978 2011/08/02 11:16:25
# # License:: GNU GPLv2
# == Options
set :step, 5 
set :snap, 1
set :gravity, :center
set :urgent, true
set :resize, true
set :tiling, false
set :wmname, "LG3D" 

# == Screen http://subforge.org/projects/subtle/wiki/Multihead http://subforge.org/projects/subtle/wiki/Panel
screen 1 do
  top    [:views, :separator, :battery, :center, :title, :separator, :clock2, :separator, :cpu,  :separator, :memory, :separator, :mpd, :tray, :wifi]
 # bottom [:center, :battery, :cpu, :memory, :mpd, :tray, :wifi]
end

begin
  require "#{ENV["HOME"]}/.config/subtle/subtle-contrib/ruby/selector.rb"
  
  Subtle::Contrib::Selector.font  = "xft:Source Code Pro Medium"
rescue LoadError
end

# == Styles http://subforge.org/projects/subtle/wiki/Styles
background      =  "#333333"
client_active   =  "#ebebeb"
client_inactive =  "#CCFF00"
focus_bg        =  "#1C1C1C"
focus_fg        =  "#ff3200"
focus_ic        =  "#ff3200"
focus_border    =  "#CCFF00"
occupied_bg     =  "#666666"
occupied_fg     =  "#FF6600"
occupied_ic     =  "#358bde"
panel_bottom    =  "#333333"
panel_top       =  "#333333"
separator_bg    =  "#333333"
separator_fg    =  "#3399FF"
stipple         =  "#757575"
sublets_bg      =  "#333333"
sublets_fg      =  "#CCFF33"
sublets_ic      =  "#7c7c72"
title_bg        =  "#333333"
title_fg        =  "#CCFF00"
urgent_bg       =  "#333333"
urgent_fg       =  "#ffffff"
urgent_ic       =  "#CC9999"
views_bg        =  "#333333"
views_bo        =  "#66CC00"
views_fg        =  "#FF3300"
views_ic        =  "#3399CC"

style :all do
  font "xft:Lucida Grande-8"
  padding     0, 0, 0
  margin_top  1
end
style :views do
  background    views_bg
  foreground    views_fg
  icon          views_ic
  padding       1, 8
  border_right  views_bo, 1

  style :focus do
    foreground  focus_fg
    background  focus_bg
    border      focus_border
    icon        focus_ic
  end
  
  style :urgent do
    foreground  urgent_fg
    background  urgent_bg
    icon        urgent_ic
  end

  style :occupied do
    foreground  occupied_fg
    background  occupied_bg
    icon        occupied_ic
  end
end
style :sublets do
  foreground  sublets_fg
  background  sublets_bg
  icon        sublets_ic
end
style :separator do
  foreground  separator_fg
  background  separator_bg
  separator   "|===>"
end
style :title do
  foreground  title_fg
  background  title_bg
end
style :clients do
  active    client_active, 2
  inactive  client_inactive, 1
  margin    5
  width     30
end
style :subtle do
  margin      0
  panel       panel_top
end

# == Gravities http://subforge.org/projects/subtle/wiki/Gravity
gravity :top_left,       [   0,   0,  35,  50 ]
gravity :top_left66,     [   0,   0,  35,  95 ]
gravity :top_left33,     [   0,   0,  35,  34 ]
gravity :top_left22,     [   0,   0,  35,  22 ]
gravity :top,            [   0,   0, 100,  50 ]
gravity :top66,          [   0,   0, 100,  66 ]
gravity :top33,          [   0,   0, 100,  34 ]
gravity :top_right,      [  65,   0,  35,  50 ]
gravity :top_right66,    [  65,   0,  35,  66 ]
gravity :top_right33,    [  65,   0,  35,  33 ]
gravity :top_right22,    [  65,   0,  35,  22 ]
gravity :left,           [   0,   0,  50, 100 ]
gravity :left66,         [   0,   0,  60, 100 ]
gravity :left33,         [   0,   0,  33, 100 ]
gravity :left11,         [   0,   0,  11, 100 ]
gravity :center,         [   0,   0, 100, 100 ]
gravity :center66,       [  15,  66,  66, 100 ]
gravity :center50,       [  20,  50,  50,  100]
gravity :center33,       [  33,  33,  33,  33 ]
gravity :right,          [  50,   0,  50, 100 ]
gravity :right66,        [  34,   0,  66, 100 ]
gravity :right33,        [  67,  50,  33, 100 ]
gravity :right11,        [  79,  50,  11, 100 ]
gravity :bottom_left,    [   0,  50,  35,  50 ]
gravity :bottom_left66,  [   0,  34,  35,  66 ]
gravity :bottom_left33,  [   0,  67,  35,  33 ]
gravity :bottom,         [   0,  50, 100,  50 ]
gravity :bottom66,       [   0,  34, 100,  66 ]
gravity :bottom33,       [   0,  67, 100,  33 ]
gravity :bottom_right,   [  65,  50,  35,  50 ]
gravity :bottom_right66, [  65,  34,  35,  66 ]
gravity :bottom_right33, [  65,  67,  35,  33 ]
gravity :gimp_image,     [  10,   0,  80, 100 ]
gravity :gimp_toolbox,   [   0,   0,  10, 100 ]
gravity :gimp_dock,      [  90,   0,  10, 100 ]

# == Grabs Link http://subforge.org/projects/subtle/wiki/Grabs
modkey = "W-"
modkey1 = "C-" 
viewnum = 1..9
viewnum.each do |k|
    grab "#{modkey}S-#{k}",   "ViewSwitch#{k}".to_sym
    grab "#{modkey}#{k}",     "ViewJump#{k}".to_sym
    grab "#{modkey}A-#{k}",   "ScreenJump#{k}".to_sym
end
grab "#{modkey}Right",      :ViewNext
grab "#{modkey}Left",       :ViewPrev
grab "#{modkey}C-r",        :SubtleReload
grab "#{modkey}C-S-r",      :SubtleRestart
grab "#{modkey}C-q",        :SubtleQuit
grab "#{modkey}B1",         :WindowMove
grab "#{modkey}B2",         :WindowResize
grab "#{modkey}f",          :WindowFloat
grab "#{modkey}space",      :WindowFull
grab "#{modkey}s",          :WindowStick
grab "#{modkey}equal",      :WindowZaphod
grab "#{modkey}r",          :WindowRaise
grab "#{modkey}t",          :WindowLower
grab "#{modkey1}Left",      :WindowLeft
grab "#{modkey1}Down",      :WindowDown
grab "#{modkey1}Up",        :WindowUp
grab "#{modkey1}Right",     :WindowRight
grab "#{modkey}S-k",        :WindowKill
keypad = { "KP_1" => [ :bottom_left,  :bottom_left66,  :bottom_left33  ],
           "KP_2" => [ :bottom,       :bottom66,       :bottom33       ],
           "KP_3" => [ :bottom_right, :bottom_right66, :bottom_right33 ],
           "KP_4" => [ :left,         :left66,         :left33,     :left11         ],
           "KP_5" => [ :center,       :center66,       :center50,   :center33       ],
           "KP_6" => [ :right,        :right66,        :right33,     :right11        ],
           "KP_7" => [ :top_left,     :top_left66,     :top_left33, :top_left22     ],
           "KP_8" => [ :top,          :top66,          :top33          ],
           "KP_9" => [ :top_right,    :top_right66,    :top_right33, :top_right22   ] }
keypad.each do |k, v|
  grab "#{modkey}#{k}", v
end
grab "#{modkey}Return",       "urxvtc"
grab "#{modkey}F1",           "pcmanfm"
grab "#{modkey}F2",           "exec ~/idea-IC-135.475/bin/./idea.sh"
grab "#{modkey}F3",           "gvim"
grab "#{modkey}F4",           "exec ~/qtcreator-3.1.0/bin/qtcreator.sh"
grab "#{modkey}w",            "google-chrome-stable"
grab "#{modkey}S-F1",         "urxvtc -e ncmpcpp"
grab "#{modkey}S-F2",         "steam"
grab "#{modkey}S-F3",         "skype"
grab "XF86AudioRaiseVolume",  "amixer -c 0 -q set Master 2dB+"
grab "XF86AudioLowerVolume",  "amixer -c 0 -q set Master 2dB-"
grab "XF86AudioMute",         "amixer -c 0 -q set Master toggle"
grab "XF86MonBrightnessUp",   "xbacklight +15"
grab "XF86MonBrightnessDown", "xbacklight -15"
grab "#{modkey}S-Return",     "dmenu_run"
grab "#{modkey}g" do
  Subtle::Contrib::Selector.run
end

scratch_stack   = []
scratch_current = 0
 # Add window to stack
 grab modkey + "-KP_Add" do |c|
  unless scratch_stack.include?(c.win)
    scratch_stack << c.win
    c.tags = []
    c.toggle_stick if c.is_stick?
  end
end
# Remove window from stack
 grab modkey + "-KP_Subtract" do |c|
   if scratch_stack.include?(c.win)
     c.retag
     scratch_stack.delete(c.win)
   end
 end
 # Cycle through stack windows
#grab modkey + "-Tab" do
grab "#{modkey}Tab" do 
 # Get id of next window
   if 0 < scratch_current
     cur_idx = scratch_stack.index(scratch_current)
     # Hide current window
     cur_client = Subtlext::Client[scratch_current]
     cur_client.toggle_stick
     # Check whether cur is last window of stack
     if cur_idx == scratch_stack.size - 1
       scratch_current = 0
       return
   end
    idx = cur_idx + 1
   else
     idx = 0
   end
   # Show next window
   cur = Subtlext::Client[scratch_stack[idx]]
   scratch_current = cur.win
   cur.toggle_stick
end

grab "A-Tab" do
   clients = Subtlext::Client.visible
 
   clients.last.instance_eval do
     focus
     raise
   end
 end
 grab "A-S-Tab" do 
 clients = Subtlext::Client.visible
 
   clients.first.instance_eval do                                                 
     lower                                                                        
   end
   clients.first.instance_eval do
     focus
   end                                                                            
 end
# == Tags Link http://subforge.org/projects/subtle/wiki/Tagging
tag "audio" do
 match "ario|gmpc|cantata|audacious"
 gravity :center
 resize true
end
tag "chat" do
 match"skype"
 gravity :center66
end
tag "Steam", "steam"
tag "browser" do
 match "google-chrome|thunderbird|firefox|epiphany-browser"
 gravity :center
 resize true
end
tag "editor" do
 match "qtcreator|libreoffice|dia|jetbrains-idea-ce|eclipse|qtoctave|sublime_text|mysql-workbench-bin|gvim|gedit|codeblocks"
 gravity :center
 resize true
end
tag "vm" do
 match "virtualbox"
 gravity :center66
 resize true
end
tag "video" do
 match "mplayer.*|vlc"
 float true
end
tag "terms" do
 match "gnome-terminalxxterm|rxvt|urxvt"
 gravity :center50
end
tag "images" do
  match  "feh"
  float  true
end
tag "stick" do
  match   "display|exe|gcolor2|xmessage|<unknown>"
  stick   true
  float   true
  resize  true
end
tag "wine" do
  match :class => "wine"
end
tag "gimp" do
 match "gimp"
 gravity :center
end
tag "dialogs" do
  match  "sun-awt-X11-XDialogPeer|synapse"
  match type: [ :dialog, :splash ]
  gravity :center33
  stick true
end

# == Views Link http://subforge.org/projects/subtle/wiki/Tagging
view "Terminal" do
 match "terms"
 icon "~/icons/terminal.xbm"
 icon_only true
end
view "Developer Tools" do
 match "editor"
 icon "~/icons/wrench.xbm"
 icon_only true
end
view "Web" do
 match "browser"
 icon "~/icons/world.xbm"
 icon_only true
end
view "Games" do
 match "Steam|stuntrally|openlugaru"
 icon "~/icons/game.xbm"
 icon_only true
end
view "media" do
  match      "video|audio|images"
  icon       "~/icons/movie.xbm"
  icon_only  true
end
view "Messengers" do
  match "chat"
  icon "~/icons/messenger1.xbm"
  icon_only true
end
view "Default" do
 match "default"
 icon "~/icons/house.xbm"
 icon_only true
end
view "Wine" do
 match "wine"
 dynamic true
end
view "Virtual Machines" do
 match "vm"
 dynamic true
end

# == Sublets Link http://subforge.org/projects/subtle/wiki/Sublets
sublet :clock2 do
  time_format "%H:%M"
  date_format "%d-%m-%y"
  time_color "#9d0ef0"
  date_color "#9d0ef0"
end  
sublet :battery do
  interval 30
  colors 15 => "#ff0000", 50 => "#ff5400" 
  color_text true
end
sublet :volume do
  interval 60
  step 5
end
sublet :wifi do
  device "wlan0"
end

# == Hooks Link http://subforge.org/projects/subtle/wiki/Hooks
on :start do
    Subtlext::Subtle.spawn "skype &"
    Subtlext::Subtle.spawn "urxvtd &"
    Subtlext::Subtle.spawn "setxkbmap -option grp:switch,grp:caps_toggle,grp_led:caps us,ru &"
    Subtlext::Subtle.spawn "feh --bg-fill ~/Pictures/wallpaper-2830453.png &"
    #Subtlext::Subtle.spawn "feh --bg-fill ~/vim_table.png &"
    Subtlext::Subtle.spawn "nm-applet &"
end
