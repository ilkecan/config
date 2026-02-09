#!/usr/bin/env python3

import subprocess
import sys  # argv
import re   # compile()

CHARACTER_MAPPINGS = {
    'ð': 'ğ',
    'Ð': 'Ğ',
    'ý': 'ı',
    'Ý': 'İ',
    'þ': 'ş',
    'Þ': 'Ş',
}

def format_subtitle(filename):
    # formatted_subtitle = None

    with open(filename, "r", encoding="latin1") as f:
        formatted_subtitle = replace_all(f.read());

    with open(filename, "w", encoding="utf-8") as f:
        f.write(formatted_subtitle)

def replace_all(string):
    pattern = re.compile("|".join([re.escape(k) for k in CHARACTER_MAPPINGS]))

    return pattern.sub(lambda x: CHARACTER_MAPPINGS[x.group(0)], string)

if __name__ == "__main__":
    filename = sys.argv[1]
    mime_encoding = subprocess.check_output(["file", "--mime-encoding", filename]).decode()

    if "iso-8859-1" in mime_encoding:
        format_subtitle(filename)
