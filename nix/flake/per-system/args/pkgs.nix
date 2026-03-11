{
  inputs,
  self,
  ...
}:

{
  perSystem =
    { system, ... }:
    {
      _module.args.pkgs = import "${self}/nix/packages" { inherit inputs system; };
    };
}
