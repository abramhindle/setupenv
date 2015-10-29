# setupenv - what is it?
setupenv is a set of scripts to download and install software in your home
directory.

# requirements
currently, it needs the following preinstalled libraries (not installed using
scripts).

```
sudo apt-get install libssl-dev libbz2-dev libz-dev libc6-i386 make g++ python-dev
```

it is also much easier to proceed if you have this libs installed (otherwise
you have to compile and build them using the scripts in this repo).

```
sudo apt-get install libtool autoconf autotools-dev automake autogen
```

# usage
to install a software package to your home directory, simply run e.g.
```
cd src/boost
./install.sh
```
this will build and install `boost` to `build/boost-xyz`. you can then setup
the environment variables (in bash) for boost by running
```
source setupenv boost-xyz
```
you can also specify multiple backages (with version number) when calling
`setupenv`. the most convenient way to use `setupenv` is to call it in
combination with the `latest` script. `latest` generates a list of packages
installed, but only keeps the latest version of each package. the combination
of `setupenv` and `latest` then looks like this:
```
source setupenv `latest`
```

i added the above line to my `.bashrc` file to setup my coding environment.

# ideas/problems
* `sparsehash` not working on mac
* add latest `gcc` and compile everything with that gcc
* convert all scripts to homebrew linux scripts
