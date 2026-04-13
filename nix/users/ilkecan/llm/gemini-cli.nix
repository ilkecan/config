{
  pkgs,
  ...
}:

{
  programs = {
    gemini-cli = {
      enable = true;
      package = pkgs.llm-agents.gemini-cli;
      settings = {
        agents = {
          browser = {
            blockFileUploads = true;
          };
        };
        general = {
          vimMode = true;
          enableNotifications = true;
        };
        model = {
          name = "gemini-3.1-flash-lite-preview";
        };
        security = {
          auth = {
            selectedType = "oauth-personal";
          };
          disableYoloMode = true;
        };
        ui = {
          footer = {
            showLabels = true;
            items = [
              "workspace"
              "git-branch"
              "sandbox"
              "model-name"
              "quota"
              "context-used"
            ];
          };
        };
      };
    };
  };
}
