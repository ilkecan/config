{
  self,
  ...
}:

{
  perSystem =
    { pkgs, ... }:
    {
      _module.args.lib = import "${self}/nix/lib" { inherit (pkgs) lib pkgs; };
    };
}
