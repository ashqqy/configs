{ pkgs, ... }:

let
  # 1. Используем полные пути Nix, чтобы скрипт всегда находил zellij и helix
  hx-zellij = pkgs.writeShellScriptBin "hx-zellij" ''
    \({pkgs.zellij}/bin/zellij action new-pane -d right -c --\){pkgs.helix}/bin/hx "$@"
  '';

  # 2. Явно экспортируем EDITOR перед запуском Yazi (команда exec заменяет текущий процесс на yazi)
  yazi-ide = pkgs.writeShellScriptBin "yazi-ide" ''
    export EDITOR="${hx-zellij}/bin/hx-zellij"
    exec yazi "$@"
  '';
in
{
  home.packages = [
    hx-zellij
    yazi-ide
  ];

  programs.zellij = {
    enable = true;
  };

  xdg.configFile."zellij/config.kdl".text = ''
    keybinds {
        normal {
            bind "Ctrl t" { ToggleFloatingPanes; }
        }
    }
  '';

  xdg.configFile."zellij/layouts/ide.kdl".text = ''
    layout {
        pane split_direction="vertical" {
            pane size="20%" command="yazi-ide"
            pane size="80%" command="hx" focus=true
        }
        pane size=1 borderless=true {
            plugin location="zellij:compact-bar"
        }
    }
  '';
}
