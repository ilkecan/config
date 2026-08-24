{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    llm-agents.omp # https://github.com/can1357/oh-my-pi
  ];
}
