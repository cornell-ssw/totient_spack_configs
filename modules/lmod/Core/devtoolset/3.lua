-- The devtoolset-3 package is part of the RedHat Software Collections
-- and includes more recent versions of various development tools
-- (gcc, valgrind, dyninst, etc).  It is normally enabled by running
-- something like
--
--     scl enable foo
--
-- where foo is some desired command.  This module is created
-- semi-automatically by running
--
--     scl enable env
--
-- and then tacking a diff against the previous environment.

whatis([===[devtoolset-3 package ]===])

add_property("state", "ignore")

prepend_path{"MANPATH","/opt/rh/rh-java-common/root/usr/share/man",delim=":",priority="0"}
prepend_path{"MANPATH","/opt/rh/devtoolset-3/root/usr/share/man",delim=":",priority="0"}
prepend_path{"PERL5LIB","/opt/rh/devtoolset-3/root/usr/lib64/perl5/vendor_perl",delim=":",priority="0"}
prepend_path{"PERL5LIB","/opt/rh/devtoolset-3/root/usr/lib/perl5",delim=":",priority="0"}
prepend_path{"PERL5LIB","/opt/rh/devtoolset-3/root/usr/share/perl5/vendor_perl",delim=":",priority="0"}
prepend_path{"JAVACONFDIRS","/opt/rh/rh-java-common/root/etc/java",delim=":",priority="0"}
prepend_path{"JAVACONFDIRS","/opt/rh/devtoolset-3/root/etc/java",delim=":",priority="0"}
setenv("X_SCLS","rh-java-common devtoolset-3")
setenv("PCP_DIR","/opt/rh/devtoolset-3/root")
prepend_path{"LD_LIBRARY_PATH","/opt/rh/devtoolset-3/root/usr/lib",delim=":",priority="0"}
prepend_path{"LD_LIBRARY_PATH","/opt/rh/devtoolset-3/root/usr/lib64",delim=":",priority="0"}
prepend_path{"XDG_CONFIG_DIRS","/opt/rh/rh-java-common/root/etc/xdg",delim=":",priority="0"}
prepend_path{"XDG_CONFIG_DIRS","/opt/rh/devtoolset-3/root/etc/xdg",delim=":",priority="0"}
prepend_path{"PATH","/opt/rh/rh-java-common/root/usr/bin",delim=":",priority="0"}
prepend_path{"PATH","/opt/rh/devtoolset-3/root/usr/bin:",delim=":",priority="0"}
prepend_path{"PYTHONPATH","/opt/rh/rh-java-common/root/usr/lib/python2.6/site-packages",delim=":",priority="0"}
prepend_path{"PYTHONPATH","/opt/rh/devtoolset-3/root/usr/lib/python2.6/site-packages",delim=":",priority="0"}
prepend_path{"PYTHONPATH","/opt/rh/devtoolset-3/root/usr/lib64/python2.6/site-packages",delim=":",priority="0"}
prepend_path{"XDG_DATA_DIRS","/opt/rh/rh-java-common/root/usr/share",delim=":",priority="0"}
prepend_path{"XDG_DATA_DIRS","/opt/rh/devtoolset-3/root/usr/share",delim=":",priority="0"}
prepend_path{"INFOPATH","/opt/rh/devtoolset-3/root/usr/share/info",delim=":",priority="0"}
