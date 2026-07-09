#!/usr/bin/env bash
#
# WorldVistA Extended Engineering Console
# Git Status Library
#

show_git_status() {

    echo
    echo "Repository"
    echo "----------"

    local branch commit tag

    branch=$(git -C "$HOME/wvec" branch --show-current 2>/dev/null)
    commit=$(git -C "$HOME/wvec" rev-parse --short HEAD 2>/dev/null)
    tag=$(git -C "$HOME/wvec" describe --tags --abbrev=0 2>/dev/null)

    [ -z "$branch" ] && branch="Unknown"
    [ -z "$commit" ] && commit="Unknown"
    [ -z "$tag" ] && tag="None"

    printf "Branch : %s\n" "$branch"
    printf "Commit : %s\n" "$commit"
    printf "Tag    : %s\n" "$tag"
}
