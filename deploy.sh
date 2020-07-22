#!/bin/sh

echo "Checking out gh-pages branch into public"
git worktree add -B gh-pages public origin/gh-pages

echo "adding CNAME file"
touch public/CNAME
echo "fazalkhan.net" > public/CNAME

echo "Updating gh-pages branch"
cd public && git add --all && git commit -m "Publishing to gh-pages (publish.sh)"

echo "Pushing to github"
git push --all