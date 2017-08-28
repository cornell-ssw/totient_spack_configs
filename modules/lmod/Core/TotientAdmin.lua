-- -*- lua -*-
whatis([[Name : TotientAdmin]])
whatis([[Version : 1.1]])
help([[A wrapper module to load the true lmod module.]])

-- Mark this module as something end-users should ignore
add_property("state", "ignore")

-- MODULEPATH modifications
prepend_path("MODULEPATH", "/share/apps/spack/spack_compilers/opt/spack/linux-rhel6-x86_64/gcc-4.9.2/lmod-7.4.11-ds2yqqh2l47t7crx7yvxit7vv47ns42m/lmod/lmod/modulefiles/Core")
load("lmod")
