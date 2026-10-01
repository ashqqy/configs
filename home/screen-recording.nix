{ pkgs, ... }:

let
  screen-record-toggle = pkgs.writeShellApplication {
    name = "screen-record-toggle";

    runtimeInputs = with pkgs; [
      wl-screenrec
      slurp
      procps
      libnotify
    ];

    text = ''
      if pkill -INT -x wl-screenrec; then
        notify-send -a "Screen recording" "Recording stopped"
        exit 0
      fi

      directory="$HOME/videos/recordings"
      mkdir -p "$directory"
      file="$directory/recording_$(date +%Y-%m-%d_%H-%M-%S).mp4"

      geometry=()
      if [ "''${1-}" = "--region" ]; then
        selection=$(slurp) || exit 1
        geometry=(--geometry "$selection")
      fi

      notify-send -a "Screen recording" "Recording started"
      exec wl-screenrec \
        --audio \
        --audio-device "@DEFAULT_MONITOR@" \
        --filename "$file" \
        "''${geometry[@]}"
    '';
  };
in
{
  home.packages = with pkgs; [
    wl-screenrec
    slurp
    screen-record-toggle
  ];
}
