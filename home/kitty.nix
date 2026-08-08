{
  programs.kitty = {
    enable = true;

    shellIntegration.enableZshIntegration = true;
    
    font = {
      name = "NotoMono Nerd Font Mono";
      size = 12;
    };
    
    settings = {
      confirm_os_window_close = "0";
      enable_audio_bell = "no";
      background_opacity = "0.9";
      cursor_trail = "1";
      copy_on_select = "yes";
    };
  };
}
