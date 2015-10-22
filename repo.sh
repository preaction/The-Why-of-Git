
set -e

mkdir repo
cd repo
git init
tree .git

touch hello
git add hello
tree .git

git commit -m'initial commit'
tree .git
git log --graph --oneline
cat .git/refs/heads/master
git show-ref

mkdir files
touch files/{foo,bar,baz}
git add files
git commit -m'add files/ directory'
touch README
git add README
git commit -m'add README file'
git log --graph --oneline

git checkout -b website
touch index.html
mkdir images
touch images/logo.jpg
git add index.html images/logo.jpg
git commit -m'add initial website'
echo "Hello" > index.html
git add index.html
git commit -m'add content to index.html'
git log --oneline --graph

git log --oneline --graph --all --decorate
