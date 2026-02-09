{
  ...
}:

{
  programs.zsh.setOptions = [
    # https://man.archlinux.org/man/zshoptions.1
    ## Changing Directories
    # "AUTO_CD"

    ## Completion
    "NO_AUTO_REMOVE_SLASH"
    "COMPLETE_ALIASES"
    "LIST_PACKED"

    ## Expansion and Globbing
    "NO_BARE_GLOB_QUAL"
    "BRACE_CCL"
    "MARK_DIRS"

    ## Input/Output
    "RM_STAR_WAIT"

    ## Scripts and Functions
    "C_BASES"
    "NO_MULTI_FUNC_DEF"
    "OCTAL_ZEROES"
    "PIPE_FAIL"

    ## Zle
    "NO_BEEP"
  ];
}
