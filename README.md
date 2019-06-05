misc
====

misc scripts and tools


# Useful commands:
=====
To find which files have been changed the most in a git repo the command under can be used:
```
git log --pretty=format: --name-only | sort | uniq -c | sort /R | head -100
```

The files that have been changed the most can give an indication that something is wierd with those files.

