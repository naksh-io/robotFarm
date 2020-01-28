# robotFarm
This project is primarily a cmake based system to build libraries from source 
that are commonly used by roboticists.

# How To Use robotFarm
* Determine the libraries you'd like this project to build.
    * Refer to the cmake directory for a list of all available libraries.
* Remeber to stay connected to the internet.
* A library is built by providing ROBOT_FARM_BUILD_\<LIBRARY\>_\<NAME\>:BOOL=ON as cache 
  argument to cmake during configure step.
    * You may find a list of all options in the root CMakeLists.txt.
    * Do not edit the files. Leverage the CMake cache.
* Each library is built by downloading a release archive from respective library's 
  distribution. The default 
    * If you'd like to build a different version of a specific library, 
      provide ROBOT_FARM_\<LIBRARY\>_\<NAME\>_URL:STRING="/url/to/the/version/you/want"
      as cache argument to CMake during configuration step.
    * Again, do not edit the files, leverage the CMake cache.
        
# Special Treatment of Python3
This project can build python3 from source if needed. However, more often that not, its
more convenient to use the system's version of python3 so the build skips it by default and 
adds a phony target instead to trick its dependees.
* If you'd like to build python3 from source provide ROBOT_FARM_SKIP_PYTHON3:BOOL=OFF as
  cache argument to CMake during configure step.
* If you are relying on system's python3 installation, remember to install the following packages:
    * python-dev
    * python3-dev

# Notes and Issues

## Python3
The configure command for python3 has issues with the following flags:
* --with-address-sanitizer
* --with-libs="-lbz2 -lreadline -lncurses -lhistory -lsqlite3 -lssl"

## OpenCV
* Building OpenCV with CUDA requires building with OpenCV-contrib.
    * This is due to a dependency of CUDA based features on cudev.

* Cuda codec are no longer a part of cuda >= 10.0
    * OpenCV build here is forced to use -DBUILD_opencv_cudacodec:BOOL=OFF
    
* The support for following feature is off due to lack of information on what system packages to install:
    * OpenGL support
    * GtkGlExt
    * Installing libgtkglext1 and libgtkglext1-dev did not help.
    
# Upcoming:
