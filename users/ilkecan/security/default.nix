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
    gitleaks  # https://github.com/gitleaks/gitleaks
    sops
    ssh-to-age
    trufflehog # https://github.com/trufflesecurity/trufflehog
  ];
}
