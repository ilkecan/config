{
  ...
}:

{
  perSystem =
    { pkgs, ... }:
    {
      _module.args.lib' = {
        ilkecan = pkgs.nur.repos.ilkecan.lib;
      };
    };
}
