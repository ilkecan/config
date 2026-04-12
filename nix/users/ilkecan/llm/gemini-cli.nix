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
        general = {
          vimMode = true;
          enableNotifications = true;
        };
        agents = {
          browser = {
            blockFileUploads = true;
          };
        };
      };
    };
  };
}
