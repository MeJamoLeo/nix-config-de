{ inputs, ...}:
let
	system = "x86_64-linux";
	hostname = builtins.getEnv "HOSTNAME";
in
{
	imports = [
		inputs.hyprland.homeManagerModules.default
	];

	wayland.windowManager.hyprland = {
		enable = true;
		plugins = [
			# inputs.Hyprspace.packages.${system}.Hyprspace
			# inputs.hy3.packages.${system}.hy3
			# inputs.split-monitor-workspaces.packages.${system}.split-monitor-workspaces
			# inputs.hyprland-plugins.packages.${system}.borders-plus-plus
		];
		settings = {
			env = [
				"TERM, kitty"
				"BROWSER, qutebrowser"
			];
			"$mod" = "SUPER";
			"$mod_a" = "ALT";

			monitor = if hostname == "suika" then
				[ "DP-1, highres, auto, 1" ]
			 else if hostname == "budou" then
				[ "eDP-1, highres, auto, 1" ]
			 else [];

			general = {
				layout = "master";
				border_size = 3;
			};
			master = {
				allow_small_split = true;
# special_scale_factor = 1;
				mfact = 0.5;
# new_status = "inherit";
# new_on_top = "false";
				orientation = "right";
			};
			dwindle = {
				force_split = 2;
				preserve_split = true;
			};
			decoration = {
				rounding = 10;
				active_opacity = 0.9;
				inactive_opacity = 0.9;
				fullscreen_opacity = 0.75;
				drop_shadow = true;
				shadow_range = 5;
				shadow_render_power = 3;
				blur = {
					enabled = true;
					size = 3;
					new_optimizations = true;
					passes = 3;
					ignore_opacity = true;
				};
			};
			bind = [
## Move, resize, and swap windows
### switch focus
					"$mod, H, movefocus, l"
					"$mod, L, movefocus, r"
					"$mod, K, movefocus, u"
					"$mod, J, movefocus, d"
### resize window
					"$mod SHIFT, H, resizeactive, -95 0"
					"$mod SHIFT, L, resizeactive, 95 0"
					"$mod SHIFT, K, resizeactive, 0 -95"
					"$mod SHIFT, J, resizeactive, 0 95"
### move window
					"$mod CTRL, H, movewindow, l"
					"$mod CTRL, L, movewindow, r"
					"$mod CTRL, K, movewindow, u"
					"$mod CTRL, J, movewindow, d"

### move workspace
					"$mod, TAB, exec, hyprctl dispatch workspace m+1"
					"$mod SHIFT, TAB, exec, hyprctl dispatch workspace m-1"

					"$mod SHIFT CTRL, H, exec, hyprctl dispatch workspace m-1"
					"$mod SHIFT CTRL, J, exec, hyprctl dispatch movetoworkspacesilent m-1 && hyprctl dispatch workspace m-1"
					"$mod SHIFT CTRL, K, exec, hyprctl dispatch movetoworkspacesilent m+1 && hyprctl dispatch workspace m+1"
					"$mod SHIFT CTRL, L, exec, hyprctl dispatch workspace m+1"
					"$mod SHIFT CTRL, N, exec, hyprctl dispatch move focus tooutput next"

# "$mod, O, TODO: Change window orientation,"
					"$mod, G, togglefloating,"
					# "$mod, M, fullscreen, 0"
					"$mod, Q, killactive,"

## Manage workspace and displays
					"$mod, Escape, exec, hyprlock"

## Use the launcher
## Switch between apps and windows
## Miscellaneous OS shortcuts
					"$mod, B, exec, qutebrowser"
					"$mod, T, exec, kitty"
## Accessibility shortcuts
					"$mod SHIFT, Escape, exit,"
					"$mod CTRL SHIFT, Escape, exec, shutdown-script"

# show keybinds lis
					"$mod, F1, exec, show-keybinds"

# keybindings
					"$mod, Space, exec, pkill wofi || wofi --show drun"
					"$mod SHIFT, Space, exec, pkill wofi || wofi --show"
					"$mod SHIFT, D, exec, hyprctl dispatch exec '[workspace 4 silent] discord'"
					"$mod SHIFT, S, exec, hyprctl dispatch exec '[workspace 5 silent] SoundWireServer'"
					"$mod, P, pseudo,"
					"$mod, E, exec, nemo"
					"$mod SHIFT, B, exec, pkill -SIGUSR1 .waybar-wrapped"
					"$mod, C ,exec, hyprpicker -a"
					"$mod, G,exec, $HOME/.local/bin/toggle_layout"
					"$mod, W,exec, pkill wofi || wallpaper-picker"
					"$mod SHIFT, W, exec, vm-start"

# screenshot
					"$mod, Print, exec, grimblast --notify --cursor save area ~/Pictures/$(date +'%Y-%m-%d-At-%Ih%Mm%Ss').png"
					",Print, exec, grimblast --notify --cursor  copy area"

# switch workspace
					"$mod, 1, workspace, 1"
					"$mod, 2, workspace, 2"
					"$mod, 3, workspace, 3"
					"$mod, 4, workspace, 4"
					"$mod, 5, workspace, 5"
					"$mod, 6, workspace, 6"
					"$mod, 7, workspace, 7"
					"$mod, 8, workspace, 8"
					"$mod, 9, workspace, 9"
					"$mod, 0, workspace, 10"

# same as above, but switch to the workspace
					"$mod SHIFT, 1, movetoworkspacesilent, 1"
					"$mod SHIFT, 2, movetoworkspacesilent, 2"
					"$mod SHIFT, 3, movetoworkspacesilent, 3"
					"$mod SHIFT, 4, movetoworkspacesilent, 4"
					"$mod SHIFT, 5, movetoworkspacesilent, 5"
					"$mod SHIFT, 6, movetoworkspacesilent, 6"
					"$mod SHIFT, 7, movetoworkspacesilent, 7"
					"$mod SHIFT, 8, movetoworkspacesilent, 8"
					"$mod SHIFT, 9, movetoworkspacesilent, 9"
					"$mod SHIFT, 0, movetoworkspacesilent, 10"
					"$mod CTRL, c, movetoworkspace, empty"

					"$mod_a, 1, exec, hyprctl dispatch workspace 1 && $TERM"
					"$mod_a, 2, exec, hyprctl dispatch workspace 2 && $BROWSER"
					"$mod_a, 3, exec, hyprctl dispatch workspace 3 && vscode"
					#"$mod_a, 4, exec, hyprctl dispatch workspace 4 && $BROWSER"
					#"$mod_a, 5, exec, hyprctl dispatch workspace 5 && $BROWSER"
					#"$mod_a, 6, exec, hyprctl dispatch workspace 6 && $BROWSER"
					#"$mod_a, 7, exec, hyprctl dispatch workspace 7 && $BROWSER"
					"$mod_a, 8, exec, hyprctl dispatch workspace 8 && zathura"
					"$mod_a, 9, exec, hyprctl dispatch workspace 9 && spotify"
					"$mod_a, 0, exec, hyprctl dispatch workspace 10 && discord"
# clipboard manager
					"$mod, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"

#layout
					"$mod, A, layoutmsg, addmaster"
					];

			binde = [
# Function keys
				",XF86AudioMute,exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
				",XF86AudioRaiseVolume,exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
				",XF86AudioLowerVolume,exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
				",XF86AudioMute,exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
				",XF86MonBrightnessUp, exec, brightnessctl set 10%+"
				",XF86MonBrightnessDown, exec, brightnessctl set 10%-"
				",XF86Display, exec, "
				",XF86WLAN, exec, "
				",XF86Messenger, exec, "
				",XF86Go, exec, "
				",Cancel, exec, "
				",XF86Favorites, exec, "
			];
			exec-once = [
					"wl-paste --type text --watch cliphist store #Stores only text data"
					"wl-paste --type image --watch cliphist store #Stores only image data"
					"fcitx5"
					"hypridle"
			];
			input = {
				kb_options = "ctrl:swapcaps";
				touchpad.natural_scroll = true;
			};
		};
	};
	programs.hyprlock = {
		enable = true;
		settings = {
			general = {
				disable_loading_bar = true;
				grace = 0;
				hide_cursor = true;
				no_fade_in = false;
			};

			background = [
			{
				path = "screenshot";
				blur_passes = 2;
				blur_size = 2;
			}
			];
		};
	};
	programs.wofi = {
		enable = true;
		settings = {
			location = "bottom-right";
			allow_markup = true;
			width = 250;
		};
	};
	services.hyprpaper = {
		enable = true;
		settings = {
			preload = [
				"${../wallpaper/night.png}"
			];
			wallpaper = [
				",${../wallpaper/night.png}"
			];
		};
	};
}
