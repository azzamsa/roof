#!/usr/bin/env python3

"""
Usage example:
python scripts/release.py 1.0.0 43934a367
"""

import subprocess
import sys

def check_untracked_files():
    untracked_files = subprocess.check_output(['git', 'ls-files', '.', '--exclude-standard', '--others'], universal_newlines=True).strip()
    return untracked_files

def update_changelog(tag):
    subprocess.run(['git-cliff', '--tag', tag, '--config', 'configs/cliff.toml', '>', 'CHANGELOG.md'], shell=True)

def format_changelog():
    subprocess.run(['just', 'fmt'], shell=True)

def commit_and_tag(tag):
    subprocess.run(['git', 'add', '--all'], check=True)
    subprocess.run(['git', 'commit', '--message=' + tag], check=True)
    subprocess.run(['git', 'show'], check=True)
    subprocess.run(['git', 'tag', '--sign', '--annotate', tag, '--message=' + tag, '--message=For details, see the CHANGELOG.md'], check=True)
    subprocess.run(['git', 'tag', '--verify', tag], check=True)

def main():
    # Check for untracked files
    untracked_files = check_untracked_files()
    if untracked_files:
        print("warn: Please stash or remove the untracked files")
        sys.exit(1)

    # Check if tag is provided
    if len(sys.argv) < 2:
        print("warn: Please provide a tag")
        sys.exit(1)

    tag = sys.argv[1]

    # Update changelog
    update_changelog(tag)
    # Format changelog
    format_changelog()
    # Commit and tag
    commit_and_tag(tag)

if __name__ == "__main__":
    main()
