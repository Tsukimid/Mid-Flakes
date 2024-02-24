{
  pkgs,
  ...
}:
{
  time.timeZone = "Asia/Manila";
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
  
  services = {
    xserver = {
      enable = true;
      libinput.enable = true;


      displayManager = {
        gdm.enable = true;
      };
    };

    printing = {
      enable = true;
      drivers = [ pkgs.hplip ];
    };

    blueman.enable = true;
  };

  # Sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Brightness
  hardware.brillo.enable = true;

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true; 
  };

  environment.systemPackages = [ 
    pkgs.system-config-printer 
    pkgs.pavucontrol
  ];
}
