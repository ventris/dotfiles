in_git_repos() {
    test "`git rev-parse --is-inside-work-tree 2>/dev/null`" = "true"
}

git_current_branch() {
    if in_git_repos; then
        ref=$(git symbolic-ref HEAD 2> /dev/null) || \
        ref=$(git rev-parse --short HEAD 2> /dev/null) || return
        echo "%{\e[38;5;214m%}${ref#refs/heads/}%{${reset_color}%}"
    fi
}

git_status_modified() {
    if in_git_repos; then
        local lines=$(git status --porcelain | egrep  '^\ M ' | wc -l)
        test $lines = 0
    fi
}
number_status_modified() {
	local lines=$(git status --porcelain | egrep  '^\ M ' | wc -l)
    echo "%{$fg[blue]%}✚ $lines%{${reset_color}%}"
}

git_status_staged() {
    if in_git_repos; then
        local lines=$(git diff --name-only --cached | wc -l)
        test $lines = 0
    fi
}
number_status_staged() {
	local lines=$(git diff --name-only --cached | wc -l)
    echo "%{$fg[red]%}● $lines%{${reset_color}%}"
}

git_status_conflict() {
    if in_git_repos; then
        local lines=$(git status --porcelain | egrep '^AA ' | wc -l)
        test $lines = 0
    fi
}
number_status_conflict() {
	local lines=$(git status --porcelain | egrep  '^\?\? ' | wc -l)
	echo "%{$fg[red]%}✖ $lines%{${reset_color}%}"
}

git_status_unknown() {
    if in_git_repos; then
        local lines=$(git status --porcelain | egrep '^\?\? ' | wc -l)
        test $lines = 0
    fi
}
number_status_unknown() {
	local lines=$(git status --porcelain | egrep  '^\?\? ' | wc -l)
	echo "%{$fg[white]%}$lines%{${reset_color}%}"
}

git_to_push() {
    if in_git_repos; then
		local curr_branch=$(git rev-parse --abbrev-ref HEAD);
		local curr_remote=$(git config branch.$curr_branch.remote);
		local curr_merge_branch=$(git config branch.$curr_branch.merge | cut -d / -f 3);
		local lines=$(git rev-list --left-right --count $curr_branch...$curr_remote/$curr_merge_branch | awk '{print $1}';)
        test $lines = 0
    fi
}
number_to_push() {
	local curr_branch=$(git rev-parse --abbrev-ref HEAD);
	local curr_remote=$(git config branch.$curr_branch.remote);
	local curr_merge_branch=$(git config branch.$curr_branch.merge | cut -d / -f 3);
	local lines=$(git rev-list --left-right --count $curr_branch...$curr_remote/$curr_merge_branch | awk '{print $1}';)
	echo "%{$fg[white]%}↑$lines%{${reset_color}%}"
}

git_to_pull() {
    if in_git_repos; then
		local curr_branch=$(git rev-parse --abbrev-ref HEAD);
		local curr_remote=$(git config branch.$curr_branch.remote);
		local curr_merge_branch=$(git config branch.$curr_branch.merge | cut -d / -f 3);
		local lines=$(git rev-list --left-right --count $curr_branch...$curr_remote/$curr_merge_branch | awk '{print $2}';)
        test $lines = 0
    fi
}
number_to_pull() {
	local curr_branch=$(git rev-parse --abbrev-ref HEAD);
	local curr_remote=$(git config branch.$curr_branch.remote);
	local curr_merge_branch=$(git config branch.$curr_branch.merge | cut -d / -f 3);
	local lines=$(git rev-list --left-right --count $curr_branch...$curr_remote/$curr_merge_branch | awk '{print $2}';)
	echo "%{$fg[white]%}↓$lines%{${reset_color}%}"
}


git_stash_is_clean() {
    if in_git_repos; then
        local lines=$(git stash list | wc -l)
        test $lines = 0
    fi
}

git_no_branches() {
    if in_git_repos; then
        local lines=$(git branch | wc -l)
        test $lines = 1
    fi
}

git_branch_is_pushed() {
    if in_git_repos; then
        if git branch -r | grep "origin/master" >/dev/null 2>&1; then
            git_no_remote || git diff-tree --quiet origin/master heads/master
        fi
    fi
}


STATUS_IS_CLEAN() {
    status_clean=$(git status --porcelain | egrep -v '^\?\? ' | wc -l)
	echo "$status_clean"
}

UNKNOWN_FILES() {
	local lines=$(git status --porcelain | egrep '^\?\? ' | wc -l)
	echo "$lines"
}

#-----------------------------------------------------------------------------

git_prompt_precmd() {
    local GITINFO=""
    if [ ! -z `git_current_branch` ]; then
        GITINFO=" [`git_current_branch`"
        #if ! git_to_push; then
        #    GITINFO="$GITINFO`number_to_push`"
        #fi
        #if ! git_to_pull; then
        #    GITINFO="$GITINFO`number_to_pull`"
        #fi
        if ! git_status_staged || ! git_status_conflict || ! git_status_modified || ! git_status_unknown || ! git_stash_is_clean; then
            GITINFO="$GITINFO|"
        fi
        if ! git_status_staged; then
            GITINFO="$GITINFO`number_status_staged`"
        fi
        if ! git_status_conflict; then
            GITINFO="$GITINFO`number_status_conflict`"
        fi
        if ! git_status_modified; then
            GITINFO="$GITINFO`number_status_modified`"
        fi
        if ! git_status_unknown; then
            GITINFO="$GITINFO…"
        fi
        if ! git_stash_is_clean; then
            GITINFO="$GITINFO☰ "
        fi
        GITINFO="$GITINFO ]"
    fi
    echo "$GITINFO"
}

