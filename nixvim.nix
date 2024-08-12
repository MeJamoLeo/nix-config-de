{ inputs, ...}:

{
	imports = [
		inputs.nixosModules.nixvim
	];

	# programs.nixvim = {
	# 	enable = true;
	# };
}

