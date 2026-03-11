{
  config,
  ...
}:

{
  # https://github.com/natsukium/mcp-servers-nix
  mcp-servers.programs = {
    fetch.enable = true;
    git.enable = true;
    github = { enable = true; envFile = config.sops.templates.github-mpc-server-env.path; };
    memory.enable = true;
    nixos.enable = true;
    sequential-thinking.enable = true;
    serena = { enable = true; args = [ "--project-from-cwd" ]; context = "claude-code"; enableWebDashboard = true; };
    terraform.enable = true;
    time.enable = true;
  };

  programs.mcp = {
    enable = true;
    servers = {
    };
  };
}
