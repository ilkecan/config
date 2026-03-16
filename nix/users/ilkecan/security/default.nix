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
    age
    bubblewrap # https://github.com/containers/bubblewrap
    gitleaks # https://github.com/gitleaks/gitleaks
    llm-agents.sandbox-runtime # https://github.com/anthropic-experimental/sandbox-runtime
    ripsecrets # https://github.com/sirwart/ripsecrets
    sops
    ssh-to-age
    trufflehog # https://github.com/trufflesecurity/trufflehog
  ];
}
