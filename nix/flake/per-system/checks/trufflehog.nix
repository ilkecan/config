{
  pkgs,
  self,
}:

pkgs.runCommand "trufflehog-check"
  {
    nativeBuildInputs = with pkgs; [ trufflehog ];
    __impure = true;
  }
  ''
    trufflehog filesystem ${self} --github-actions --fail --results=verified
    touch $out
  ''
