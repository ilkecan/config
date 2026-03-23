{
  config,
  inputs,
  lib,
  ...
}:

let
  inherit (lib)
    attrValues
    concatLists
    filter
    mapAttrsToList
    ;

  inherit (lib.my)
    isPatchedInput
    ;
in
{
  flake.cachix = {
    push = {
      ilkecan = concatLists [
        (filter isPatchedInput (attrValues inputs))
        (mapAttrsToList (_: v: v.apps.ci.program) config.allSystems)
        (concatLists (mapAttrsToList (_: v: attrValues v.checks) config.allSystems))
      ];
    };
  };
}
