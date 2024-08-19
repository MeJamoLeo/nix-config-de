{
	pkgs,
		...
}:
{
# Set your time zone.
	time.timeZone = "America/Chicago";

# Select internationalisation properties.
	i18n.defaultLocale = "en_US.UTF-8";

	i18n.extraLocaleSettings = {
		LC_ADDRESS = "en_US.UTF-8";
		LC_IDENTIFICATION = "en_US.UTF-8";
		LC_MEASUREMENT = "en_US.UTF-8";
		LC_MONETARY = "en_US.UTF-8";
		LC_NAME = "en_US.UTF-8";
		LC_NUMERIC = "en_US.UTF-8";
		LC_PAPER = "en_US.UTF-8";
		LC_TELEPHONE = "en_US.UTF-8";
		LC_TIME = "en_US.UTF-8";
	};

	i18n.inputMethod = {
		enabled = "fcitx5";
		fcitx5.addons = with pkgs; [
			fcitx5-mozc
				fcitx5-configtool
		];
	};

# Add environment variables for fcitx5
	environment.variables = {
		GTK_IM_MODULE = "fcitx";
		QT_IM_MODULE = "fcitx";
		XMODIFIERS = "@im=fcitx";
		QT4_IM_MODULE = "fcitx";
		CLUTTER_IM_MODULE = "fcitx";
	};

	fonts = {
		fonts = with pkgs; [
			noto-fonts-cjk-serif
				noto-fonts-cjk-sans
				noto-fonts-emoji
				nerdfonts
		];
		fontDir.enable = true;
		fontconfig = {
			defaultFonts = {
				serif = ["Noto Serif CJK JP" "Noto Color Emoji"];
				sansSerif = ["Noto Sans CJK JP" "Noto Color Emoji"];
				monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
				emoji = ["Noto Color Emoji"];
			};
		};
	};

# Enable the X11 windowing system.
	services.xserver.enable = true;

# Desktop Environment.
	services.xserver.displayManager.gdm.enable = true;
	services.xserver.desktopManager.gnome.enable = true;

	services.xserver.displayManager.lightdm.enable = false;
	services.xserver.desktopManager.xfce.enable = false;

	services.displayManager.cosmic-greeter.enable = false;
	services.desktopManager.cosmic.enable = false;

	services.xserver.windowManager.i3.enable = false;
	programs.hyprland.enable = true;
	programs.sway.enable = true;

# Configure keymap in X11
	services.xserver = {
		layout = "us";
		xkbVariant = "";
		xkbOptions = "ctrl:swapcaps";
	};

# Enable CUPS to print documents.
	services.printing.enable = true;

# Enable sound with pipewire.
# sound.enable = true;
	hardware.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
# If you want to use JACK applications, uncomment this
#jack.enable = true;

# use the example session manager (no others are packaged yet so this is enabled by default,
# no need to redefine it in your config for now)
#media-session.enable = true;
	};

# Enable touchpad support (enabled default in most desktopManager).
# services.xserver.libinput.enable = true;

	virtualisation.virtualbox.host.enable = true;
	users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];

# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.treo = {
		isNormalUser = true;
		description = "treo";
		extraGroups = [ "networkmanager" "wheel" "user-with-access-to-virtualbox" ];
		openssh.authorizedKeys.keys = [
			"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH4ZbHFcjQAxNN1qeztFmtpm2YB5aOzMjNMI1sETlec+ treo@treo-de"
		];
		packages = with pkgs; [
#  thunderbird
		];
	};
# Enable the OpenSSH daemon.
	services.openssh = {
		enable = true;
		settings = {
			X11Forwarding = true;
			PermitRootLogin = "no"; # disable root login
				PasswordAuthentication = false; # disable password login
		};
		openFirewall = true;
	};

# Install firefox.
	programs.firefox.enable = true;
	programs.starship.enable = true;

# Enable the Flakes feature and the accompanying new nix command-line tool
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

# List packages installed in system profile. To search, run:
# $ nix search wget
	environment.systemPackages = with pkgs; [
		git
		vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
		wget
		curl
		neofetch
	];

	environment.variables.EDITOR = "vim";
}
