{
  description = "OrchestrNix: One-stop hub for unifying and managing NixOS configurations";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.05";

    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {self, nixpkgs, home-manager, ... }:
  let
    system = "aarch64-linux";
    rootPath = self;

    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; };
    };

    lib = nixpkgs.lib;

  in {
    nixosConfigurations = {
      chuncheon = lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit rootPath;
        };
        modules = [
          ./hosts/chuncheon/configuration.nix
        ];
      };
    };
  };
}
