{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnupg
    password-store
  ]
}
