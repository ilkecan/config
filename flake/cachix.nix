{
  inputs,
  lib,
  ...
}:

let
  inherit (lib)
    attrValues
    concatLists
    filter
  ;

  inherit (lib.my)
    storePathName
  ;

  isPatchedInput = x:
    storePathName x != "source";
in
{
  flake.cachix = {
    push = {
      ilkecan = concatLists [
        (filter isPatchedInput (attrValues inputs))
      ];
    };
  };
}
