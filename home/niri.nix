{
  config,
  options,
  pkgs,
  inputs,
  ...
}:

let
  inherit (inputs.niri.lib.kdl) node leaf flag;
in
{
  imports = [ inputs.niri.homeModules.config ];

  programs.niri = {
    package = pkgs.niri;

    config = options.programs.niri.config.default ++ [
      (node "blur"
        [ ]
        [
          (flag "on")
          (leaf "passes" [ 3 ])
          (leaf "offset" [ 3 ])
        ]
      )
      (node "window-rule"
        [ ]
        [
          (node "background-effect"
            [ ]
            [
              (leaf "blur" [ true ])
            ]
          )
        ]
      )
    ];

    settings = {
      spawn-at-startup = [
        { argv = [ "noctalia-shell" ]; }
      ];

      input = {
        keyboard.xkb = {
          layout = "us,ru";
          options = "grp:alt_shift_toggle, caps:menu";
        };

        touchpad = {
          tap = true;
          natural-scroll = true;
        };

        focus-follows-mouse = {
          enable = true;
          max-scroll-amount = "0%";
        };
      };

      layout = {
        gaps = 16;
        center-focused-column = "never";

        preset-column-widths = [
          { proportion = 0.33333; }
          { proportion = 0.5; }
          { proportion = 0.66667; }
        ];

        default-column-width = {
          proportion = 0.5;
        };

        focus-ring = {
          enable = true;
          width = 4;
          active.color = "#ffffff";
          inactive.color = "#505050";
        };

        border = {
          enable = false;
          width = 4;
          active.color = "#ffc87f";
          inactive.color = "#505050";
          urgent.color = "#9b0000";
        };

        shadow = {
          enable = false;
          softness = 30;
          spread = 5;
          offset = {
            x = 0;
            y = 5;
          };
          color = "#0007";
        };
      };

      prefer-no-csd = true;

      screenshot-path = "~/pictures/screenshots/screenshot_%Y-%m-%d_%H-%M-%S.png";

      window-rules = [
        {
          opacity = 0.85;
          draw-border-with-background = false;
          geometry-corner-radius = {
            top-left = 12.0;
            top-right = 12.0;
            bottom-left = 12.0;
            bottom-right = 12.0;
          };
          clip-to-geometry = true;
        }
        {
          matches = [
            {
              app-id = "firefox$";
              title = "^Picture-in-Picture$";
            }
          ];
          open-floating = true;
        }
      ];

      binds =
        with config.lib.niri.actions;
        {
          "Mod+Shift+Slash".action = show-hotkey-overlay;

          "Menu".action = switch-layout "0";
          "Shift+Menu".action = switch-layout "1";

          "Mod+D" = {
            action = spawn "noctalia-shell" "ipc" "call" "launcher" "toggle";
            hotkey-overlay.title = "Run an Application: noctalia-launcher";
          };
          "Mod+T" = {
            action = spawn "kitty";
            hotkey-overlay.title = "Open a Terminal: kitty";
          };
          "Mod+B" = {
            action = spawn "firefox";
            hotkey-overlay.title = "Open a Browser: firefox";
          };
          "Super+Alt+L" = {
            action = spawn "swaylock";
            hotkey-overlay.title = "Lock the Screen: swaylock";
          };
          "Super+Alt+S" = {
            action = spawn-sh "pkill orca || exec orca";
            allow-when-locked = true;
            hotkey-overlay.hidden = true;
          };

          "XF86AudioRaiseVolume" = {
            action = spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0";
            allow-when-locked = true;
          };
          "XF86AudioLowerVolume" = {
            action = spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
            allow-when-locked = true;
          };
          "XF86AudioMute" = {
            action = spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            allow-when-locked = true;
          };
          "XF86AudioMicMute" = {
            action = spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
            allow-when-locked = true;
          };

          "XF86AudioPlay" = {
            action = spawn-sh "playerctl play-pause";
            allow-when-locked = true;
          };
          "XF86AudioPause" = {
            action = spawn-sh "playerctl play-pause";
            allow-when-locked = true;
          };
          "XF86AudioStop" = {
            action = spawn-sh "playerctl stop";
            allow-when-locked = true;
          };
          "XF86AudioPrev" = {
            action = spawn-sh "playerctl previous";
            allow-when-locked = true;
          };
          "XF86AudioNext" = {
            action = spawn-sh "playerctl next";
            allow-when-locked = true;
          };

          "XF86MonBrightnessUp" = {
            action = spawn "brightnessctl" "--class=backlight" "set" "+10%";
            allow-when-locked = true;
          };
          "XF86MonBrightnessDown" = {
            action = spawn "brightnessctl" "--class=backlight" "set" "10%-";
            allow-when-locked = true;
          };

          "Mod+O" = {
            action = toggle-overview;
            repeat = false;
          };
          "Mod+Q" = {
            action = close-window;
            repeat = false;
          };

          "Mod+Left".action = focus-column-left;
          "Mod+Down".action = focus-window-down;
          "Mod+Up".action = focus-window-up;
          "Mod+Right".action = focus-column-right;
          "Mod+H".action = focus-column-left;
          "Mod+J".action = focus-window-down;
          "Mod+K".action = focus-window-up;
          "Mod+L".action = focus-column-right;

          "Mod+Ctrl+Left".action = move-column-left;
          "Mod+Ctrl+Down".action = move-window-down;
          "Mod+Ctrl+Up".action = move-window-up;
          "Mod+Ctrl+Right".action = move-column-right;
          "Mod+Ctrl+H".action = move-column-left;
          "Mod+Ctrl+J".action = move-window-down;
          "Mod+Ctrl+K".action = move-window-up;
          "Mod+Ctrl+L".action = move-column-right;

          "Mod+Home".action = focus-column-first;
          "Mod+End".action = focus-column-last;
          "Mod+Ctrl+Home".action = move-column-to-first;
          "Mod+Ctrl+End".action = move-column-to-last;

          "Mod+Shift+Left".action = focus-monitor-left;
          "Mod+Shift+Down".action = focus-monitor-down;
          "Mod+Shift+Up".action = focus-monitor-up;
          "Mod+Shift+Right".action = focus-monitor-right;
          "Mod+Shift+H".action = focus-monitor-left;
          "Mod+Shift+J".action = focus-monitor-down;
          "Mod+Shift+K".action = focus-monitor-up;
          "Mod+Shift+L".action = focus-monitor-right;

          "Mod+Shift+Ctrl+Left".action = move-column-to-monitor-left;
          "Mod+Shift+Ctrl+Down".action = move-column-to-monitor-down;
          "Mod+Shift+Ctrl+Up".action = move-column-to-monitor-up;
          "Mod+Shift+Ctrl+Right".action = move-column-to-monitor-right;
          "Mod+Shift+Ctrl+H".action = move-column-to-monitor-left;
          "Mod+Shift+Ctrl+J".action = move-column-to-monitor-down;
          "Mod+Shift+Ctrl+K".action = move-column-to-monitor-up;
          "Mod+Shift+Ctrl+L".action = move-column-to-monitor-right;

          "Mod+Page_Down".action = focus-workspace-down;
          "Mod+Page_Up".action = focus-workspace-up;
          "Mod+U".action = focus-workspace-down;
          "Mod+I".action = focus-workspace-up;
          "Mod+Ctrl+Page_Down".action = move-column-to-workspace-down;
          "Mod+Ctrl+Page_Up".action = move-column-to-workspace-up;
          "Mod+Ctrl+U".action = move-column-to-workspace-down;
          "Mod+Ctrl+I".action = move-column-to-workspace-up;

          "Mod+Shift+Page_Down".action = move-workspace-down;
          "Mod+Shift+Page_Up".action = move-workspace-up;
          "Mod+Shift+U".action = move-workspace-down;
          "Mod+Shift+I".action = move-workspace-up;

          "Mod+WheelScrollDown" = {
            action = focus-workspace-down;
            cooldown-ms = 150;
          };
          "Mod+WheelScrollUp" = {
            action = focus-workspace-up;
            cooldown-ms = 150;
          };
          "Mod+Ctrl+WheelScrollDown" = {
            action = move-column-to-workspace-down;
            cooldown-ms = 150;
          };
          "Mod+Ctrl+WheelScrollUp" = {
            action = move-column-to-workspace-up;
            cooldown-ms = 150;
          };

          "Mod+WheelScrollRight".action = focus-column-right;
          "Mod+WheelScrollLeft".action = focus-column-left;
          "Mod+Ctrl+WheelScrollRight".action = move-column-right;
          "Mod+Ctrl+WheelScrollLeft".action = move-column-left;

          "Mod+Shift+WheelScrollDown".action = focus-column-right;
          "Mod+Shift+WheelScrollUp".action = focus-column-left;
          "Mod+Ctrl+Shift+WheelScrollDown".action = move-column-right;
          "Mod+Ctrl+Shift+WheelScrollUp".action = move-column-left;

          "Mod+BracketLeft".action = consume-or-expel-window-left;
          "Mod+BracketRight".action = consume-or-expel-window-right;
          "Mod+Comma".action = consume-window-into-column;
          "Mod+Period".action = expel-window-from-column;

          "Mod+R".action = switch-preset-column-width;
          "Mod+Shift+R".action = switch-preset-column-width-back;
          "Mod+Ctrl+Shift+R".action = switch-preset-window-height;
          "Mod+Ctrl+R".action = reset-window-height;

          "Mod+F".action = maximize-column;
          "Mod+Shift+F".action = fullscreen-window;
          "Mod+M".action = maximize-window-to-edges;
          "Mod+Ctrl+F".action = expand-column-to-available-width;

          "Mod+C".action = center-column;
          "Mod+Ctrl+C".action = center-visible-columns;

          "Mod+Minus".action = set-column-width "-10%";
          "Mod+Equal".action = set-column-width "+10%";
          "Mod+Shift+Minus".action = set-window-height "-10%";
          "Mod+Shift+Equal".action = set-window-height "+10%";

          "Mod+V".action = toggle-window-floating;
          "Mod+Shift+V".action = switch-focus-between-floating-and-tiling;

          "Mod+W".action = toggle-column-tabbed-display;

          "Print".action.screenshot = [ ];
          "Ctrl+Print".action.screenshot-screen = [ ];
          "Alt+Print".action.screenshot-window = [ ];

          "Mod+Escape" = {
            action = toggle-keyboard-shortcuts-inhibit;
            allow-inhibiting = false;
          };

          "Mod+Shift+E".action = quit;
          "Ctrl+Alt+Delete".action = quit;

          "Mod+Shift+P".action = power-off-monitors;
        }
        // builtins.listToAttrs (
          builtins.concatMap (i: [
            {
              name = "Mod+${toString i}";
              value.action = focus-workspace i;
            }
            {
              name = "Mod+Ctrl+${toString i}";
              value.action.move-column-to-workspace = i;
            }
          ]) (builtins.genList (i: i + 1) 9)
        );
    };
  };
}
