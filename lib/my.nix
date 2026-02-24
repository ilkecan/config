{
  pkgs,
  ...
}:

let
  inherit (pkgs)
    lib
  ;

  inherit (lib)
    functionArgs
    intersectAttrs
    isFunction
  ;
in
{
  callExpression =
    let
      callExpressionWith = autoArgs: fn:
        let
          f = if isFunction fn then fn else import fn;
          fargs = functionArgs f;
          args = intersectAttrs fargs autoArgs;
        in
        f args;
    in
    callExpressionWith pkgs;

  relativeTo = dir: path:
    dir + "/${toString path}";
}
