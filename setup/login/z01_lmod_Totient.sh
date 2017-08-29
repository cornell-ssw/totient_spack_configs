
# Disable the system modules from showing up (hack)
# Links to both spack instances
TOTIENT_SPACK_ROOT="/share/apps/spack"
CC_ROOT="$TOTIENT_SPACK_ROOT/spack_compilers"
CORE="share/spack/lmod/linux-rhel6-x86_64/Core"
CC_CORE="$CC_ROOT/$CORE"

# Links to the default Totient, psxe/2015, and devtoolset/3
TOTIENT_MODULES_PREFIX="$TOTIENT_SPACK_ROOT/totient_spack_configs/modules"
TOTIENT_CORE="$TOTIENT_MODULES_PREFIX/lmod/Core"

export MODULEPATH="$TOTIENT_CORE:$CC_CORE"
export LMOD_RC="$TOTIENT_SPACK_ROOT/totient_spack_configs/setup/lmod/lmodrc.lua"

# See documentation:
# http://lmod.readthedocs.io/en/latest/070_standard_modules.html

if [ -z "$__Init_Default_Modules" ]; then
   export __Init_Default_Modules=1;

   ## ability to predefine elsewhere the default list
   LMOD_SYSTEM_DEFAULT_MODULES=${LMOD_SYSTEM_DEFAULT_MODULES:-"Totient"}
   export LMOD_SYSTEM_DEFAULT_MODULES
   module --initial_load --no_redirect restore
else
   module refresh
fi
