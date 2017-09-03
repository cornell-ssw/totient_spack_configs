# Source this file from your ~/.bashrc
#
# E.g.
#
#     source /share/apps/spack/totient_spack_configs/admin_configs_bashrc.sh

# This is what you should use to install things that need to be tuned for the
# compute nodes.
#
# MAKE SURE YOU RUN `spack spec -I` BeFoRe trying to install.
function spack_node_install() {
    # Make the log directory if it does not exist
    log_dir="/home/$USER/spack_install_logs"
    if ! [[ -d "$log_dir" ]]; then
        echo "---> Making log dir '$log_dir'"
        mkdir -p "$log_dir"
    fi

    # Make sure the script exists...
    the_script="/share/apps/spack/totient_spack_configs/node_compile.pbs"
    if ! [[ -f "$the_script" ]]; then
        echo "Cannot find '$the_script'..."
        return
    fi

    # We need to `qsub` from underneath /home/$USER
    # otherwise the logs won't get sent back!
    if [[ "$(pwd -P)" != "$log_dir" ]]; then
        go_back=1
    else
        go_back=0
    fi

    # Go to the log dir, qsub, and go back
    cd "$log_dir"
    echo "[$log_dir]: qsub -v spec=\"$*\" \"$the_script\""
    qsub -v spec="$*" "$the_script"
    if (( go_back )); then
        cd -
    fi
}

# This is what you should use to install things that need to be tuned for the
# compute nodes.
#
# MAKE SURE YOU RUN `spack spec -I` BeFoRe trying to install.
#
# NOTE: make sure you have packages.yaml setup right for intel!
function spack_node_intel_dirty_install() {
    # Make the log directory if it does not exist
    log_dir="/home/$USER/spack_install_logs"
    if ! [[ -d "$log_dir" ]]; then
        echo "---> Making log dir '$log_dir'"
        mkdir -p "$log_dir"
    fi

    # Make sure the script exists...
    the_script="/share/apps/spack/totient_spack_configs/node_compile_intel_dirty.pbs"
    if ! [[ -f "$the_script" ]]; then
        echo "Cannot find '$the_script'..."
        return
    fi

    # We need to `qsub` from underneath /home/$USER
    # otherwise the logs won't get sent back!
    if [[ "$(pwd -P)" != "$log_dir" ]]; then
        go_back=1
    else
        go_back=0
    fi

    # Go to the log dir, qsub, and go back
    cd "$log_dir"
    echo "[$log_dir]: qsub -v spec=\"$*\" \"$the_script\""
    qsub -v spec="$*" "$the_script"
    if (( go_back )); then
        cd -
    fi
}

# This function is useful for updating what shows up with `module av`
function update_totient_lmod_db() {
    # Load the `lmod` module so that we have `update_lmod_system_cache_files`
    echo "---> Loading the 'TotientAdmin' module."
    module load TotientAdmin
    if (( $? != 0 )); then
        echo "CRITICAL: could not 'module load lmod'." >&2
        return
    fi

    cleanup='eval echo "---> Unloading the '"'"'TotientAdmin'"'"' module." && module unload TotientAdmin'

    # Make sure we got the update command
    if ! command -v update_lmod_system_cache_files >/dev/null 2>&1; then
        echo "CRITICAL: 'module load lmod' did not provide 'update_lmod_system_cache_files'." >&2
        echo "          You may have used the 'spack' lmod module, which is not correct."     >&2
        $cleanup
        return
    fi

    # Some simple sanity checks (TSR <- Totient Spack Root)
    TSR="/share/apps/spack/totient_spack_configs/setup/lmod/moduleData"
    if ! [[ -d "$TSR" ]]; then
        echo "CRITICAL: folder '$TSR' does not exist!" >&2
        $cleanup
        return
    fi
    if ! [[ -w "$TSR" ]]; then
        echo "CRITICAL: '$USER' cannot write to '$TSR'" >&2
        $cleanup
        return
    fi

    echo "---> Running 'update_lmod_system_cache_files', this may take a while..."
    update_lmod_system_cache_files -d "$TSR/cacheDir" -t "$TSR/system.txt" $MODULEPATH

    $cleanup
}


