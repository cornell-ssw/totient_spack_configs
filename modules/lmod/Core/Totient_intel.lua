-- -*- lua -*-
whatis([[Name : Totient_intel]])
whatis([[Version : 1.1]])
help([[Convenience module for loading all available modules compiled with intel/15.0.3.]])

-- This module is the path of least resistance for loading all of the goodies :)
add_property("state", "encouraged")

-- First make sure the Totient module and compiler are loaded.
always_load("Totient")
always_load("intel/15.0.3")

-- Now load in everything.  This list comes from the modules.yaml whitelist in spack.
-- For convenience, everything is alphabetical *EXCEPT* load openmpi first so that
-- the packages built with that will be available.
-- Intel provides their own mpi
-- load("openmpi") 

-- load("armadillo")
load("arpack-ng")
load("binutils")
-- load("boost")
load("bzip2")
load("eigen")
load("fftw")
load("gnuplot")
load("gsl")
load("hdf5")
load("hwloc")
load("intel-tbb")
load("jdk")
load("jpeg")
load("libjpeg-turbo")
load("libpng")
load("libszip")
load("libtiff")
load("libxml2")
load("matio")
load("netcdf")
-- Intel provides their own lapack
-- load("netlib-lapack")
-- Intel provides their own scalapack (?)
-- load("netlib-scalapack")
-- Intel provides their own blas
-- load("openblas")
-- load("opencv")
load("openjpeg")
load("openssl")
load("parallel-netcdf")
load("pkg-config")
load("python")
load("qhull")
-- load("suite-sparse")
load("superlu")
load("tar")
load("xz")
load("zlib")

