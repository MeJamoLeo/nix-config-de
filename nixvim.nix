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

		colorschemes.gruvbox.enable = true;
	};
}
