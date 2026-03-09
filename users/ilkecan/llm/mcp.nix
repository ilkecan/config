{
  ...
}:

{
  # https://github.com/natsukium/mcp-servers-nix
  mcp-servers.programs = {
    fetch.enable = true;
    git.enable = true;
    github.enable = true;
    memory.enable = true;
    nixos.enable = true;
    sequential-thinking.enable = true;
    serena = { enable = true; context = "claude-code"; enableWebDashboard = true; };
    terraform.enable = true;
  };

  programs.mcp = {
    enable = true;
    servers = {
    };
  };
}
