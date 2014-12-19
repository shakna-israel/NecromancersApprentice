rm -rf writegood.txt
write-good *.md > writegood.txt
rm -rf gh-pages/_posts
cp *.md gh-pages/_posts/*.md
