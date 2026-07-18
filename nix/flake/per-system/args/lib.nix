{
  self,
  inputs,
  ...
}:

{
  perSystem =
    { pkgs, ... }:
    {
      _module.args.lib = import "${self}/nix/lib" {
        inherit inputs;
        inherit (pkgs) lib pkgs;
      };
    };
}
