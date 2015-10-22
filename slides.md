
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

# Refers to Blob Objects

---

# Gives a File a Name

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

---

# `HEAD`

---

# The current commit

---



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

