-- This file configures where the spider cache is saved so that
-- the module command can run much faster.
--
-- The cache needbe rebuilt when more installations are performed (?)
-- See docs:
-- http://lmod.readthedocs.io/en/latest/130_spider_cache.html
--
-- NOTE: this file is sourced by our manual z01_Totient.[c]sh scripts!
--
-- You should be able to `module load lmod`, and run
--
-- update_lmod_system_cache_files

scDescriptT = {
    {
        ["dir"]       = "/share/apps/spack/totient_spack_configs/setup/lmod/moduleData/cacheDir",
        ["timestamp"] = "/share/apps/spack/totient_spack_configs/setup/lmod/moduleData/system.txt"
    },
}

-- Provide marks for users to know which modules they should not
-- be using directly.
--
-- See:
-- http://lmod.readthedocs.io/en/latest/155_lmodrc.html#lmodrc-label
--
-- and
--
-- http://lmod.readthedocs.io/en/latest/015_writing_modules.html#assigning-properties
propT = {
    state = {
        validT = { ignore = 1, encouraged = 1, },
        displayT = {
            ignore     = {
                short  = "(I)",
                long   = "(I)",
                color  = "blue",
                doc    = "Ignore - not intended for direct use.",
            },
            encouraged = {
                short  = "(E)",
                long   = "(E)",
                color  = "green",
                doc    = "Encouraged - this module was written for your convenience.",
            },
        },
    },
}
