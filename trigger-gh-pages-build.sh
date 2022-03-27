#!/bin/bash

# This script will trigger a rebuild on a repo's GitHub Pages site,
# without having to create a new commit.
# To use this script:
# 1. Save this script to an easilyt accessible place, where you'll run it.
# 2. Create a personal access token on GitHub. In Your profile > Settings
#    > Developer settings > Personal access tokens
# 3. Save the token in a text file. Idealy, alongside the script as token.txt
# 4. Run the script from the Terminal with ./trigger-gh-pages-build.sh
# 5. It will ask you for your GitHub username, the repo name, and the token file.
#
# Thanks to https://stackoverflow.com/a/54088985/1781075

curl -u $(cat ~/.github_token) -X POST https://api.github.com/repos/kamata1729/kamata1729.github.io/pages/builds
