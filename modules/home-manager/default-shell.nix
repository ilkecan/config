{
  lib,
  ...
}:

let
  inherit (lib)
    mkOption
    types
  ;
in
{
  options = {
    home.defaultShell = mkOption {
      type = types.shellPackage;
      readOnly = true;
      description = "The user's default shell package.";
    };
  };
}
