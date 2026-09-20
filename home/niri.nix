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
  imports = [
    inputs.niri.homeModules.config
    ./niri-binds.nix
  ];

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
    };
  };
}
