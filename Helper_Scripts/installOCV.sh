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
CMAKE_OPTIONS=" -D BUILD_PERF_TESTS:BOOL=OFF 
                -D BUILD_TESTS:BOOL=OFF
                -D BUILD_DOCS:BOOL=OFF
                -D WITH_CUDA:BOOL=OFF
                -D BUILD_EXAMPLES:BOOL=ON
                -D INSTALL_CREATE_DISTRIB:BOOL=ON
                -D WITH_FFMPEG=1
                -D OPENCV_ENABLE_ALLOCATOR_STATS=OFF"

# Get Core OpenCV

echo "Enter desired branch for CV Core (Leave empty for Latest): "
read branch_name

echo "Enter desired branch for CV Contrib (Leave empty for Latest): "
read branch_name_contrib

if [  ! -d "$myRepo/opencv"  ]; then
    echo "cloning opencv"
    git clone https://github.com/opencv/opencv.git
    mkdir -p Build/opencv
    mkdir -p Install/opencv
else
    cd opencv
    git checkout master
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
    git checkout master
    git pull --rebase
    cd ..
fi

echo ""
echo "******************************************"
echo "Checkingout $branch_name branch, in opencv"
# checking out chosen branches Core
cd opencv
git checkout $branch_name
cd ..

# checking out chosen branches Contrib
echo "Checkingout $branch_name_contrib branch, in opencv_contrib"
cd opencv_contrib
git checkout $branch_name_contrib
cd ..
echo "******************************************"
echo ""

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
cmake -G "$CMAKE_CONFIG_GENERATOR" $CMAKE_OPTIONS -D OPENCV_EXTRA_MODULES_PATH:PATH="$myRepo/opencv_contrib/modules" -D CMAKE_INSTALL_PREFIX:PATH="$myRepo/install/$RepoSource" "$myRepo/$RepoSource"
echo "************************* $Source_DIR -->debug"
cmake --build . --config debug
echo "************************* $Source_DIR -->release"
cmake --build . --config release
cmake --build . --target install --config release
cmake --build . --target install --config debug
popd

echo "*************************"
echo "Windows Configuration Instructions - Do this if there are no errors"
echo "create the following environment variable:
        OPENCV_DIR: C:\ *this directory* opencv\Install\opencv

    Once thats done add the folloing to you path:
        %OPENCV_DIR%\x64\*compiler*\bin
        %OPENCV_DIR%\x64\*compiler*\lib"