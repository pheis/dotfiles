#!/bin/bash

# Get the current repository information
REPO_URL=$(git config --get remote.origin.url)
OWNER=$(echo "$REPO_URL" | sed -E 's|.*[:/]([^/]+)/([^/]+)(\.git)?$|\1|')
REPO=$(echo "$REPO_URL" | sed -E 's|.*[:/]([^/]+)/([^/]+)(\.git)?$|\2|' | sed 's/\.git$//')

# Get the current branch name
BRANCH=$(git branch --show-current)

# Find PR number associated with current branch
# This requires the branch to be pushed to GitHub and associated with a PR
PR_NUMBER=$(gh pr view "$BRANCH" --json number -q .number 2>/dev/null)

if [ -z "$PR_NUMBER" ]; then
	exit 0
  # echo "No pull request found for branch $BRANCH"
  # exit 1
fi

# Execute the GitHub API command
gh api \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "/repos/$OWNER/$REPO/pulls/$PR_NUMBER/comments" \
 | jq '
  group_by({path: .path, line: .line}) | # Group comments by path and line
  map(
    {
      path: .[0].path,                   # Get path from the first comment in the group
      line: .[0].line,                   # Get line from the first comment in the group
      thread: (                          # Create the thread array
        . | sort_by(.created_at) |       # Sort comments in the group by creation time
        map({                            # Map each comment to a simpler object
          id: .id,
          user: .user.login,
          body: .body,
          created_at: .created_at,
          reply_to_id: (.in_reply_to_id // null) # Include reply_to ID if present, else null
        })
      )
    }
  )
' \
| jq -r '.[] | .path as $p | .line as $l | .thread[0] | "\($p):\($l): [\(.user)] \(.body)"'
