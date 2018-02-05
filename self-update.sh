#!/bin/bash
#
# Self bump version

repo="gohugoio/hugo"

current=$(curl https://api.github.com/repos/${repo}/releases/latest -H 'Accept: application/vnd.github.v3+json' | jq -r '.tag_name')

tag=${current/v/}

git tag | grep $tag

if [ $? -eq 0 ]
then
  echo "Tag already exist"
  exit 0
fi

echo "Bumping version to ${tag}"

sed -i 's/HUGO_VERSION=[0-9.]*/HUGO_VERSION='"${tag}"'/' Dockerfile

git add Dockerfile
git commit -m "Bump ${tag}"
git tag $tag

echo "${GIT_PRIVATE_KEY}" | base64 -d > git_rsa

export GIT_SSH_COMMAND="ssh -i $PWD/git_rsa"
git remote set-url origin git@github.com:etiennetremel/docker-hugo.git
git config --global user.email "builds@travis-ci.com"
git config --global user.name "Travis CI"
git push origin master
git push origin $tag
