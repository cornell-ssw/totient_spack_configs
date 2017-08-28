-- -*- lua -*-
whatis([[Name : intel/15.0.3]])
whatis([[Version : 1.1]])
help([[The intel 2015 compiler.]])

-- MODULEPATH modifications
prepend_path("MODULEPATH", "/share/apps/spack/spack_all/share/spack/lmod/linux-rhel6-x86_64/intel/15.0.3/")

always_load("psxe/2015")
