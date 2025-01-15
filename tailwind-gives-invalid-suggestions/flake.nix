{
  description = "Helix bug repro flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    helix.url = "github:helix-editor/helix/master";
    helix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    nixpkgs,
    helix,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = [
        helix.packages.${system}.default
        pkgs.tailwindcss-language-server
      ];
    };
  };
}
