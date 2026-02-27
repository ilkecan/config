{
  self,
  ...
}:

{
  perSystem = { pkgs, ... }: {
    _module.args.lib = import "${self}/lib" { inherit (pkgs) lib pkgs; };
  };
}
