{
  pkgs,
  ...
}:
{
  time.timeZone = "Asia/Manila";
  time.hardwareClockInLocalTime = false;
  i18n.defaultLocale = "en_PH.UTF-8";
  i18n.extraLocaleSettings = {
   LC_ADDRESS = "en_PH.UTF-8";
   LC_IDENTIFICATION = "en_PH.UTF-8";
   LC_MEASUREMENT = "en_PH.UTF-8";
   LC_MONETARY = "en_PH.UTF-8";
   LC_NAME = "en_PH.UTF-8";
   LC_NUMERIC = "en_PH.UTF-8";
   LC_PAPER = "en_PH.UTF-8";
   LC_TELEPHONE = "en_PH.UTF-8";
   LC_TIME = "en_PH.UTF-8";
  };

  networking.timeServers = ["0.pool.ntp.org" "1.pool.ntp.org" "2.pool.ntp.org" "3.pool.ntp.org"];
  
  services = {
    timesyncd = {
      enable = true;
      servers = [ "0.pool.ntp.org" "1.pool.ntp.org" "2.pool.ntp.org" "3.pool.ntp.org" ];
    };
    libinput.enable = true;
    xserver = {
      enable = true;


      displayManager = {
        gdm.enable = true;
      };
    };

    printing = {
      enable = true;
      drivers = [ pkgs.hplip ];
    };

    blueman.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  programs.system-config-printer.enable = true;

  # Brightness
  hardware.brillo.enable = true;

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true; 
  };

  # OpenTablet
  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };

  environment.systemPackages = [ 
    pkgs.system-config-printer 
    pkgs.pavucontrol

    pkgs.pulseaudioFull
  ];
}
