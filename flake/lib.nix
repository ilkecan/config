{
  inputs,
  ...
}:

{
  perSystem = { pkgs, ... }@args: {
    _module.args.lib = import "${inputs.self}/lib" args;
  };
}
