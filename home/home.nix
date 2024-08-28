{
# basic configuration of git, please change to your own
	programs.git = {
		enable = true;
		userName = "MeJamoLeo";
		userEmail = "55238651+MeJamoLeo@users.noreply.github.com";
	};

# starship - an customizable prompt for any shell
	programs.starship = {
		enable = true;
# custom settings
		settings = {
# add_newline = false;
# aws.disabled = true;
# gcloud.disabled = true;
# line_break.disabled = true;
		};
	};

# alacritty - a cross-platform, GPU-accelerated terminal emulator
	programs.alacritty = {
		enable = true;
# custom settings
		settings = {
			env.TERM = "xterm-256color";
			font = {
				size = 12;
				draw_bold_text_with_bright_colors = true;
			};
			scrolling.multiplier = 5;
			selection.save_to_clipboard = true;
		};
	};

	programs.kitty = {
		enable = true;
		theme = "Everforest Dark Medium";
	};

	programs.tmux = {
		enable = true;
		shortcut = "t";
		terminal = "tmux-256color";
		keyMode = "vi";
	};

	programs.zathura = {
		enable = true;
		mappings = {
			D = "toggle_page_mode";
		};
	};

	programs.chromium = {
		enable = true;
		extensions = [
			"gighmmpiobklfepjocnamgkkbiglidom" # AdBlock
			"nffaoalbilbmmfgbnbgppjihopabppdk" # Video Speed Chontroller
			"dbepggeogbaibhgnhhndojpepiihcmeb" # Vimium
			"neebplgakaahbhdphmkckjjcegoiijjo" # Keepa - Amazon Price Tracker
			"fdpohaocaechififmbbbbbknoalclacl" # GoFullPage - Full Page Screen Capture
		];
	};
}
