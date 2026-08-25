{
  pkgs,
  ...
}:

let
  mkAllow = match: {
    inherit match;
    approval = "allow";
  };
in
{
  programs.omp = {
    enable = true;
    package = pkgs.llm-agents.omp; # https://github.com/can1357/oh-my-pi
    settings = {
      bash.patterns = map mkAllow [
        "git diff"
        "git log"
        "git show"
        "nix eval"
      ];
      tools.approvalMode = "write";
    };
  };
}
