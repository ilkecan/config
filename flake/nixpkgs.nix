{
  inputs,
  ...
}:

{
  perSystem = { system, self', ... }: {
    _module.args.pkgs = import "${self'}/packages" { inherit inputs system; };
  };
}
