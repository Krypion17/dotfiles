import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Gaps
import XMonad.Layout.Spacing

import Graphics.X11.ExtraTypes.XF86
import Text.PrettyPrint.Annotated (Span(spanAnnotation))
import System.Process (spawnCommand)

autostart = do
    spawn "picom"
    spawn "~/.fehbg"
    spawn "bash ~/.config/polybar/launch.sh --shapes"
    spawn "dunst"

layouts = spacing 10 $ gaps [(L,10), (R,10), (U,10), (D,10)] $ avoidStruts (tall ||| Mirror tall)
    where tall = Tall 1 (3/100) (1/2)

defaults = def { modMask = mod4Mask,
    terminal = "kitty",
    borderWidth = 6,
    normalBorderColor = "#115544",
    focusedBorderColor = "#55ccaa",
    startupHook = autostart,
    layoutHook = layouts
}
  
main :: IO ()
main = xmonad $ docks $ defaults
  `additionalKeysP`
    [ ("M-S-s", spawn "flameshot gui"),
      ("<XF86AudioLowerVolume>", spawn "amixer -D pulse sset Master 5%-"),
      ("<XF86AudioRaiseVolume>", spawn "amixer -D pulse sset Master 5%+"),
      ("M-s", sendMessage ToggleStruts),
      ("M-e", spawn "eww daemon"),
      ("M-S-e", spawn "pkill eww")
    ]
