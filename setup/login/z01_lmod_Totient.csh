
# Disable the system modules from showing up (hack)
# LInks to both spack instances
set TOTIENT_SPACK_ROOT = "/share/apps/spack"
set CC_ROOT = "$TOTIENT_SPACK_ROOT/spack_compilers"
set CORE = "share/spack/lmod/linux-rhel6-x86_64/Core"
set CC_CORE = "$CC_ROOT/$CORE"

# Links to the default Totient, psxe/2015, and devtoolset/3
set TOTIENT_MODULES_PREFIX = "$TOTIENT_SPACK_ROOT/totient_spack_configs/modules"
set TOTIENT_CORE = "$TOTIENT_MODULES_PREFIX/lmod/Core"

setenv MODULEPATH "$TOTIENT_CORE:$CC_CORE"
setenv LMOD_RC "$TOTIENT_SPACK_ROOT/totient_spack_configs/setup/lmod/lmodrc.lua"

# See documentation:
# http://lmod.readthedocs.io/en/latest/070_standard_modules.html

if ( ! $?__Init_Default_Modules )  then
  setenv __Init_Default_Modules 1
  if ( ! $?LMOD_SYSTEM_DEFAULT_MODULES ) then
    setenv LMOD_SYSTEM_DEFAULT_MODULES "Totient"
  endif
  module --initial_load restore
else
  module refresh
endif
