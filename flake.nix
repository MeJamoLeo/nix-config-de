{
	description = "A template that shows all standard flake outputs";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
		nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";


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
		nixos-cosmic,
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
				# Cachixによるバイナリキャッシュ設定
				{
					nix.settings.substituters = [ "https://cosmic.cachix.org/" ];
					nix.settings.trusted-public-keys = [
						"cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
					];
				}
				# COSMICデスクトップのNixOSモジュールをインポート
				nixos-cosmic.nixosModules.default
				# システム固有の設定
				{
					# COSMICデスクトップ環境の有効化
					services.desktopManager.cosmic.enable = true;
					# COSMIC専用のグリーティング（ログイン）サービスの有効化
					services.displayManager.cosmic-greeter.enable = true;
					# ユーザー「treo」を作成（ホームディレクトリの作成とwheelグループ等への所属）
					users.users.treo = {
						isNormalUser = true;
						home = "/home/treo";
						createHome = true;
						extraGroups = [ "wheel" "networkmanager" ];
					};
					# COSMIC Store用のFlatpakサポート（オプション）
					services.flatpak.enable = true;
					# アプリケーションが期待するGNOME Keyringの有効化（例：Wi-Fiパスワードの保存など）
					services.gnome.gnome-keyring.enable = true;
				}
				];
				# (a) Use COSMIC binary cache for faster builds:
				specialArgs = {inherit inputs;};
			};
		};
	};
}
