remote=$(git remote show origin | grep -P -o "(?<=Push  URL: ).*")
folder=$(mktemp -d)
git log | node lib/changelog >$folder/CHANGELOG.md
cd $folder
git init -b main
git add .
git commit -m "changelog"
git push --force $remote main:changelog

# Alternative
# git log | node lib/changelog >$folder/CHANGELOG.md
# git diff-index --quiet HEAD || git commit -m "auto-refreshed"
# git push
