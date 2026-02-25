{
  ...
}:

{
  perSystem = { pkgs, self', ... }@args: {
    _module.args.lib = import "${self'}/lib" args;
  };
}
