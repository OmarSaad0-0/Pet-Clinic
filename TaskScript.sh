#! /bin/bash
#Global Variables defination
User="pet-clinic"
jdk_url="https://download.oracle.com/java/22/latest/jdk-22_linux-x64_bin.tar.gz"
jdk_path="/home/pet-clinic/jdk-22.0.1/bin/java"
java_home="/home/$User"
#This Condition to add new user pet-clinic if not existing
if id "$User" >/dev/null; then
    echo "User exists"

else
    sudo useradd -m $User
    sudo passwd $User
    sudo id $User
   
fi
#This Condition Handles the download of java and installation if not existing
if ! /home/pet-clinic/jdk-22.0.1/bin/java --version &> /dev/null; then
	cd $java_home
	wget $jdk_url
	tar -xf "/home/$User/jdk-22_linux-x64_bin.tar.gz"
        echo 'export PATH="$PATH:/home/pet-clinic/jdk-22.0.1/bin"' >> /home/$User/.bashrc
else

	echo " Java exists "
	
fi









