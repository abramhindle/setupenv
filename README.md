library of software tools

currently needs the following preinstalled libraries (not installed using
scripts).

```
sudo apt-get install libssl-dev libbz2-dev libz-dev libc6-i386
```

it is also much easier to proceed if you have this libs installed (otherwise
you have to compile and build them using the scripts in this repo).

```
sudo apt-get install libtool autoconf autotools-dev automake autogen
```

not working on mac:
* sparsehash

ideas to solve:
* add latest gcc and compile everything with that gcc