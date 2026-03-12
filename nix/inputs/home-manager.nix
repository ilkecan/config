{
  inputs,
}:

{
  owner = "nix-community";
  repo = "home-manager";
  src = inputs.home-manager;
  name = "home-manager";
  pulls = [
    {
      number = "8290";
      hash = "sha256-hSnOwFX04GQcOwlxPsDJxVV8b6FIFvuckCAm0fjfLvI=";
    } # claude-code: fix wrapper to inject --mcp-config after subcommands
    {
      number = "8305";
      hash = "sha256-osWWAfqhc9X8QlGjSe4cnffj/ljB+KQGfSLT3o4Dd60=";
    } # claude-code: refactor wrapper to use append-flags
    {
      number = "8365";
      hash = "sha256-AKXVJmltOEiYu71gTb5yhlKTP21Ce0vuEogstWOAUa8=";
    } # claude-code: add rules support
    {
      number = "8550";
      hash = "sha256-qYqSF986WZmzVYFPii+Thf0fZqH7HT3JrglKrutxdwI=";
    } # codex: add skills options
    {
      number = "8543";
      hash = "sha256-Swwm+ejwIKVI4tQy7ilPNwMoUlBejPm2NfMDrY+dJz0=";
    } # claude-code: add enableMcpIntegration
    {
      number = "8712";
      hash = "sha256-qA5TaU5tQuq4/UKCgCFfiLrjTva7LxdERnIWF413+l8=";
    } # codex: add enableMcpIntegration option
    {
      number = "8770";
      hash = "sha256-1GctHo6/qowbuguH335KDtn3nAgwn6+cGlebfuE2QiY=";
    } # claude-code: fix skills implementation
    {
      number = "8783";
      hash = "sha256-W8Ufvufloq3gNT2zxegKQUHmi3KZMlcQCp9gEi0ZHuE=";
    } # claude-code: add support for output styles
    {
      number = "8823";
      hash = "sha256-P49hudgjkJOjeTElT7k5Yn6UWxStVamOU6oOZccPylI=";
    } # codex: fix skills location for new version
  ];
}
