{
  inputs,
  self,
  ...
}:

{
  perSystem = { system, ... }: {
    _module.args.pkgs = import "${self}/packages" { inherit inputs system; };
  };
}
