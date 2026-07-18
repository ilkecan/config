{
  lib',
  pkgs,
  ...
}:

let
  inherit (lib'.ilkecan)
    writeNushellScript
    ;
in
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

        hooks.PermissionRequest = [
          {
            matcher = "*";
            hooks = [
              {
                type = "command";
                command = writeNushellScript "codex-permission-notify.nu" ''
                  def main [] {
                      let payload = (open /dev/stdin --raw | from json)

                      let title = $"Codex - ($payload.hook_event_name)"
                      let body = [
                        $payload.tool_input.description,
                        $payload.tool_input.command,
                      ] | str join "\n"

                      ^notify-send $title $body
                  }
                '';
                timeout = 1;
                statusMessage = "Sending notification";
              }
            ];
          }
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
