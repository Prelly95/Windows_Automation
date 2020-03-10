
# Place this file your desired install directory for Open CV and run in a bash terminal.
#	Git bash works for me
#		If an error comes up about bash being on the path, just run it again and it works... no idea why
# once build process is complete, create the following environment variable:
#	OPENCV_DIR: C:\ *this directory* \Install\opencv

# one thats done add the folloing to you path:
#	%OPENCV_DIR%\x64\*compiler*\bin
#	%OPENCV_DIR%\x64\*compiler*\lib

# You can run this script to get he most up to date version of opencv and rebuild it

#!/bin/bash -e

# Options
myRepo=$(pwd)
RepoSource=opencv

# Comment out the Build tools that work for you
#	Defalut is to use Ninja
CMAKE_CONFIG_GENERATOR="Ninja"
# CMAKE_CONFIG_GENERATOR="Visual Studio 16 2019"
# CMAKE_CONFIG_GENERATOR="MinGW Makefiles"
CMAKE_OPTIONS="-D BUILD_PERF_TESTS:BOOL=OFF -D BUILD_TESTS:BOOL=OFF -D BUILD_DOCS:BOOL=OFF -D WITH_CUDA:BOOL=OFF -D BUILD_EXAMPLES:BOOL=OFF -D INSTALL_CREATE_DISTRIB:BOOL=ON -D WITH_FFMPEG=1"

# Get Core OpenCV
if [  ! -d "$myRepo/opencv"  ]; then
    echo "cloning opencv"
    git clone https://github.com/opencv/opencv.git
    mkdir -p Build/opencv
    mkdir -p Install/opencv
else
    cd opencv
    git pull --rebase
    cd ..
fi

# Cet contrib OpenCV
if [  ! -d "$myRepo/opencv_contrib"  ]; then
    echo "cloning opencv_contrib"
    git clone https://github.com/opencv/opencv_contrib.git
    mkdir -p Build/opencv_contrib
else
    cd opencv_contrib
    git pull --rebase
    cd ..
fi

# If i want to delete Build and install for a clean make, this handles that
if [  ! -d "$myRepo/Build/opencv"  ]; then
    echo "Making build dir"
    mkdir -p Build/opencv
fi

if [  ! -d "$myRepo/Install/opencv"  ]; then
    echo "Making build dir"
    mkdir -p Install/opencv
fi

if [  ! -d "$myRepo/Build/opencv_contrib"  ]; then
    echo "Making build dir"
    mkdir -p Build/opencv_contrib
fi

# Send it
echo "ITS WORKING!!"
pushd Build/$RepoSource
cmake -G $CMAKE_CONFIG_GENERATOR $CMAKE_OPTIONS -D OPENCV_EXTRA_MODULES_PATH:PATH=$myRepo/opencv_contrib/modules -D CMAKE_INSTALL_PREFIX:PATH=$myRepo/install/$RepoSource $myRepo/$RepoSource
echo "************************* $Source_DIR -->debug"
cmake --build . --config debug
echo "************************* $Source_DIR -->release"
cmake --build . --config release
cmake --build . --target install --config release
cmake --build . --target install --config debug
popd