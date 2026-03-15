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
    isPatchedInput
    ;
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
