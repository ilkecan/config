{
  lib,
  fetchFromGitHub,
}:

let
  microphonePreset = fetchFromGitHub {
    # https://gist.github.com/jtrv/47542c8be6345951802eebcf9dc7da31
    githubBase = "gist.github.com";
    owner = "jtrv";
    repo = "47542c8be6345951802eebcf9dc7da31";
    rev = "e4a1ff4755fec2598b0391f318e0c1e7ca7c5820";
    hash = "sha256-nEWlDU/Oa98gyuClVy3rtF5zidHByT1Nfm+tRMCQ3Dg=";
  };
in
lib.importJSON "${microphonePreset}/EasyEffects Microphone Preset: Masc NPR Voice + Noise Reduction.json"
