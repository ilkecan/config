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
        "git branch *"
        "git cat-file *"
        "git diff *"
        "git for-each-ref *"
        "git grep *"
        "git log *"
        "git ls-files *"
        "git remote *"
        "git rev-parse *"
        "git show *"
        "git status *"
        "git tag --list"
        "jq *"
        "nix derivation show *"
        "nix eval *"
        "nix flake check *"
        "nix flake check"
        "nix flake metadata *"
        "nix flake metadata"
        "nix flake show *"
        "nix flake show"
        "nix hash *"
        "nix-prefetch-url *"
        "nixfmt *"
        "node --check *"
        "node --test *"
        "stat *"
        "wc *"
        "which *"
      ];
    };
  };
}
