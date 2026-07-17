{
  pkgs,
  ...
}:

{
  programs = {
    codex = {
      enable = true;
      package = pkgs.llm-agents.codex;
      # enableMcpIntegration = true; # disable until lazy loading is implemented https://github.com/openai/codex/issues/9266
      settings = {
        model = "gpt-5.6-luna";
        model_reasoning_effort = "high";
        plan_mode_reasoning_effort = "xhigh";
        personality = "pragmatic";

        features = {
          fast_mode = false;
          multi_agent = true;
        };

        tui = {
          status_line = [
            "model-with-reasoning"
            "context-remaining"
            "current-dir"

            "project-root"
            "git-branch"

            "context-used"
            "five-hour-limit"
            "weekly-limit"

            "context-window-size"
            "used-tokens"
            "total-input-tokens"
            "total-output-tokens"
          ];

          theme = "solarized-dark";
        };
      };
    };
  };
}
