# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
pkgs: {
	nvimconf = pkgs.vimUtils.buildVimPlugin {
		name = "lol";
		src = ./nvim;};
  # example = pkgs.callPackage ./example { };
}
