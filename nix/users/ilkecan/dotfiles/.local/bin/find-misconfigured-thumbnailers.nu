#!/usr/bin/env nu

def get-pnames []: nothing -> list<string> {
    nix-locate "/share/thumbnailers/" --minimal
    | lines
    | each { str replace --regex '\.out$' '' }
}

def find-thumbnailers [channel: string]: list<string> -> list<path> {
    $in | par-each {|pname|
        try {
            let out = (
                nix build -f $"<($channel)>" $pname --no-link --print-out-paths
            )

            glob $"($out)/share/thumbnailers/*"
        } catch {
            print $"Skipping ($pname): not in this nixpkgs"
            []
        }
    } | flatten
}

def find-unpatched-thumbnailers []: list<path> -> nothing {
    $in | where {|thumbnailer|
        open --raw $thumbnailer
        | lines
        | any {|line|
            $line =~ '^(Exec|TryExec)=' and $line !~ '^(Exec|TryExec)=/nix/store/'
        }
    }
}

# "/nix/store/ffmpfsxv7hmkdxapfyac8yzhih6jg4hz-glslviewer-3.5.2" -> "glslviewer"
def store-path-to-pname []: path -> string {
    $in | parse --regex '/nix/store/[a-z0-9]{32}-(?P<name>.+?)-[0-9]' | get name.0
}

def main [--unstable]: nothing -> list<string> {
    let channel = if $unstable { "nixpkgs-unstable" } else { "nixpkgs" }
    get-pnames | find-thumbnailers $channel | uniq | find-unpatched-thumbnailers | each { store-path-to-pname } | uniq | sort
}
