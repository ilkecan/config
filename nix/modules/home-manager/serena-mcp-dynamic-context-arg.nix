{
  config,
  lib,
  ...
}:

let
  inherit (lib)
    mkIf
    replaceElemAt
    ;

  inherit (lib.lists)
    findFirstIndex
    ;

  mcpCfg = config.programs.mcp;
  serenaCfg = mcpCfg.servers.serena;

  contextArgIndex = findFirstIndex (x: x == "--context") null serenaCfg.args;
  noContextArg = contextArgIndex == null;
  contextArgValueIndex = contextArgIndex + 1;
  mkSerenaArgs =
    context:
    if noContextArg then
      serenaCfg.args
      ++ [
        "--context"
        context
      ]
    else
      replaceElemAt serenaCfg.args contextArgValueIndex context;
in
{
  config = mkIf mcpCfg.enable {
    programs = {
      claude-code = mkIf config.programs.claude-code.enableMcpIntegration {
        mcpServers.serena = {
          inherit (serenaCfg) command;
          args = mkSerenaArgs "claude";
          enabled = true;
          type = "stdio";
        };
      };

      codex = mkIf config.programs.codex.enableMcpIntegration {
        settings.mcp_servers.serena = {
          inherit (serenaCfg) command;
          args = mkSerenaArgs "codex";
          enabled = true;
        };
      };
    };
  };
}
