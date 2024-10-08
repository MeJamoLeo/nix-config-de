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
		globals.mapleader = " ";

		keymaps = [
			{
				mode = "i";
				key = "jj";
				action = "<esc>";
			}
			{
				mode = "n";
				key = "<esc><esc>";
				action = ":set nohlsearch<CR>";
			}

			{
				mode = "n";
				key = "<leader>lg";
				action = "<CMD>LazyGit<CR>";
				options.desc = "[L]azy[G]it";
			}

#==============================
# smart-splits
#==============================
			{
				mode = "n";
				key = "<C-e> ";
				action = "<CMD>SmartResizeMode<CR>";
				options.desc = "Resize Mode";
			}
			{
				mode = "n";
				key = "<C-e>h";
				action = "<CMD>SmartSwapLeft<CR>";
				options.desc = "Swap Left";
			}
			{
				mode = "n";
				key = "<C-e>j";
				action = "<CMD>SmartSwapDown<CR>";
				options.desc = "Swap Down";
			}
			{
				mode = "n";
				key = "<C-e>k";
				action = "<CMD>SmartSwapUp<CR>";
				options.desc = "Swap Up";
			}
			{
				mode = "n";
				key = "<C-e>l";
				action = "<CMD>SmartSwapRight<CR>";
				options.desc = "Swap Right";
			}
#==============================
# smart-splits
#==============================
			{
				mode = "n";
				key = "<leader>e";
				action = "<CMD>Telescope file_browser<CR>";
				options.desc = "Swap Right";
			}
		];

		userCommands.OpenTerminalWithCommand.command =''
			function OpenTerminalWithCommand()
				local dir = vim.fn.expand('%:p:h')
				vim.cmd('cd ' .. dir)
				vim.fn.termopen('ls', { cwd = dir })
			end
			'';

		opts = {
			number = true;
			relativenumber = true;
			clipboard = "unnamedplus";
			expandtab = false;
			tabstop = 4;
			shiftwidth = 4;
			softtabstop = 0;
			showtabline = 2;
			autoindent = true;
			# smartindent = true;
			termguicolors = true;
			list = true;
			listchars = {
				tab = "»-";
				trail = "-";
				eol = "↲";
				extends = "»";
				precedes = "«";
				nbsp = "%";
			};
			signcolumn = "yes";
		};

		clipboard = {
			providers = {
				wl-copy.enable = true;
			};
		};

		colorschemes = {
			poimandres = {
				enable = false;
			};
			vscode = {
				enable = false;
			};
			nightfox = {
				enable = false;
				flavor = "carbonfox";
				settings.options.transparent = true;
			};
			everforest = {
				enable = true;
			};
		};

		plugins = {
			lsp = {
				enable = true;
				servers = { # Average webdev LSPs
					tsserver.enable = true; # TS/JS
						cssls.enable = true; # CSS
						tailwindcss.enable = true; # TailwindCSS
						html.enable = true; # HTML
						pyright.enable = true; # Python
						marksman.enable = true; # Markdown
						nil-ls.enable = true; # Nix
						dockerls.enable = true; # Docker
						bashls.enable = true; # Bash
						clangd.enable = true; # C/C++
						lua-ls = { # Lua
							enable = true;
							settings.telemetry.enable = false;
						};

					rust-analyzer = { # Rust
						enable = true;
						installRustc = true;
						installCargo = true;
					};
				};
			};

			cmp-buffer = { enable = true; };
			cmp-nvim-lsp = { enable = true; };
			cmp-path = { enable = true; };
			cmp = {
				enable = true;
				settings = {
					sources = [
						{ name = "buffer"; }
						{ name = "nvim_lsp"; }
						{ name = "path"; }
					];
					mapping = {
						"<C-n>" = "cmp.mapping.select_next_item()";
						"<C-p>" = "cmp.mapping.select_prev_item()";
						"<Down>" = "cmp.mapping.select_next_item()";
						"<Up>" = "cmp.mapping.select_prev_item()";
						"<C-j>" = "cmp.mapping.select_next_item()";
						"<C-k>" = "cmp.mapping.select_prev_item()";
						"<C-d>" = "cmp.mapping.scroll_docs(-4)";
						"<C-f>" = "cmp.mapping.scroll_docs(4)";
						"<C-Space>" = "cmp.mapping.complete()";
						"<C-e>" = "cmp.mapping.close()";
						"<CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })";
					};
				};
			};

			lsp-format = { enable = true; };
			treesitter = { enable = true; };
			nvim-autopairs = { enable = true; };
			lazygit = { enable = true; };
			rainbow-delimiters = { enable = true; };
			which-key = { enable = true; };
			smart-splits = { enable = true; };
			gitgutter = {
				enable = true;
				highlightLineNumbers = true;
				highlightLines = true;
			};

			telescope = {
				enable = true;
				extensions = {
					fzf-native.enable = true;
					ui-select.enable = true;
					file-browser.enable = true;
				};
				keymaps = {
					"<leader>ff" = {
						mode = "n";
						action = "find_files";
						options = {
							desc = "[F]ind [F]iles";
						};
					};
					"<leader>fg" = {
						mode = "n";
						action = "git_files";
						options = {
							desc = "[F]ind [G]it files";
						};
					};
					"<leader>fw" = {
						mode = "n";
						action = "grep_string";
						options = {
							desc = "[F]ind current [W]ord";
						};
					};
					"<leader>fb" = {
						mode = "n";
						action = "buffers";
						options = {
							desc = "[F]ind [B]uffers";
						};
					};
					"<leader>fc" = {
						mode = "n";
						action = "colorscheme";
						options = {
							desc = "[F]ind [C]olorscheme";
						};
					};
				};
			};
		};
	};
}
