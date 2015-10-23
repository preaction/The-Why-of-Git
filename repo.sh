
set -x
PWD=$(pwd)
REPO_DIR=${1:-repo}

rm -rf $REPO_DIR
mkdir $REPO_DIR

cd $REPO_DIR
git init
tree .git

touch hello
git add hello
tree .git

git commit -m'initial commit'
tree .git
git ls-tree HEAD
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
git ls-tree HEAD
git ls-tree HEAD files/

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
tree .git
git show-ref

git log --oneline --graph --all --decorate

git checkout master
echo "We have a website!" > README
git add README
git commit -m'mention our website'

git log --oneline --graph --all --decorate

git merge website -m'deploy website'

git log --oneline --graph --all --decorate

git checkout website
echo "More content" >> index.html
git add index.html
git commit -m'add more content'

git checkout master
git log --oneline --graph --all --decorate

git merge website -m're-deploy website'
git log --oneline --graph --all --decorate

git checkout website
git merge master
git log --oneline --graph --all --decorate

touch images/new-logo.jpg
git add images/new-logo.jpg
git commit -m'add new logo image'

echo "Add new logo" >> index.html
git add index.html
git commit -m'replace old logo with new logo'

git log --oneline --graph --all --decorate

git checkout master
touch files/{fizz,buzz}
git add files/{fizz,buzz}
git commit -m'add fizz and buzz'

git log --oneline --graph --all --decorate

git checkout website
git rebase master

git log --oneline --graph --all --decorate

git checkout master
git merge website

git log --oneline --graph --all --decorate

mkdir remotes
git clone --bare . remotes/origin
git remote add origin remotes/origin

git clone remotes/origin remotes/bob

cd remotes/bob
echo "Bob was here" >> README
git add README
git commit -m'Bob was here!'
git push origin master

cd ../..

echo "New employee, Bob!" >> index.html
git add index.html
git commit -m'welcome new employee, Bob'
git push origin master


git fetch origin
git log --oneline --graph --all --decorate --remotes
git show-ref


git rebase origin/master
git push origin master
git log --oneline --graph --all --decorate --remotes
git show-ref


cd $PWD
