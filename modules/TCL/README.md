# What is this?

This is a backup of the original TCL modules we need
for various compilers that were available pre-spack.

They are not in direct use, the `tcl2lua.tcl` utility
provided when you do `module load lmod` was used to
convert them into `lua` modules.

This was done so they could be explicitly marked
with the `state` of `ignore` to hopefully clarify
to users that it should not be used directly.
