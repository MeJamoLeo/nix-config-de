{
	description = "A template that shows all standard flake outputs";

	inputs = {
		nixpkgs.url = "nixpkgs";

		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";

		# inputs.nixos-hardware.url = "github:NixOS/nixos-hardware/master";
		# TODO: I have thinkpad, so I will use it after I devide module base on host and/or architecture.

		xremap-flake.url = "github:xremap/nix-flake";

		nixvim = {
			url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
		};

	};

	outputs = {
		nixpkgs,
		home-manager,
		nixvim,
		...
	}@inputs: {
		nixosConfigurations = {
			"treo-de" = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./configuration.nix

						home-manager.nixosModules.home-manager

						{
							home-manager = {
								useGlobalPkgs = true;
								useUserPackages = true;
								users.treo = import ./home.nix;
								extraSpecialArgs.inputs = inputs;
							};
						}
				];
			};
		};
	};
}
