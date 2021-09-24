remote=$(git remote show origin | grep -P -o "(?<=Push  URL: ).*")
folder=$(mktemp -d)
node lib/changelog >$folder/CHANGELOG.md
cd $folder
git init -b main
git add .
git commit -m "changelog"
git push --force $remote main:changelog

# Alternative
# node lib/changelog >CHANGELOG.md
# git diff-index --quiet HEAD || git commit -m "changelog"
# git push
