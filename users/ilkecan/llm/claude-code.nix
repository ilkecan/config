{
  pkgs,
  ...
}:

{
  home = {
    sessionVariables = {
      CLAUDE_CODE_DISABLE_AUTO_MEMORY = 0;
    };

    packages = with pkgs; [ starship ];
  };

  programs = {
    claude-code = {
      enable = true;
      package = pkgs.llm-agents.claude-code;
      enableMcpIntegration  = true;
    };
  };
}
