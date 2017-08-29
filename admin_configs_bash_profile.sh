# Source this file from your ~/.bash_profile
#
# E.g.
#
#     source /share/apps/spack/totient_spack_configs/admin_configs_bash_profile.sh

#
# Generally we assume `spack_all` is the spack you want.
#
echo '*********************************************************************************'
echo '* Totient Admin:                                                                *'
echo '*   - Setting $SPACK_ROOT to be: `/share/apps/spack/spack_all`                  *'
export SPACK_ROOT="/share/apps/spack/spack_all"
echo '*   - Spack Setup: `source /share/apps/spack/spack_all/share/spack/setup-env.sh *'
source "$SPACK_ROOT/share/spack/setup-env.sh"
echo '*********************************************************************************'
echo '* The `spack` executable is for `spack_all`.  To use `spack_compilers`:         *'
echo '*   - cd /share/apps/spack/spack_compilers                                      *'
echo '*   - ./bin/spack help                                                          *'
echo '*********************************************************************************'
