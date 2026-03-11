# https://niri-wm.github.io/niri/Configuration:-Named-Workspaces.html
{
  lib,
  ...
}:

let
  inherit (lib)
    flatten
    imap1
    listToAttrs
  ;

  outputs = [
    ./dp-3.nix
    ./edp-1.nix
  ];

  importOutput = file:
    let
      inherit (import file) output workspaces;
    in
    imap1 (mkWorkspace output) workspaces;

  mkWorkspace = output: index: name:
    {
      name = "${output}_${toString index}_${name}";
      value = { open-on-output = output; inherit name; };
    };
in
{
  programs.niri.settings.workspaces = listToAttrs (flatten (map importOutput outputs));
}
