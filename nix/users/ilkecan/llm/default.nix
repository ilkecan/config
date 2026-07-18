{
  lib,
  pkgs,
  ...
}:

let
  inherit (lib._.ilkecan)
    importsFromDirectory
    ;
in
{
  imports = importsFromDirectory ./.;

  home.packages = with pkgs; [
    llm-agents.copilot-cli # https://github.com/github/copilot-cli
    llm-agents.zat # https://github.com/bglgwyng/zat
  ];
}
