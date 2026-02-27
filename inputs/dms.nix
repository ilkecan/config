{
  inputs,
}:

{
  owner = "AvengeMedia";
  repo = "DankMaterialShell";
  src = inputs.dms;
  name = "dms";
  pulls = {
    "1864" = "sha256-epTcIn5TDMZwZ3iUD8kx93EfobJEdcKnJ4zo/QlLrzw="; # nix: add package option for dms-shell
  };
}
