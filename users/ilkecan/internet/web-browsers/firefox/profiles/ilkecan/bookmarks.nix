{
  lib,
  ...
}:

{
  programs.firefox.profiles.ilkecan.bookmarks = {
    force = true;
    settings = [
      {
        toolbar = true;
        bookmarks = [
          {
            name = "Proton Mail";
            url = "https://mail.proton.me/u/0/inbox";
            tags = [ "proton" ];
          }
          {
            name = "Proton Calendar";
            url = "https://calendar.proton.me/u/0/";
            tags = [ "proton" ];
          }
          "separator"
          {
            name = "Google Translate";
            url = "https://translate.google.com/?sl=auto&tl=en&op=translate";
            tags = [ "translate" ];
          }
          {
            name = "DeepL";
            url = "https://www.deepl.com/en/translator";
            tags = [ "translate" ];
          }
          {
            name = "Kagi Translate";
            url = "https://translate.kagi.com/";
            tags = [ "translate" ];
          }
          "separator"
          {
            name = "ChatGPT";
            url = "https://chatgpt.com/";
            tags = [ "llm" ];
          }
          {
            name = "DeepSeek";
            url = "https://chat.deepseek.com/";
            tags = [ "llm" ];
          }
          {
            name = "Claude";
            url = "https://claude.ai/new";
            tags = [ "llm" ];
          }
        ];
      }
      {
        name = "Nix";
        bookmarks = [
          {
            name = "Nix reference manual";
            url = "https://nix.dev/manual/nix";
            tags = [ "nix" ];
          }
          {
            name = "NixOS Manual";
            url = "https://nixos.org/manual/nixos/stable/";
            tags = [ "nix" ];
          }
          {
            name = "Nixpkgs Reference Manual";
            url = "https://nixos.org/manual/nixpkgs/stable/";
            tags = [ "nix" ];
          }
          {
            name = "Home Manager Configuration Options";
            url = "https://nix-community.github.io/home-manager/options.xhtml";
            tags = [ "nix" ];
          }
          {
            name = "devenv Reference";
            url = "https://devenv.sh/reference/options/";
            tags = [ "nix" ];
          }
          {
            name = "NVF Options";
            url = "https://nvf.notashelf.dev/options.html";
            tags = [ "nix" ];
          }
        ];
      }
      {
        name = "Nixpkgs";
        bookmarks = [
          {
            name = "Hydra failures by maintainer";
            url = "https://zh.fail/failed/overview.html";
            tags = [ "nixpkgs" ];
          }
          {
            name = "Repology - Maintained by me";
            url = "https://repology.org/maintainer/${lib.maintainers.ilkecan.email}";
            tags = [ "nixpkgs" ];
          }
        ];
      }
    ];
  };
}
