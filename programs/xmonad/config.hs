import XMonad
import XMonad.Layout.Spacing
import XMonad.Layout.Gaps
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import XMonad.Util.EZConfig
import XMonad.Actions.CycleWS
import XMonad.Layout.Maximize
import XMonad.Layout.MultiToggle
import XMonad.Layout.NoBorders
import XMonad.Layout.MultiToggle.Instances
import XMonad.Hooks.ManageHelpers
import XMonad.Actions.UpdatePointer
import XMonad.Actions.GridSelect
import XMonad.Hooks.SetWMName
import XMonad.Util.NamedScratchpad
import XMonad.Util.WorkspaceCompare
import XMonad.Hooks.FadeInactive
import XMonad.Layout.Minimize
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.FadeWindows
import qualified XMonad.StackSet as W

import System.Exit

import qualified Data.Map as M

appLauncher = "rofi -modi drun,ssh,window -show drun -show-icons"

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
  -- launch a terminal
  [ ((modm .|. shiftMask,  xK_Return), spawn $ XMonad.terminal conf)

  -- launch dmenu
  , ((modm,               xK_p     ), spawn appLauncher)

  -- close focused window
  , ((modm .|. shiftMask, xK_c     ), kill)

  -- Grid Select
  , ((modm,               xK_g     ), goToSelected defaultGSConfig)

   -- Rotate through the available layout algorithms
  , ((modm,               xK_space ), sendMessage NextLayout)

  --  Reset the layouts on the current workspace to default
  , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

  -- Resize viewed windows to the correct size
  , ((modm,               xK_n     ), refresh)

  -- Move focus to the next window
  , ((modm,               xK_Tab   ), windows W.focusDown)

  -- Move focus to the next window
  , ((modm,               xK_j     ), windows W.focusDown)

  -- Move focus to the previous window
  , ((modm,               xK_k     ), windows W.focusUp  )

  -- Maximize selected window
  , ((modm,     xK_f     ), (sendMessage $ Toggle FULL))

  -- Swap the focused window and the master window
  , ((modm,               xK_Return), windows W.swapMaster)

  -- Swap the focused window with the next window
  , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )

  -- Swap the focused window with the previous window
  , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )

  -- Shrink the master area
  , ((modm,               xK_h     ), sendMessage Shrink)

  -- Expand the master area
  , ((modm,               xK_l     ), sendMessage Expand)

  -- Push window back into tiling
  , ((modm,               xK_t     ), withFocused $ windows . W.sink)

  -- Increment the number of windows in the master area
  , ((modm              , xK_comma ), sendMessage (IncMasterN 1))

  -- Deincrement the number of windows in the master area
  , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

  -- Quit xmonad
  , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))

  -- Restart xmonad
  , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")
  ] ++ 

  --
  -- mod-[1..9], Switch to workspace N
  -- mod-shift-[1..9], Move client to workspace N
  --
  [((m .|. modm, k), windows $ f i)
      | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
      , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

myLayouts = spacedTall ||| Full
  where
    spacedTall = spaced 6 $ Tall 1 (3/100) (1/2)
    spaced width = spacingRaw False (Border width width width width) True (Border width width width width) True

main = xmonad $ defaultConfig
  { terminal = "alacritty"
  , borderWidth = 3
  , normalBorderColor = "#fceec5"
  , focusedBorderColor = "#fcba03"
  , layoutHook = myLayouts
  , keys = myKeys
  }
