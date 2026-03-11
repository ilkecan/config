{
  inputs,
}:

{
  owner = "nix-community";
  repo = "home-manager";
  src = inputs.home-manager;
  name = "home-manager";
  pulls = {
    "8290" = "sha256-hSnOwFX04GQcOwlxPsDJxVV8b6FIFvuckCAm0fjfLvI=";
    "8305" = "sha256-osWWAfqhc9X8QlGjSe4cnffj/ljB+KQGfSLT3o4Dd60=";
    "8365" = "sha256-AKXVJmltOEiYu71gTb5yhlKTP21Ce0vuEogstWOAUa8=";
    "8770" = "sha256-1GctHo6/qowbuguH335KDtn3nAgwn6+cGlebfuE2QiY=";
    "8543" = "sha256-Swwm+ejwIKVI4tQy7ilPNwMoUlBejPm2NfMDrY+dJz0=";
    "8783" = "sha256-W8Ufvufloq3gNT2zxegKQUHmi3KZMlcQCp9gEi0ZHuE=";
  };
}
