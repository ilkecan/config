{
  lib,
  ...
}:

let
  inherit (lib)
    mapAttrs
    mkDefault
  ;
in
{
  perInput = _system: mapAttrs (_: mkDefault);
}
