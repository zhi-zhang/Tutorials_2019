---
title: MTRN2500 Tutorial Week 5
...

--------------------------

# C++
From here on, we will be covering C++ and how to use it effectively.


## What is C++?
As you might already be able to infer, `C++` is a variation of the `C` programming language. While they have similar names, `C++` is written very, very differently from `C` - enough that it should be written with a different mentality to `C`. More about the `C++` language will be covered as we move through the tutorials.

--------------------------

# Assignment 2 Setup
Assignment 2 will be conducted using three systems you will need to set up and become familiar with:

* A Ubuntu virtual machine (an installer image will be provided) with VirtualBox 6 (or equivalent software, however the following instructions will be provided for VirtualBox only).
* Robot Operating System (ROS), specifically ROS2.
* All code will be implemented in the `C++` language. Yes, ROS and ROS2 support both `C++` and `Python`, however you must use `C++` for this course.

## NOTE
You are provided this virtual machine image as-is. It was created in a working condition. You must ensure that you back up your own work.

Using this virtual machine is optional, you may install ROS2 on your own machine if you wish - at your own risk. **Regarding the installation and configuration of ROS2, the tutors will only be able to assist with issues regarding the ROS2 installation provided on the virtual machine, and may not be able to assist if you are not using the provided virtual machine**. Of course, all tutors will be able to provide support and help with issues regarding your `C++` and ROS2 code.

The VirtualBox virtual machine software is also provided on the Willis Annexe 212 laboratory machines, however please note the following:

* There is no external internet connection on these machines, so you will not be able to use the `uniwide` network on these machines.
* These machines require no password to log in, and as such the storage on these machines may be accessible by other students. Please ensure if you use the lab machines to run the virtual machine that you completely remove your virtual machine from the machine.

## Ubuntu Virtual Machine
You will be provided with a `.ova` installer with ROS2 already installed and set up for you. You should not need to change any configurations at this point in time. The default password for these machines is `mtrn2500`. You may change this if you wish (it is strongly recommended). 

This virtual machine is pre-installed with ROS2, `clang-format` and Visual Studio Code (which you can access using the `code` command).

After you have installed VirtualBox 6:

* Ensure that the VirtualBox Extension Pack is installed for the correct version
* Ensure that your network connection is working within the virtual machine
    * If you are unable to access the external internet, your network controller in VirtualBox  may be incorrectly configured. In most cases, your network adapter should be set to `NAT`. If this still doesn't work, ask your tutor.

To install the provided virtual machine with VirtualBox:

* Select File
* Import Appliance
* Press the folder icon (which has an upwards arrow) and select the `.ova` file
* Wait for the virtual machine to install.

## Quick guide to Linux
As you might have noticed, we are using a Linux operating system to facilitate ROS2 (fun fact: the name is a recursive acronym for "Linux Is Not UniX", a reference to the UNIX operating system which Linux is inspired by). This is a free and open-source operating system, with many distributions available which cater towards specific use cases and come with various software pre-configured for the intended use case of the specific distribution. While there are many, many various distributions that come in many sizes and configurations, the filesystem is consistent among all Linux machines:

* `/bin`: Contains most of the built-in binaries (executable programs) included in the OS
* `/boot`: Files which are required for starting the OS
* `/dev`: Location of device files, which can be read and written to interact with the hardware / virtual hardware they are associated with
* `/etc`: General system files and configurations
* `/home`: All users personal directories. Your `mtrn2500` user home directory belongs within this directory, specifically in the `/home/mtrn2500` directory. This should be the only directory that you will have to add to and modify. Your currently logged in user can refer to their own directory with `~`, so the paths `~` and `/home/mtrn2500` are equivalent.
* `/lib`: Where all the libraries that other applications use and leverage from are installed
* `/media`: The directory where all external storage devices are automatically mounted to
* `/mnt`: A less used directory where external storage devices and other miscellaneous devices used to be mounted to
* `/opt`: Directory where compiled software that installed into the system (not through a package manager such as `apt`)
* `/proc`: Contains information about the CPU and kernel of the OS
* `/root`: The home directory of the superuser of the OS, the `root` user, which can make any change on this machine without any user confirmation or further authentication once they're logged in as the `root` user. You should not need to log in as the root user or interact with its home directory
* `/run`: System process information
* `/sbin`: Similar to `/bin`, however this only contains executable programs that the superuser (`root`) will need
* `/usr`: Used to be the equivalent of `/home`, however is now used to store various applications, libraries and configurations
* `/srv`: Storing data for Linux servers
* `/sys`: Further information about devices connected to the machine
* `/tmp`: Temporary files
* `/var`: Usually contains files that change very often, such as system logs

--------------------------

# Robot Operating System 2 (ROS2)

## What is ROS?
Robot Operating System 2 (ROS2) is the second major iteration of the Robot Operating System, which is a completely open-source system and set of libraries that makes building and programming robots and robotic systems far simpler. The name is a misnomer however - it is not an operating system, but rather *middleware* - software which extends the functionality offered by the base operating system.

ROS uses a decentralised approach to managing various components of a robot. You are able to create packages which contain nodes that perform some specific function of the robot. For example, you could create a module called `motion` which controls the external moveable hardware of a robot and have nodes such as `motor_node` and `claw_node` which control the motion of the motors and the claw (of this imaginary robot) respectively.

## Directory Structure for ROS2
There are four main directories in your ROS2 workspace (if you are using the VirtualMachine, this is the `~/mtrn2500_ws` directory):

* `~/mtrn2500_ws/build`: Compiled ROS2 packages and executables
* `~/mtrn2500_ws/install`: Setup files that are called to ensure that your paths and ROS-related shell (terminal) variables are set correctly
* `~/mtrn2500_ws/logs`: Logging of output made by various packages
* `~/mtrn2500_ws/src`: Directory where all source code for ROS2 is contained. The directories in this directory describe and separate all the packages that make up your ROS2 codebase (which is code that either we provide or you have written).

--------------------------
Written by Adam Tizzone.
