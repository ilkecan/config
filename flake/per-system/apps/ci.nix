{
  pkgs,
}:

pkgs.writeShellApplication {
  name = "ci";

  runtimeInputs = with pkgs; [ unstable.nix-fast-build ];

  text = ''
    nix-fast-build --no-nom --skip-cached "$@"
  '';
}
