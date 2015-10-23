
# The Why of Git

------

# `git` is a file system

---

# `git` is a database

------

# `git init`

## Initialize the database

---

```
$ git init
Initialized empty Git repository in /Users/doug/test-repo/.git/
```

---

```
$ tree .git
.git
├── HEAD
├── config
├── description
├── hooks/
├── info/
│   └── exclude
├── objects/
│   ├── info/
│   └── pack/
└── refs/
    ├── heads/
    └── tags/
```

------

# Add a file

---

```
$ touch hello
$ git add hello
```

---

# Our First Object

---

```
$ tree .git
.git
├── objects/
│   ├── e6/
│   │   └── 9de29bb2d1d6434b8b29ae775ad8c2e48c5391
```

---

# Blob Object

---

# File Object

---

# SHA-1 Hash

---

# Content Address

[Wikipedia: Content-Addressable Storage](https://en.wikipedia.org/wiki/Content-addressable_storage)

---

# Every file, every version

------

# Make a commit

---

```
$ git commit
```

---

```
$ tree .git
.git
├── objects/
│   ├── 8b/
│   │   └── c5573ec6db6a18cf34b546e0f510ba421b7e1e
│   ├── e6/
│   │   └── 9de29bb2d1d6434b8b29ae775ad8c2e48c5391
│   ├── f9/
│   │   └── 66952d7e0715683ee935d201cd4ab22736c831
└── refs/
    ├── heads/
    │   └── master
```

---

# New Objects

------

# Tree Object

---

# Directory Object

---

# Refers to Blob and Tree Objects

---

# Gives a File a Name

---

```
$ git ls-tree HEAD
100644 blob e69de29bb2d1d6434b8b29ae775ad8c2e48c5391    hello
```

------

# Commit Object

---

# Refers to Tree Objects

---

# Refers to other Commits

---

# Has Commit info

---

# Commit Message

---

# Author

---

# Current Date/Time

---

```
$ git log --graph --oneline
* 8bc5573 add initial commit
```

---

# Content Address

---

# Change Content, Change Address

------

# Refs

---

```
$ tree .git
.git
└── refs/
    ├── heads/
    │   └── master
```

---

# Branches and Tags

---

```
$ cat .git/refs/heads/master
8bc5573ec6db6a18cf34b546e0f510ba421b7e1e
```

---

```
$ git show-ref
8bc5573ec6db6a18cf34b546e0f510ba421b7e1e refs/heads/master
```

------

# Add more commits!

---

```
$ git log --graph --oneline
* 8804845 add README file
* fca4d30 add files/ directory
* 8bc5573 add initial commit
```

---

# Add more trees!

---

```
$ git ls-tree HEAD
100644 blob e69de29bb2d1d6434b8b29ae775ad8c2e48c5391    README
040000 tree 4e126a1a1821dd5763468eb219c1ecdb6f7f0fda    files
100644 blob e69de29bb2d1d6434b8b29ae775ad8c2e48c5391    hello
```

---

```
$ git ls-tree HEAD files/
100644 blob e69de29bb2d1d6434b8b29ae775ad8c2e48c5391    files/bar
100644 blob e69de29bb2d1d6434b8b29ae775ad8c2e48c5391    files/baz
100644 blob e69de29bb2d1d6434b8b29ae775ad8c2e48c5391    files/foo
```

------

# Create a Branch

```
$ git checkout -b website
```

---

# Add Commits

```
$ git log --oneline --graph
* 517c244 add content to index.html
* 09e37fc add initial website
* 8804845 add README file
* fca4d30 add files/ directory
* 8bc5573 add initial commit
```

---

# New ref!

---

```
$ tree .git
.git
└── refs
    ├── heads
    │   ├── master
    │   └── website
    └── tags
```

---

```
$ git show-ref
ae69e64362452041b510f65f4e00e6e05a2e4e26 refs/heads/master
2b777cc60dc9708f346bd952bfc74e5adea75ae0 refs/heads/website
```

------

# View all Commits

---

```
$ git log --oneline --graph --all --decorate
* 517c244 (HEAD -> website) add content to index.html
* 09e37fc add initial website
* 8804845 (master) add README file
* fca4d30 add files/ directory
* 8bc5573 add initial commit
```

------

# Objects
## Blobs, Trees, Commits

---

# Content-Addressable
## Change content, change address

---

# Refs
## Pointer to a Commit

------

# That's it!

---

# You Understand Git!

------

# `merge`

---

# Move `master` forward
```
$ git checkout master
Switched to branch 'master'
$ echo 'We have a website!' > README
$ git add README
$ git commit -m'mention our website'
[master d82046b] mention our website
 1 file changed, 1 insertion(+)
```

---

```
$ git log --oneline --graph --all --decorate
* d82046b (HEAD, master) mention our website
| * 4fa0e53 (website) add content to index.html
| * 6485877 add initial website
|/
* 3e9238f add README file
* 80d2cfe add files/ directory
* 67d238a initial commit
```
## Two branches diverged in a repo...

---

# Merge

```
$ git merge website -m'deploy website'
Merge made by the 'recursive' strategy.
 images/logo.jpg | 0
 index.html      | 1 +
 2 files changed, 1 insertion(+)
 create mode 100644 images/logo.jpg
 create mode 100644 index.html
```

---

```
$ git log --oneline --graph --all --decorate
*   ed4ab2c (HEAD, master) deploy website
|\
| * a46ccee (website) add content to index.html
| * 7499fa5 add initial website
* | c935b69 mention our website
|/
* 23c1fa4 add README file
* e08379e add files/ directory
* 2585480 initial commit
```

---

# Merge commit

---

# Two parents

------

```
*   68160c3 (HEAD, master) deploy website
|\
| * 3e564c4 (website) add content to index.html
| * ca8a5f4 add initial website
* | 3c08b7e mention our website
|/
* 4bddffd add README file
```
# Merge Bubble

---

# Debate!

---

```
$ git checkout website
Switched to branch 'website'
$ echo 'More content' >>index.html
$ git add index.html
$ git commit '-madd more content'
[website 9f3cfe0] add more content
 1 file changed, 1 insertion(+)
```
# More Website Commits

---

```
$ git checkout master
Switched to branch 'master'
$ git merge website '-mre-deploy website'
Merge made by the 'recursive' strategy.
 index.html | 1 +
 1 file changed, 1 insertion(+)
```

---

```
$ git log --oneline --graph --all --decorate
*   717ccb2 (HEAD, master) re-deploy website
|\
| * d56d29e (website) add more content
* |   430612c deploy website
|\ \
| |/
| * f4fe103 add content to index.html
| * 5fc9062 add initial website
* | 26c14d6 mention our website
|/
* 82d1ed6 add README file
* 783b061 add files/ directory
* fb8bebe initial commit
```

---

# Mutual Merge
```
+ git checkout website
Switched to branch 'website'
+ git merge master
Updating d56d29e..717ccb2
Fast-forward
 README | 1 +
 1 file changed, 1 insertion(+)
```

---

```
$ git log --oneline --graph --all --decorate
*   717ccb2 (HEAD, website, master) re-deploy website
|\
| * d56d29e add more content
* |   430612c deploy website
|\ \
| |/
| * f4fe103 add content to index.html
| * 5fc9062 add initial website
* | 26c14d6 mention our website
|/
* 82d1ed6 add README file
* 783b061 add files/ directory
* fb8bebe initial commit
```

---

# Fast-Forward
## Re-use commits

------

# `rebase`

---

# Merge Bubble Antidote

---

# Add more website commits

```
$ touch images/new-logo.jpg
$ git add images/new-logo.jpg
$ git commit -m'add new logo image'
[website 78c270f] add new logo image
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 images/new-logo.jpg
$ echo 'Add new logo' >>index.html
$ git add index.html
$ git commit -m'replace old logo with new logo'
[website baf0ede] replace old logo with new logo
 1 file changed, 1 insertion(+)
```

---

```
$ git log --oneline --graph --all --decorate
* baf0ede (HEAD, website) replace old logo with new logo
* 78c270f add new logo image
*   df4be30 (master) re-deploy website
|\
| * 0df747b add more content
* |   47691fd deploy website
|\ \
| |/
| * 50cb510 add content to index.html
| * 2aa964b add initial website
* | cfd7398 mention our website
|/
* e31d1d2 add README file
* d8f8c73 add files/ directory
* a86e5e0 initial commit
```

---

# Add more master commits

```
$ git checkout master
Switched to branch 'master'
$ touch files/fizz files/buzz
$ git add files/fizz files/buzz
$ git commit -m'add fizz and buzz'
[master 3c47baa] add fizz and buzz
 2 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 files/buzz
 create mode 100644 files/fizz
```

---

```
$ git log --oneline --graph --all --decorate
* 3c47baa (HEAD, master) add fizz and buzz
| * baf0ede (website) replace old logo with new logo
| * 78c270f add new logo image
|/
*   df4be30 re-deploy website
```

---

# Want to merge `website` onto `master`

---

# First `rebase` `website`

```
+ git checkout website
Switched to branch 'website'
+ git rebase master
First, rewinding head to replay your work on top of it...
Applying: add new logo image
Applying: replace old logo with new logo
```

---

# Rewinds the commits on `website`

---

# Updates `website` ref
## Point to same `master` commit

---

# Plays the commits again

---

```
$ git log --oneline --graph --all --decorate
* 9000c55 (HEAD, website) replace old logo with new logo
* 0aefaf3 add new logo image
* 3c47baa (master) add fizz and buzz
* df4be30 re-deploy website
```

---

# Commit IDs changed!

---

# Content-Addressable

---

# Commits Refer to Parent

---

# Change Parent, Change Commit

---

# Merge `website` into `master`

```
$ git checkout master
Switched to branch 'master'
$ git merge website
Updating 3c47baa..9000c55
Fast-forward
 images/new-logo.jpg | 0
 index.html          | 1 +
 2 files changed, 1 insertion(+)
 create mode 100644 images/new-logo.jpg
```

---

# Fast-forward

---

```
$ git log --oneline --graph --all --decorate
* 9000c55 (HEAD, website, master) replace old logo with new logo
* 0aefaf3 add new logo image
* 3c47baa add fizz and buzz
* df4be30 re-deploy website
```

------

# Remotes

---

# Are all local!


------

# Enter Bob

```
$ git clone <origin>
$ echo "Bob was here" >> README
$ git add README
$ git commit -m'Bob was here!'
$ git push origin master
```

---

# Back to Us

---

# Nothing has changed!

---

# Unsuspecting Commit!
```
$ echo 'New employee, Bob!' >> index.html
$ git add index.html
$ git commit -m'welcome new employee, Bob'
[master fe886eb] welcome new employee, Bob
 1 file changed, 1 insertion(+)
 ```

---

```
$ git push origin master
To remotes/origin
 ! [rejected]        master -> master (fetch first)
error: failed to push some refs to 'remotes/origin'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```

# !!!

------

# `fetch`

---

# Fetches remote objects

---

```
+ git fetch origin
remote: Counting objects: 3, done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 3 (delta 0), reused 0 (delta 0)
Unpacking objects: 100% (3/3), done.
From remotes/origin
 * [new branch]      master     -> origin/master
 * [new branch]      website    -> origin/website
```
---

# Content-Addressable

---

```
$ git log --oneline --graph --all --decorate --remotes
* 6a7ded8 (HEAD -> master) welcome new employee, Bob
| * 017ddbb (origin/master) Bob was here!
|/
* 4d7165f (origin/website, website) replace old logo with new logo
* 5f33c56 add new logo image
* e1e56ae add fizz and buzz
*   a0de8f4 re-deploy website
|\
| * f024478 add more content
* |   6b9512d deploy website
|\ \
| |/
| * 488a471 add content to index.html
| * 191b48d add initial website
* | f8b0104 mention our website
|/
* 4004f06 add README file
* 56d337a add files/ directory
* f90bb72 initial commit
```

---

# New Refs
```
6a7ded80958f19529a73060f87052f05cf06be8c refs/heads/master
4d7165ff101e63397d95288429e41c89de5a716a refs/heads/website
017ddbbaf30675154ebb48071a6bcf9f2886f2c0 refs/remotes/origin/master
4d7165ff101e63397d95288429e41c89de5a716a refs/remotes/origin/website
```

---

# `merge` or `rebase`
```
$ git rebase origin/master
First, rewinding head to replay your work on top of it...
Applying: welcome new employee, Bob
```

---

# `pull` == `fetch` + `merge`

---

# `pull --rebase` == `fetch` + `rebase`

---

```
$ git push origin master
Counting objects: 3, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 316 bytes | 0 bytes/s, done.
Total 3 (delta 1), reused 0 (delta 0)
To remotes/origin
   017ddbb..186ffed  master -> master
```

---

```
+ git log --oneline --graph --all --decorate --remotes
* 186ffed (HEAD -> master, origin/master) welcome new employee, Bob
* 017ddbb Bob was here!
* 4d7165f (origin/website, website) replace old logo with new logo
* 5f33c56 add new logo image
* e1e56ae add fizz and buzz
*   a0de8f4 re-deploy website
|\
| * f024478 add more content
* |   6b9512d deploy website
|\ \
| |/
| * 488a471 add content to index.html
| * 191b48d add initial website
* | f8b0104 mention our website
|/
* 4004f06 add README file
* 56d337a add files/ directory
* f90bb72 initial commit
```

---

```
$ git show-ref
186ffedd69e7403b3613b38ec90ca697f316a243 refs/heads/master
4d7165ff101e63397d95288429e41c89de5a716a refs/heads/website
186ffedd69e7403b3613b38ec90ca697f316a243 refs/remotes/origin/master
4d7165ff101e63397d95288429e41c89de5a716a refs/remotes/origin/website
```

---

# Everything's Local!

---

# `push` must be safe
## Fast-forward

------

# Why?

------

# It's Over!

* [Slides on GitHub](http://github.com/preaction/The-Why-of-Git)
* [My Website: http://preaction.me](http://preaction.me)

---

# Other Resources

* [Git for Computer Scientists](http://eagain.net/articles/git-for-computer-scientists/)
* [Git Concepts Simplified](http://gitolite.com/gcs.html)
* [git-rebase: Why and how](http://perl.plover.com/yak/git-rebase-wtf/)

---

# Questions?

