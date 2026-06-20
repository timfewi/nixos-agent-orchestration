{
  config,
  pkgs,
  lib,
  params,
  ...
}:

let
  cfg = config.agent.desktop;
in
{
  options.agent.desktop = {
    enable = lib.mkEnableOption "Niri + Noctalia desktop environment";

    userName = lib.mkOption {
      type = lib.types.str;
      default = params.adminUser or params.userName or "admin";
      description = "User for auto-login and desktop session.";
    };
  };

  config = lib.mkIf cfg.enable {
    # ── Noctalia flake input ──
    # Requires: uncomment `noctalia` input in flake.nix + add to imports:
    # imports = [ inputs.noctalia.nixosModules.default ];

    # ── Hardware / GPU ──
    hardware.opengl.enable = true;

    # ── Display manager infrastructure ──
    # Required for SDDM even on Wayland-only setups
    services.xserver.enable = true;

    # ── Niri compositor ──
    programs.niri.enable = true;

    # ── Noctalia shell (bar, launcher, notifications, lockscreen, wallpaper) ──
    programs.noctalia.enable = true;
    programs.noctalia.settings = {
      bar.position = "top";
      bar.height = 40;
      launcher.enable = true;
      notifications.enable = true;
      lockscreen.enable = true;
      wallpaper.enable = true;
      wallpaper.path = null; # default gradient
    };

    # ── User groups for Wayland hardware access ──
    users.users.${cfg.userName}.extraGroups = [
      "input"
      "video"
    ];

    # ── Display manager ──
    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = true;
    services.displayManager.sddm.settings = {
      Autologin.Session = "niri.desktop";
      Autologin.User = cfg.userName;
    };

    # ── Niri keybindings ──
    programs.niri.settings = {
      prefer_no_csd = true;

      binds = {
        "Mod+T".action.spawn = "foot";
        "Mod+D".action.spawn = "fuzzel";
        "Mod+Q".action = "close-window";
        "Mod+Shift+Q".action = "close-workspace";
        "Mod+H".action = "focus-column-left";
        "Mod+L".action = "focus-column-right";
        "Mod+Shift+H".action = "move-column-left";
        "Mod+Shift+L".action = "move-column-right";
        "Mod+Shift+Return".action.spawn = "foot";

        # Media keys
        "XF86AudioRaiseVolume".action.spawn = "pactl set-sink-volume @DEFAULT_SINK@ +5%";
        "XF86AudioLowerVolume".action.spawn = "pactl set-sink-volume @DEFAULT_SINK@ -5%";
        "XF86AudioMute".action.spawn = "pactl set-sink-mute @DEFAULT_SINK@ toggle";

        # Screenshot
        "Print".action.spawn = "grim";
        "Shift+Print".action.spawn = "grim -g \"$(slurp)\"";
      };
    };

    # ── Desktop packages ──
    environment.systemPackages = with pkgs; [
      foot # default terminal
      fuzzel # app launcher
      mako # notification daemon (fallback)
      swaybg # wallpaper
      swaylock # lockscreen
      wl-clipboard # clipboard utils
      brightnessctl # backlight control
      pavucontrol # audio mixer
      networkmanagerapplet # network tray
      grim # screenshot
      slurp # region select
      pactl # audio (pulseaudio-utils)
    ];

    # ── Audio (common desktop dependency) ──
    services.pipewire.enable = true;
    services.pipewire.pulse.enable = true;
    services.pipewire.wireplumber.enable = true;

    # ── D-Bus (required for desktop services) ──
    services.dbus.enable = true;

    # ── XDG portals (file dialogs, screenshare) ──
    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
  };
}
