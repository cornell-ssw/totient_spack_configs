-- -*- lua -*-
whatis([[Name : clang/4.0.0]])
whatis([[Version : 1.1]])
help([[The Clang 4.0 compiler.]])

-- This is the one users should load for clang
add_property("state", "ignore")

-- MODULEPATH modifications
prepend_path("MODULEPATH", "/share/apps/spack/spack_all/share/spack/lmod/linux-rhel6-x86_64/clang/4.0.0")

-- clang was installed via anaconda, need it's lib and include directories
always_load("anaconda/4.4.0")

-- set compiler defaults
setenv("CC",    "clang")
setenv("CXX", "clang++")
-- it is coupled with the devtoolset/3 gfortran compiler
-- we do not need to load that module, just use the executable
setenv("FC",  "/opt/rh/devtoolset-3/root/usr/bin/gfortran")
setenv("F77", "/opt/rh/devtoolset-3/root/usr/bin/gfortran")
