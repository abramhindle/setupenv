# setupenv - what is it?
setupenv is a set of scripts to download and install software in your home directory.

# requirements
currently, it needs the following preinstalled libraries (not installed using
scripts).

```
sudo apt-get install libssl-dev libbz2-dev libz-dev libc6-i386
```

it is also much easier to proceed if you have this libs installed (otherwise
you have to compile and build them using the scripts in this repo).

```
sudo apt-get install libtool autoconf autotools-dev automake autogen
```

# ideas/problems
* `sparsehash` not working on mac
* add latest `gcc` and compile everything with that gcc
* convert all scripts to homebrew linux scripts