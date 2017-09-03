-- -*- lua -*-
whatis([[Name : Totient]])
whatis([[Version : 1.1]])
help([[The default modules to load when logging into Totient.]])

-- On login this module should already be loaded.  Mark it as encouraged
-- so that if they `module purge` and e.g. no longer see gcc, they hopefully
-- `module load Totient` again ;)
add_property("state", "encouraged")

-- MODULEPATH modifications

prepend_path("MODULEPATH", "/share/apps/spack/spack_compilers/share/spack/lmod/linux-rhel6-x86_64/Core")
prepend_path{"PATH", "/share/apps/script",delim=":",priority="0"}

-- Default utilities to load in for all users

load("cmake")
load("curl")
load("git")
load("lua")
load("tmux")
load("vim")
