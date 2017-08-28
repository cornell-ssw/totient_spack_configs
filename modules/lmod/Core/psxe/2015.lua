-- This environment module was created semi-automatically using the
-- env2 utility (/share/apps/scripts/env2).  For details, see:
-- https://software.intel.com/en-us/articles/using-environment-modules-with-the-intel-compiler
--
-- This environment module was then converted using `tcl2lua.tcl`
-- so that it could be marked as 'Ignore'.

whatis([===[Parallel Studio XE 2015 ]===])
add_property("state", "ignore")

load("devtoolset")

-- From here on is the output of
-- perl /share/apps/script/env2
--   -from bash
--   -to modulecmd
--   "/usr/local/intel/parallel_studio_xe_2015/psxevars.sh intel64" >> psxe
setenv("I_MPI_ROOT","/usr/local/intel//impi/5.0.3.048")
setenv("GDB_CROSS","/usr/local/intel/composer_xe_2015.3.187/debugger/gdb/intel64_mic/bin/gdb-mic")
setenv("VT_MPI","impi4")
setenv("INTEL_PYTHONHOME","/usr/local/intel/composer_xe_2015.3.187/debugger/python/intel64/")
setenv("IPPROOT","/usr/local/intel/composer_xe_2015.3.187/ipp")
setenv("MIC_LD_LIBRARY_PATH","/usr/local/intel/composer_xe_2015.3.187/compiler/lib/mic:/usr/local/intel/composer_xe_2015.3.187/mpirt/lib/mic:/opt/intel/mic/coi/device-linux-release/lib:/opt/intel/mic/myo/lib:/usr/local/intel/composer_xe_2015.3.187/ipp/lib/lib/mic:/opt/intel/mic/coi/device-linux-release/lib:/opt/intel/mic/myo/lib:/usr/local/intel/composer_xe_2015.3.187/compiler/lib/mic:/usr/local/intel/composer_xe_2015.3.187/mkl/lib/mic:/usr/local/intel/composer_xe_2015.3.187/tbb/lib/mic")
prepend_path{"PATH","/usr/local/intel/composer_xe_2015.3.187/debugger/gdb/intel64_mic/bin",delim=":",priority="0"}
prepend_path{"PATH","/usr/local/intel/composer_xe_2015.3.187/bin/intel64",delim=":",priority="0"}
prepend_path{"PATH","/usr/local/intel//itac/9.0.3.051/intel64/bin",delim=":",priority="0"}
prepend_path{"PATH","/usr/local/intel//impi/5.0.3.048/intel64/bin",delim=":",priority="0"}
prepend_path{"PATH","/usr/local/intel/inspector_xe_2015.1.2.379161/bin64",delim=":",priority="0"}
prepend_path{"PATH","/usr/local/intel/vtune_amplifier_xe_2015.3.0.403110/bin64",delim=":",priority="0"}
prepend_path{"PATH","/usr/local/intel/advisor_xe_2015.1.10.380555/bin64",delim=":",priority="0"}
prepend_path{"PATH","/usr/local/intel/bin",delim=":",priority="0"}
setenv("VT_ARCH","intel64")
setenv("INTEL_LICENSE_FILE","/usr/local/intel/licenses:/opt/intel/licenses:/root/intel/licenses:/usr/local/intel/composer_xe_2015.3.187/licenses:/opt/intel/licenses:/home/dsb253/intel/licenses")
setenv("VT_ADD_LIBS","-ldwarf -lelf -lvtunwind -lnsl -lm -ldl -lpthread")
setenv("VT_LIB_DIR","/usr/local/intel//itac/9.0.3.051/intel64/lib")
setenv("CPATH","/usr/local/intel/composer_xe_2015.3.187/ipp/include:/usr/local/intel/composer_xe_2015.3.187/mkl/include:/usr/local/intel/composer_xe_2015.3.187/tbb/include")
setenv("LD_LIBRARY_PATH","/usr/local/intel//impi/5.0.3.048/intel64/lib:/usr/local/intel//itac/9.0.3.051/mic/slib:/usr/local/intel//itac/9.0.3.051/intel64/slib:/usr/local/intel/composer_xe_2015.3.187/compiler/lib/intel64:/opt/intel/mic/coi/host-linux-release/lib:/opt/intel/mic/myo/lib:/usr/local/intel/composer_xe_2015.3.187/mpirt/lib/intel64:/usr/local/intel/composer_xe_2015.3.187/ipp/../compiler/lib/intel64:/usr/local/intel/composer_xe_2015.3.187/ipp/lib/intel64:/usr/local/intel/composer_xe_2015.3.187/ipp/tools/intel64/perfsys:/opt/intel/mic/coi/host-linux-release/lib:/opt/intel/mic/myo/lib:/usr/local/intel/composer_xe_2015.3.187/compiler/lib/intel64:/usr/local/intel/composer_xe_2015.3.187/mkl/lib/intel64:/usr/local/intel/composer_xe_2015.3.187/tbb/lib/intel64/gcc4.4:/usr/local/intel/composer_xe_2015.3.187/debugger/libipt/intel64/lib")
setenv("MANPATH","/usr/local/intel//impi/5.0.3.048/man:/usr/local/intel//itac/9.0.3.051/man:/usr/local/intel/composer_xe_2015.3.187/man/en_US:/usr/local/intel/composer_xe_2015.3.187/man/en_US:/usr/local/intel/composer_xe_2015.3.187/debugger/gdb/intel64/share/man/:/usr/local/intel/composer_xe_2015.3.187/debugger/gdb/intel64_mic/share/man/:")
setenv("MPM_LAUNCHER","/usr/local/intel/composer_xe_2015.3.187/debugger/mpm/bin/start_mpm.sh")
setenv("LIBRARY_PATH","/usr/local/intel/composer_xe_2015.3.187/compiler/lib/intel64:/usr/local/intel/composer_xe_2015.3.187/ipp/../compiler/lib/intel64:/usr/local/intel/composer_xe_2015.3.187/ipp/lib/intel64:/usr/local/intel/composer_xe_2015.3.187/compiler/lib/intel64:/usr/local/intel/composer_xe_2015.3.187/mkl/lib/intel64:/usr/local/intel/composer_xe_2015.3.187/tbb/lib/intel64/gcc4.4")
setenv("TBBROOT","/usr/local/intel/composer_xe_2015.3.187/tbb")
setenv("ADVISOR_XE_2015_DIR","/usr/local/intel/advisor_xe_2015.1.10.380555")
setenv("VT_SLIB_DIR","/usr/local/intel//itac/9.0.3.051/intel64/slib")
setenv("GDB_HOST","/usr/local/intel/composer_xe_2015.3.187/debugger/gdb/intel64_mic/bin/gdb-ia-mic")
setenv("INFOPATH","/usr/local/intel/composer_xe_2015.3.187/debugger/gdb/intel64/share/info/:/usr/local/intel/composer_xe_2015.3.187/debugger/gdb/intel64_mic/share/info/")
setenv("MIC_LIBRARY_PATH","/usr/local/intel/composer_xe_2015.3.187/compiler/lib/mic:/usr/local/intel/composer_xe_2015.3.187/mpirt/lib/mic:/usr/local/intel/composer_xe_2015.3.187/tbb/lib/mic")
setenv("GDBSERVER_MIC","/usr/local/intel/composer_xe_2015.3.187/debugger/gdb/target/mic/bin/gdbserver")
setenv("MKLROOT","/usr/local/intel/composer_xe_2015.3.187/mkl")
setenv("NLSPATH","/usr/local/intel/composer_xe_2015.3.187/compiler/lib/intel64/locale/%l_%t/%N:/usr/local/intel/composer_xe_2015.3.187/ipp/lib/intel64/locale/%l_%t/%N:/usr/local/intel/composer_xe_2015.3.187/mkl/lib/intel64/locale/%l_%t/%N:/usr/local/intel/composer_xe_2015.3.187/debugger/gdb/intel64_mic/share/locale/%l_%t/%N:/usr/local/intel/composer_xe_2015.3.187/debugger/gdb/intel64/share/locale/%l_%t/%N")
setenv("VTUNE_AMPLIFIER_XE_2015_DIR","/usr/local/intel/vtune_amplifier_xe_2015.3.0.403110")
setenv("VT_ROOT","/usr/local/intel//itac/9.0.3.051")
setenv("CLASSPATH","/usr/local/intel//itac/9.0.3.051/intel64/lib")
setenv("INSPECTOR_2015_DIR","/usr/local/intel/inspector_xe_2015.1.2.379161")
