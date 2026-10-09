{
  pkgs,
  ...
}:

{
  home = {
    sessionVariables = {
      CLAUDE_CODE_DISABLE_AUTO_MEMORY = 1;
      ENABLE_TOOL_SEARCH = "true";
    };

    packages = with pkgs; [
      llm-agents.ccstatusline # https://github.com/sirmalloc/ccstatusline
    ];
  };

  programs = {
    claude-code = {
      enable = true;
      package = pkgs.unstable.claude-code;
      settings = {
      };
    };
  };
}
