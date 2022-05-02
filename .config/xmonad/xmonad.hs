import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Gaps
import XMonad.Layout.Spacing
import XMonad.Layout.Tabbed
import XMonad.Layout.ResizableTile
import XMonad.Actions.CycleWS
import XMonad.Util.Themes

import Graphics.X11.ExtraTypes.XF86
import Text.PrettyPrint.Annotated (Span(spanAnnotation))
import System.Process (spawnCommand)

autostart = do
    spawn "picom"
    spawn "~/.fehbg"
--    spawn "bash ~/.config/polybar/launch.sh --shapes"
    spawn "NOTIFIED=0"
    spawn "eww daemon && eww open bar"
    spawn "~/.config/eww/scripts/setup.sh"
    spawn "dunst"
    spawn "xsetroot -cursor_name left_ptr"

active = "#222222"
inactive = "#111111"

tabConfig = def { activeColor = active
                , inactiveColor = inactive
                , activeBorderColor = active
                , inactiveBorderColor = inactive
                , decoHeight = 30}

layouts = spacing 10 $ gaps [(L,10), (R,10), (U,10), (D,10)] $ avoidStruts (tall ||| Mirror tall ||| Tall 1 (3/100) (1/2) ||| tabbedBottom shrinkText tabConfig )
    where tall = ResizableTall 1 (3/100) (1/2) []

defaults = def { modMask = mod4Mask,
    terminal = "kitty",
    borderWidth = 5,
    normalBorderColor = "#225544",
    focusedBorderColor = "#55ccaa",
    startupHook = autostart,
    layoutHook = layouts
}
  
main :: IO ()
main = xmonad $ docks $ defaults
  `additionalKeysP`
    [ ("M-S-s", spawn "flameshot gui"),
      ("<XF86AudioLowerVolume>", spawn "amixer -D pulse sset Master 5%- && ~/.config/eww/scripts/widgets/volume.sh"),
      ("<XF86AudioRaiseVolume>", spawn "amixer -D pulse sset Master 5%+ && ~/.config/eww/scripts/widgets/volume.sh"),
      ("<XF86AudioMute>", spawn "amixer -D pulse set Master 1+ toggle && ~/.config/eww/scripts/widgets/volume.sh"),
      ("M-C-<Return>", spawn "playerctl play-pause"),
      ("M-s", sendMessage ToggleStruts),
      ("M-e", spawn "eww daemon"),
      ("M-S-e", spawn "pkill eww"),
      ("C-M-<Left>", prevWS),
      ("C-M-<Right>", nextWS),
      ("M-o", sendMessage (IncMasterN 1)),
      ("M-i", sendMessage (IncMasterN (-1))),
      ("M-S-h", sendMessage MirrorShrink),
      ("M-S-l", sendMessage MirrorExpand),
      ("M-r", spawn "~/.config/rofi/launchers/misc/launcher.sh")
      -- ("M-l", spawn "~/.config/rofi/applets/menu/powermenu.sh")
    ]
