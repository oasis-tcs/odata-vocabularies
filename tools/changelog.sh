folder=$(mktemp -d)
git log | node tools/changelog >$folder/CHANGELOG.md
cd $folder
git init -b main
git add .
git commit -m "changelog"
git push --force git@github.com:oasis-tcs/odata-vocabularies.git main:changelog
