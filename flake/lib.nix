{
  ...
}:

{
  perSystem = { pkgs, self', ... }: {
    _module.args.lib = import "${self'}/lib" { inherit (pkgs) lib pkgs; };
  };
}
