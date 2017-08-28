#!/usr/bin/env bash

###############################################################################
# Utility functions                                                           #
###############################################################################

# Call with path to directory to make sure it exists and the current user
# can create links there.
function can_link_in_dir() {
    if ! [[ -d "$1" ]]; then
        echo "Directory '$1' does not exist."                   >&2
        exit 1
    fi
    if ! [[ -x "$1" ]]; then
        echo "'$USER' does not have permission to enter '$1'."  >&2
        exit 1
    fi
    if ! [[ -r "$1" ]]; then
        echo "'$USER' does not have permission to read '$1'."   >&2
        exit 1
    fi
    if ! [[ -w "$1" ]]; then
        echo "'$USER' does not have permission to modify '$1'." >&2
        exit 1
    fi

    echo "[+] '$USER' has ability to make links in '$1'."
}

# Call with the core resource YAML file you want to verify exists.
function verify_original_exists() {
    if ! [[ -f "$1" ]]; then
        echo "The file '$1' does not exist."                    >&2
        exit 1
    fi
    if ! [[ -r "$1" ]]; then
        echo "'$USER' cannot read the file '$1'."               >&2
        exit 1
    fi
    if [[ -x "$1" ]]; then
        echo "Hmmm. '$1' is executable, but should not be."     >&2
        exit 1
    fi

    echo "[+] The file '$1' can be used to make a link."
}

# Call with the arguments
# $1: the original file
# $2: where to create the symbolic link
function make_link_from() {
    verify_original_exists "$1"

    if [[ -f "$2" ]]; then
        orig="$(readlink -f "$2")"
        if [[ "$orig" != "$1" ]]; then
            echo "CRITICAL: '$2' exists, NOT a link to '$1'."   >&2
            exit 1
        else
            echo "[+] Link already exists."
            echo "    - From:  $1"
            echo "    - To:    $2"
            echo
        fi
    else
        ln -s "$1" "$2"
        if (( $? != 0 )); then
            echo "CRITICAL: 'ln -s \"$2\" \"$1\"' failed."      >&2
            exit 1
        else
            echo "[+] Created symbolic link:"
            echo "    - From: $1"
            echo "    - To:   $2"
            echo
        fi
    fi
}

# $1: source prefix ($HERE)
# $2: array of source filenames in this directory ({CC,ALL}_CONF_SRC)
# $3: dest prefix ({CC,ALL}_ROOT)
# $4: array of names spack expects the yaml files to be called (CONF_DEST)
#
# NOTE: arguments $2 and $4 are "partial expansions" of the arrays, e.g.
#
#           make_all_links "$HERE" "CC_CONF_SRC[@]" ...
#
#       so that we can use ARR=( "${!2}" ).  See
#       https://stackoverflow.com/a/4017175
#
# NOTE: indices of $2 and $4 must be the same (should be 0, 1, 2, 3)
function make_all_links() {
    # Gather input
    SRC_PREFIX="$1"
    SRC_NAMES=( "${!2}" )
    DEST_PREFIX=$3
    DEST_NAMES=( "${!4}" )

    # Make sure we can link in this directory
    can_link_in_dir "$DEST_PREFIX"
    echo

    # Make all of the links (finally)!
    for i in "${!SRC_NAMES[@]}"; do
        from="$SRC_PREFIX/${SRC_NAMES[ $i ]}"
        to="$DEST_PREFIX/${DEST_NAMES[ $i ]}"
        make_link_from "$from" "$to"
    done
}

function vsep() {
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    echo ">>> $1"
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
}

###############################################################################
# Variables / setup                                                           #
###############################################################################
# Expected structure:
# /share/apps/spack
#     spack_compilers/
#     spack_all/
TOTIENT_SPACK_ROOT="/share/apps/spack"
CC_ROOT="$TOTIENT_SPACK_ROOT/spack_compilers"
ALL_ROOT="$TOTIENT_SPACK_ROOT/spack_all"

YAMLY_HOME="$TOTIENT_SPACK_ROOT/totient_spack_configs/setup"
HERE="$(pwd -P)"

# Everything relies on absolute paths for this, make sure they are running the
# script from the right directory.
if [[ "$HERE" != "$YAMLY_HOME" ]]; then
    echo "You are in '$HERE', but must be in '$YAMLY_HOME'" >&2
    exit 1
fi

# The config files we are using
CONF_DEST_NAMES=(    compilers.yaml config.yaml modules.yaml    packages.yaml  )
CC_CONF_SRC=(  compilers.yaml config.yaml modules.yaml cc_packages.yaml  )
ALL_CONF_SRC=( compilers.yaml config.yaml modules.yaml all_packages.yaml )

# We want to symlink things into the spack root for each
# instance, in the etc/spack folder.
CONF_DEST_DIR="etc/spack"
CC_CONF_DIR="$CC_ROOT/$CONF_DEST_DIR"
ALL_CONF_DIR="$ALL_ROOT/$CONF_DEST_DIR"


###############################################################################
# Create all of the links for spack_compilers and spack_all                   #
###############################################################################
vsep "Creating 'spack_compilers' links"
make_all_links "$HERE/spack_yaml" "CC_CONF_SRC[@]" "$CC_CONF_DIR" "CONF_DEST_NAMES[@]"

vsep "Creating 'spack_all' links"
make_all_links "$HERE/spack_yaml" "ALL_CONF_SRC[@]" "$ALL_CONF_DIR" "CONF_DEST_NAMES[@]"

###############################################################################
# Try and automate the spack_compiler -> spack_all lmod hacks                 #
###############################################################################
vsep "Attempting 'spack_compiler' -> 'spack_all' patches READ THE OUTPUT"
the_patches=( gcc/6.4.0.patch gcc/7.2.0.patch )
p_dir="$HERE/patches/spack_modules"

for patch in "${the_patches[@]}"; do
    echo '*** Executing: patch -d / -N -p 1 --reject-file="-" -i "'"$p_dir/$patch"'"'
    patch -d / -N -p 1 --reject-file="-" -i "$p_dir/$patch"
    echo -e "\n\n"
done
