{
  pkgs,
}:

pkgs.writeShellApplication {
  name = "ci";

  runtimeInputs = with pkgs; [ patched.nix-fast-build ];

  text = ''
    nix-fast-build --no-nom --skip-cached --cachix-cache ilkecan "$@"
  '';
}
