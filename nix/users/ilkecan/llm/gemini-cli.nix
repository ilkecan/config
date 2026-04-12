{
  pkgs,
  ...
}:

{
  programs = {
    gemini-cli = {
      enable = true;
      package = pkgs.llm-agents.gemini-cli;
      # defaultModel = null;
      settings = {
      };
    };
  };
}
