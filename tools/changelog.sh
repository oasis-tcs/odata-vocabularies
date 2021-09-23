remote=$(git remote show origin | grep -P -o "(?<=Push  URL: ).*")
folder=$(mktemp -d)
git log | node tools/changelog >$folder/CHANGELOG.md
cd $folder
git init -b main
git add .
git commit -m "changelog"
git push --force $remote main:changelog
