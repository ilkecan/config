{
  pkgs,
  ...
}:

{
  home = {
    sessionVariables = {
      CLAUDE_CODE_DISABLE_AUTO_MEMORY = 0;
    };

    packages = with pkgs.llm-agents; [
      claude-code
    ];
  };
}
