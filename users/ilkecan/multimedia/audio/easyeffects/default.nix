{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

let
  inherit (builtins)
    readDir
  ;

  inherit (lib)
    attrNames
    filter
    functionArgs
    genAttrs
    intersectAttrs
    isFunction
    levenshteinAtMost
    pipe
    sortOn
    filterAttrs
    levenshtein
    take
    length
    unsafeGetAttrPos
    head
    elemAt
    concatStringsSep
  ;

  importFileWith = autoArgs: fn:
    let
      f = if isFunction fn then fn else import fn;
      fargs = functionArgs f;

      args = intersectAttrs fargs autoArgs;

      # a list of argument names that the function requires, but
      # wouldn't be passed to it
      missingArgs =
        # Filter out arguments that have a default value
        (
          filterAttrs (name: value: !value)
            # Filter out arguments that would be passed
            (removeAttrs fargs (attrNames args))
        );
      # Get a list of suggested argument names for a given missing one
      getSuggestions =
        arg:
        pipe autoArgs [
          attrNames
          # Only use ones that are at most 2 edits away. While mork would work,
          # levenshteinAtMost is only fast for 2 or less.
          (filter (levenshteinAtMost 2 arg))
          # Put strings with shorter distance first
          (sortOn (levenshtein arg))
          # Only take the first couple results
          (take 3)
          # Quote all entries
          (map (x: "\"" + x + "\""))
        ];

        prettySuggestions =
          suggestions:
          if suggestions == [ ] then
            ""
          else if length suggestions == 1 then
            ", did you mean ${elemAt suggestions 0}?"
          else
            ", did you mean ${concatStringsSep ", " (lib.init suggestions)} or ${lib.last suggestions}?";

        errorForArg =
          arg:
          let
            loc = unsafeGetAttrPos arg fargs;
            loc' = if loc != null then loc.file + ":" + toString loc.line else "<unknown location>";
          in
          "Function called without required argument \"${arg}\" at "
          + "${loc'}${prettySuggestions (getSuggestions arg)}";

        # Only show the error for the first missing argument
        error = errorForArg (head (attrNames missingArgs));
    in
    if missingArgs == { } then
      f args
    # This needs to be an abort so it can't be caught with `builtins.tryEval`,
    # which is used by nix-env and ofborg to filter out packages that don't evaluate.
    # This way we're forced to fix such errors in Nixpkgs,
    # which is especially relevant with allowAliases = false
    else
      abort "importWith: ${error}";
  importFile = importFileWith pkgs;

  relativeTo = dir: path:
    dir + "/${toString path}";

  user = config.home.username;
  dataRelPath = "easyeffects/autoload";
in
{
  services.easyeffects = {
    # https://github.com/wwmm/easyeffects
    enable = true;

    # https://github.com/wwmm/easyeffects/wiki/Community-Presets
    extraPresets = genAttrs (attrNames (readDir ./presets)) (x: importFile (relativeTo ./presets x)) ;
  };

  xdg.dataFile.${dataRelPath} = {
    source = "${inputs.self}/users/${user}/dotfiles/.local/share/${dataRelPath}";
    recursive = true;
  };
}
