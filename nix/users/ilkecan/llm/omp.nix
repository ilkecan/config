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
        "git diff *"
        "git log *"
        "git ls-files *"
        "git show *"
        "git status *"
        "nix eval *"
        "node --check *"
        "node --test *"
      ];
      tools.approvalMode = "write";
    };
  };
}
