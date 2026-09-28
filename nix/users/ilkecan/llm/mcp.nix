{
  config,
  ...
}:

{
  # https://github.com/natsukium/mcp-servers-nix
  mcp-servers.programs = {
    github = {
      enable = true;
      envFile = config.sops.templates.github-mpc-server-env.path;
    };
    nixos.enable = true;
  };

  programs.mcp = {
    enable = true;
    servers = {
    };
  };
}
