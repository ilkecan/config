{
  lib,
  pkgs,
  ...
}:

let
  inherit (lib.my)
    collectImports
    ;
in
{
  imports = collectImports ./.;

  home.packages = with pkgs; [
    llm-agents.copilot-cli # https://github.com/github/copilot-cli
    llm-agents.zat # https://github.com/bglgwyng/zat
  ];
}
