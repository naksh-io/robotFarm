# robotFarm
This project is primarily a cmake based system to build libraries from source that are commonly used by roboticists.

# Python3
The configure command for python3 has issues with the following flags:
* --with-address-sanitizer
* --with-libs="-lbz2 -lreadline -lncurses -lhistory -lsqlite3 -lssl"

# OpenCV
* Building OpenCV with CUDA requires building with OpenCV-contrib.
    * This is due to a dependency of CUDA based features on cudev.

* Cuda codec are no longer a part of cuda >= 10.0
    * OpenCV build here is forced to use -DBUILD_opencv_cudacodec:BOOL=OFF
    
* The support for following feature is off due to lack of information on what system packages to install:
    * OpenGL support
    * GtkGlExt
    * Installing libgtkglext1 and libgtkglext1-dev did not help.
    
# Upcoming:
