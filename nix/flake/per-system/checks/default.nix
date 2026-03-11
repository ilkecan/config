{
  self,
  ...
}:

{
  perSystem =
    { pkgs, ... }:
    let
      args = { inherit pkgs self; };
      mkCheck = file: import file args;
    in
    {
      checks = {
        trufflehog = mkCheck ./trufflehog.nix;
      };
    };
}
