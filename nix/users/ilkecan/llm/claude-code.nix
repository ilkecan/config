{
  pkgs,
  ...
}:

{
  home = {
    sessionVariables = {
      CLAUDE_CODE_DISABLE_AUTO_MEMORY = 0;
      ENABLE_TOOL_SEARCH = "true";
    };

    packages = with pkgs; [
      llm-agents.ccstatusline # https://github.com/sirmalloc/ccstatusline
      llm-agents.ccusage # https://github.com/ryoppippi/ccusage
    ];
  };

  programs = {
    claude-code = {
      enable = true;
      package =
        (pkgs.llm-agents.claude-code.override {
          disableTelemetry = true;
        }).overrideAttrs
          (prev: {
            # TODO: remove this after 26.05
            meta = prev.meta // {
              maintainers = [ ];
            }; # to fix `attribute 'ryoppippi' missing`
          });
      enableMcpIntegration = true;
      settings = {
      };
    };
  };
}
