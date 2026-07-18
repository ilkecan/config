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

  inherit (lib._.ilkecan)
    isPatchedFlakeInput
    ;
in
{
  flake.cachix = {
    push = {
      ilkecan = concatLists [
        (filter isPatchedFlakeInput (attrValues inputs))
        (mapAttrsToList (_: v: v.apps.ci.program) config.allSystems)
        (concatLists (mapAttrsToList (_: v: attrValues v.checks) config.allSystems))
      ];
    };
  };
}
