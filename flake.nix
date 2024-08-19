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

		nixos-cosmic = {
			url = "github:lilyinstarlight/nixos-cosmic";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		hyprland = {
			url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
		};

		hyprland-plugins = {
			url = "github:hyprwm/hyprland-plugins";
			inputs.hyprland.follows = "hyprland";
		};

		hy3 = {
			url = "github:outfoxxed/hy3";
			inputs.hyprland.follows = "hyprland";
		};

		Hyprspace = {
			url = "github:KZDKM/Hyprspace";
			inputs.hyprland.follows = "hyprland";
		};

		split-monitor-workspaces = {
			url = "github:Duckonaut/split-monitor-workspaces";
			inputs.hyprland.follows = "hyprland"; # <- make sure this line is present for the plugin to work as intended
		};
	};

	outputs = {
		nixpkgs,
		home-manager,
		nixvim,
		nixos-cosmic,
		hyprland,
		...
	}@inputs: {
		nixosConfigurations = {

			"suika" = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./hosts/suika
#___________________Home_Manager
					home-manager.nixosModules.home-manager
					{
						home-manager = {
							useGlobalPkgs = true;
							useUserPackages = true;
							extraSpecialArgs.inputs = inputs;
							users.treo = import ./home;
						};
						nixpkgs.config.allowUnfree = true;
					}
#___________________COSMIC
					{
						nix.settings = {
							substituters = [ "https://cosmic.cachix.org/" ];
							trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
						};
					}
					nixos-cosmic.nixosModules.default
				];
				specialArgs = {inherit inputs;};
			};

			"budou" = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./hosts/budou
#___________________Home_Manager
					home-manager.nixosModules.home-manager
					{
						home-manager = {
							useGlobalPkgs = true;
							useUserPackages = true;
							extraSpecialArgs.inputs = inputs;
							users.treo = import ./home;
						};
						nixpkgs.config.allowUnfree = true;
					}
#___________________COSMIC
					{
						nix.settings = {
							substituters = [ "https://cosmic.cachix.org/" ];
							trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
						};
					}
					nixos-cosmic.nixosModules.default
				];
				specialArgs = {inherit inputs;};
			};
		};
	};
}
