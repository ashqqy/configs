{
  home.stateVersion = "26.05";

  programs.niri.settings.outputs = {
    "eDP-1" = {
      mode = {
        width = 2880;
        height = 1620;
        refresh = 120.0;
      };
      scale = 1.5;
      transform.rotation = 0;
      position = {
        x = 2560;
        y = 0;
      };
    };

    "HDMI-A-1" = {
      mode = {
        width = 2560;
        height = 1440;
        refresh = 60.0;
      };
      scale = 1.0;
      transform.rotation = 0;
      position = {
        x = 0;
        y = 0;
      };
    };
  };
}
