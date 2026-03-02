{
  config,
  lib,
  self',
  ...
}:

let
  inherit (builtins)
    readDir
  ;

  inherit (lib)
    flatten
    listToAttrs
    mapAttrsToList
  ;

  # https://github.com/nix-community/home-manager/issues/3849#issuecomment-2115899992
  listFilesRecursive = dir:
    let
      internalFunc = acc:
        (mapAttrsToList (
          name: type: if type == "directory" then internalFunc "${acc}${name}/" else "${acc}${name}"
        ) (readDir "${dir}/${acc}"));
    in
    flatten (internalFunc "");

  toXdgFiles = dir:
    let
      toXdgFile = name:
        { inherit name; value = { source = "${dir}/${name}"; }; };
    in
    listToAttrs (map toXdgFile (listFilesRecursive dir));

  user = config.home.username;
in
{
  xdg = {
    binFile = toXdgFiles "${self'}/users/${user}/dotfiles/.local/bin";
    configFile = toXdgFiles "${self'}/users/${user}/dotfiles/.config";
    dataFile = toXdgFiles "${self'}/users/${user}/dotfiles/.local/share";
  };
}
