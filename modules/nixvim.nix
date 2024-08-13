{ inputs, ...}:

{
	imports = [
		inputs.nixvim.homeManagerModules.nixvim
	];

	programs.nixvim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;
		vimAlias = true;
		vimdiffAlias = true;


		plugins = {
			treesitter = {
				enable = true;
			};

			nvim-autopairs = {
				enable = true;
			};

			lsp = {
				enable = true;
				servers = {
					# Average webdev LSPs
					tsserver.enable = true; # TS/JS
						cssls.enable = true; # CSS
						tailwindcss.enable = true; # TailwindCSS
						html.enable = true; # HTML
						astro.enable = true; # AstroJS
						phpactor.enable = true; # PHP
						svelte.enable = false; # Svelte
						vuels.enable = false; # Vue
						pyright.enable = true; # Python
						marksman.enable = true; # Markdown
						nil-ls.enable = true; # Nix
						dockerls.enable = true; # Docker
						bashls.enable = true; # Bash
						clangd.enable = true; # C/C++
						csharp-ls.enable = true; # C#
						yamlls.enable = true; # YAML

						lua-ls = { # Lua
							enable = true;
							settings.telemetry.enable = false;
						};

					# Rust
					rust-analyzer = {
						enable = true;
						installRustc = true;
						installCargo = true;
					};
				};
			};
		};

		colorschemes.nightfox = {
			enable = true;
			flavor = "carbonfox";
			settings.options.transparent = true;
		};
	};
}
