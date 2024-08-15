{
	programs.qutebrowser = {
		enable = true;
		extraConfig =
		''
		# config.set('content.javascript.clipboard', 'access', 'github.com')
		# config.set('content.javascript.clipboard', 'access', 'atcoder.jp')
		# config.set('content.javascript.clipboard', 'access', 'chat.openai.com')

		# Unbind the original keybindings
		# config.unbind('<Shift-j>', mode='normal')
		# config.unbind('<Shift-k>', mode='normal')

		# config.bind('<Shift-j>', 'tab-prev', mode='normal') # Bind Shift+j to move the tab focus to the left
		# config.bind('<Shift-k>', 'tab-next', mode='normal') # Bind Shift+k to move the tab focus to the right
		'';
		searchEngines = {
			"DEFAULT" = "https://duckduckgo.com/?ia=web&q={}";
			"!g" = "https://www.google.com/search?hl=en&q={}";
			"!gm" = "https://www.google.com/maps?q={}";
			"!d" = "https://duckduckgo.com/?ia=web&q={}";
			"!nw" = "https://nixos.wiki/index.php?search={}";
			"!np" = "https://github.com/NixOS/nixpkgs/search?q={}";
			"!no" = "https://mynixos.com/search?q={}";
			"!hp" = "https://github.com/nix-community/home-manager/search?q={}";
			"!a" = "https://www.amazon.com/s?k={}";
			"!gh" = "https://github.com/search?o=desc&q={}&s=stars";
			"!ghn" = "https://github.com/search?o=desc&q=lang%3ANix+{}&type=code";
			"!s" = "https://sourcegraph.com/search?patternType=standard&sm=1&q=context:global+{}";
			"!y" = "https://www.youtube.com/results?search_query={}";
		};
		settings = {
			tabs = {
				new_position = {
					unrelated = "next";
				};
				title = {
					format = "{audio}{current_title}";
				};
				position = "left";
				width = "5%";
			};
			content = {
				blocking = {
					enabled = true;
				};
				javascript = {
					clipboard = "access";
				};
			};
		};
	};
}
