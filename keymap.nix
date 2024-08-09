{ inputs, ...}:

{
    imports = [ inputs.xremap-flake.nixosModules.default ];

    # Modmap for single key rebinds
    services.xremap.config.modmap = [
        {
            name = "Global";
            remap = {
                CapsLock = "Ctrl_L";
                Ctrl_L = "CapsLock";
            }; # globally remap CapsLock to Esc
        }
    ];
}
