#!/bin/sh -l

git init
git config user.name "$GITHUB_ACTOR"
git config user.email "$GITHUB_ACTOR@users.noreply.github.com"
wget https://api.github.com/repos/$GITHUB_REPOSITORY/contents
git add .
git commit -m 'get tree'


remote_repo="https://$GITHUB_ACTOR:${ github.token }@github.com/$GITHUB_REPOSITORY.git"
echo $remote_repo
echo "https://$GITHUB_ACTOR@github.com/$GITHUB_REPOSITORY.git"
echo $ACTIONS_RUNTIME_TOKEN
git push --force $remote_repo master:tree
