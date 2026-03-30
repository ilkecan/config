{
  lib,
  pkgs,
  ...
}:

let
  inherit (lib)
    getExe
    ;
in
{
  home = {
    sessionVariables = {
    };

    packages = with pkgs; [
      llm-agents.ccusage-codex # https://github.com/ryoppippi/ccusage
      nodejs_latest # https://github.com/nodejs/node - /experimental -> JavaScript REPL
    ];
  };

  programs = {
    codex = {
      enable = true;
      package = pkgs.llm-agents.codex;
      # enableMcpIntegration = true; # disable until lazy loading is implemented https://github.com/openai/codex/issues/9266
      settings = {
        model = "gpt-5.4";
        model_reasoning_effort = "high";
        plan_mode_reasoning_effort = "xhigh";
        personality = "pragmatic";

        features = {
          # guardian_approval = true; # to prevent wasting tokens (?)
          fast_mode = false;
          js_repl = true;
          multi_agent = true;
          use_linux_sandbox_bwrap = true;
        };

        notify = [
          (getExe (
            pkgs.writeShellApplication {
              name = "codex-notify";
              runtimeInputs = with pkgs; [
                jq
                libnotify
              ];
              text = ''
                thread_id=$(echo "$1" | jq -r '."thread-id"')
                last_message=$(echo "$1" | jq -r '."last-assistant-message"')
                notify-send "Codex - $thread_id" "$last_message"
              '';
            }
          ))
        ];

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
