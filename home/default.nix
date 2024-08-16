{ pkgs, ... }:

{
# TODO please change the username & home directory to your own
	home.username = "treo";
	home.homeDirectory = "/home/treo";

	imports = [
		./home.nix
		./hyprland.nix
		./qutebrowser.nix
		./nixvim.nix
		./sway.nix
	];

# Packages that should be installed to the user profile.
	home.packages = with pkgs; [
# here is some command line tools I use frequently
# feel free to add your own or remove some of them

		neofetch
			nnn # terminal file manager

# archives
			zip
			xz
			unzip
			p7zip

# utils
			ripgrep # recursively searches directories for a regex pattern
			jq # A lightweight and flexible command-line JSON processor
			yq-go # yaml processor https://github.com/mikefarah/yq
			eza # A modern replacement for ‘ls’
			fzf # A command-line fuzzy finder

# networking tools
			mtr # A network diagnostic tool
			iperf3
			dnsutils  # `dig` + `nslookup`
			ldns # replacement of `dig`, it provide the command `drill`
			aria2 # A lightweight multi-protocol & multi-source command-line download utility
			socat # replacement of openbsd-netcat
			nmap # A utility for network discovery and security auditing
			ipcalc  # it is a calculator for the IPv4/v6 addresses

# misc
			cowsay
			file
			which
			tree
			gnused
			gnutar
			gawk
			zstd
			gnupg

# nix related
#
# it provides the command `nom` works just like `nix`
# with more details log output
			nix-output-monitor

# productivity
			hugo # static site generator
			glow # markdown previewer in terminal

			btop  # replacement of htop/nmon
			iotop # io monitoring
			iftop # network monitoring

# system call monitoring
			strace # system call monitoring
			ltrace # library call monitoring
			lsof # list open files

# system tools
			sysstat
			lm_sensors # for `sensors` command
			ethtool
			pciutils # lspci
			usbutils # lsusb

# neovim
			zed-editor
			lazygit
			gnome-tweaks

# sway
			grim
			slurp
			wl-clipboard
			vscode
			discord
			];


# This value determines the home Manager release that your
# configuration is compatible with. This helps avoid breakage
# when a new home Manager release introduces backwards
# incompatible changes.
#
# You can update home Manager without changing this value. See
# the home Manager release notes for a list of state version
# changes in each release.
	home.stateVersion = "24.11";

# Let home Manager install and manage itself.
	programs.home-manager.enable = true;
}
