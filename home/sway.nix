let

mod = "Mod4";

in
{
	imports = [
		# ./eww
	];
	wayland.windowManager.sway = {
		enable = true;
		extraConfig = ''
			set $opacity 0.8
			for_window [class=".*"] opacity 0.95
			for_window [app_id=".*"] opacity 0.95
		'';
		config = {
			modifier = mod;
			input = {
				"type:keyboard" = {
					xkb_options = "ctrl:swapcaps";
				};
			};
			output = {
				"*".bg = "./wallpaper fill";
			};
			bars = [ { position = "top"; } ];
			window.titlebar = false;

			gaps.inner = 10;

			keybindings = {
				"${mod}+Tab" = "workspace next";
				"${mod}+Shift+Tab" = "workspace prev";

				"${mod}+r" = "mode resize";
				"${mod}+t" = "exec --no-startup-id kitty";
				"${mod}+b" = "exec --no-startup-id qutebrowser";
				"${mod}+q" = "reload";
				"${mod}+Escape" = "exec swaylock";
				"${mod}+Shift+Escape" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'";
				"${mod}+1" = "workspace number 1";
				"${mod}+2" = "workspace number 2";
				"${mod}+3" = "workspace number 3";
				"${mod}+4" = "workspace number 4";
				"${mod}+5" = "workspace number 5";
				"${mod}+6" = "workspace number 6";
				"${mod}+7" = "workspace number 7";
				"${mod}+8" = "workspace number 8";
				"${mod}+9" = "workspace number 9";
				"${mod}+0" = "workspace number 10";
				"${mod}+Shift+1" = "move container to workspace number 1";
				"${mod}+Shift+2" = "move container to workspace number 2";
				"${mod}+Shift+3" = "move container to workspace number 3";
				"${mod}+Shift+4" = "move container to workspace number 4";
				"${mod}+Shift+5" = "move container to workspace number 5";
				"${mod}+Shift+6" = "move container to workspace number 6";
				"${mod}+Shift+7" = "move container to workspace number 7";
				"${mod}+Shift+8" = "move container to workspace number 8";
				"${mod}+Shift+9" = "move container to workspace number 9";
				"${mod}+Shift+0" = "move container to workspace number 10";

				"${mod}+Left" = "workspace prev";
				"${mod}+Right" = "workspace next";
				"${mod}+Shift+Left" = "move container to workspace prev";
				"${mod}+Shift+Right" = "move container to workspace next";

				"${mod}+h" = "focus left";
				"${mod}+j" = "focus down";
				"${mod}+k" = "focus up";
				"${mod}+l" = "focus right";
				"${mod}+Shift+h" = "move left";
				"${mod}+Shift+j" = "move down";
				"${mod}+Shift+k" = "move up";
				"${mod}+Shift+l" = "move right";

				"${mod}+v" = "split h";
				"${mod}+n" = "split v";

# "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
# "XF87AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
# "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
# "XF86AudioMicMute" = "exec pactl set-source-mute @DEFAULT_SOURCE@ toggle";
# "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
# "XF86MonBrightnessUp" = "exec brightnessctl set 5%+";
# "XF86AudioPlay" = "exec playerctl play-pause";
# "XF86AudioNext" = "exec playerctl next";
# "XF86AudioPrev" = "exec playerctl previous";
# "XF86Search" = "exec bemenu-run";

				"${mod}+space" = "layout toggle splith stacking";
				"${mod}+a" = "focus parent";
			};
			modes.resize = {
				"h" = "resize shrink width 10px";
				"j" = "resize grow height 10px";
				"k" = "resize shrink height 10px";
				"l" = "resize grow width 10px";

				"Return" = ''mode "default"'';
				"Escape" = ''mode "default"'';
			};
		};
	};
}
