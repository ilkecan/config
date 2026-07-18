{
  inputs,
  lib,
  pkgs ? null,
}:

let
  nur = pkgs.nur or (inputs.nur.overlays.default null { inherit lib; }).nur;
in
lib.extend (
  _final: _prev: {
    _ = {
      ilkecan = nur.repos.ilkecan.lib;
    };
  }
)
