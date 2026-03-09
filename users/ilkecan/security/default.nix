{
  pkgs,
  ...
}:

{
  imports = [
    ./gpg.nix
    ./keepassxc.nix
  ];

  home.packages = with pkgs; [
    age
    bubblewrap # https://github.com/containers/bubblewrap
    gitleaks # https://github.com/gitleaks/gitleaks
    ripsecrets # https://github.com/sirwart/ripsecrets
    sops
    ssh-to-age
    trufflehog # https://github.com/trufflesecurity/trufflehog
  ];
}
