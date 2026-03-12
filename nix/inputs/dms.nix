{
  inputs,
}:

{
  owner = "AvengeMedia";
  repo = "DankMaterialShell";
  src = inputs.dms;
  name = "dms";
  pulls = [
    {
      number = "1864";
      hash = "sha256-epTcIn5TDMZwZ3iUD8kx93EfobJEdcKnJ4zo/QlLrzw=";
    } # nix: add package option for dms-shell
  ];
}
