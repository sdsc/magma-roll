# SDSC "magma" roll

## Overview

This roll bundles magma

For more information about the various packages included in the magma roll please visit their official web pages:

- <a href="http://magma.maths.usyd.edu.au/magma/" target="_blank"></a> is .


## Requirements

To build/install this roll you must have root access to a Rocks development
machine (e.g., a frontend or development appliance).

If your Rocks development machine does *not* have Internet access you must
download the appropriate magma source file(s) using a machine that does
have Internet access and copy them into the `src/<package>` directories on your
Rocks development machine.


## Dependencies

The sdsc-roll must be installed on the build machine, since the build process
depends on make include files provided by that roll.

The roll sources assume that modulefiles provided by SDSC compiler and mpi
rolls are available, but it will build without them as long as the environment
variables they provide are otherwise defined.

The build process requires the cuda toolkit ibraries and assumes that the cuda
modulefile is available.  It will build without
the modulefile as long as the environment variables it provides are otherwise
defined.


## Building

To build the magma-roll, execute this on a Rocks development
machine (e.g., a frontend or development appliance):

```shell
% make 2>&1 | tee build.log
```

A successful build will create the file `magma-*.disk1.iso`.  If you built
the roll on a Rocks frontend, proceed to the installation step. If you built the
roll on a Rocks development appliance, you need to copy the roll to your Rocks
frontend before continuing with installation.

This roll source supports building with different compilers  The `ROLLCOMPILER` and `ROLLMPI` make variables can be used to
specify the names of compiler and MPI modulefiles to use for building the
software, e.g.,

```shell
make ROLLCOMPILER=intel  2>&1 | tee build.log
```

The build process recognizes "gnu", "intel" or "pgi" as the value for the
`ROLLCOMPILER` variable; The default values are "gnu" and "rocks-openmpi".
<ENDIF>

## Installation

To install, execute these instructions on a Rocks frontend:

```shell
% rocks add roll *.iso
% rocks enable roll magma
% cd /export/rocks/install
% rocks create distro
% rocks run roll magma | bash
```

In addition to the software itself, the roll installs magma environment
module files in:

```shell
/opt/modulefiles/applications/magma
```


## Testing

The magma-roll includes a test script which can be run to verify proper
installation of the roll documentation, binaries and module files. To
run the test scripts execute the following command(s):

```shell
% /root/rolltests/magma.t 
```

