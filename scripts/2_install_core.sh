#install_core.sh installs packages and gets the code
#and data required for the reference environment.  Configuration
#usually happens later in configure_core.sh unless something 
#depends on it here.

log=/vagrant/temp/install.log
echo Started install_core.sh | tee -a $log

echo Installing packages | tee -a $log

echo Adding keys and the Rstudio CRAN details | tee -a $log
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list.d/getdeb.list'

sudo apt-get -y update 
sudo apt-get -y install r-base=3.3.2-1trusty0 r-base-dev=3.3.2-1trusty0 evince=3.10.3-0ubuntu10.2
sudo apt-get -y autoremove

echo Completed package installation | tee -a $log

echo Getting code | tee -a $log
	#git clone https://github.com/uomsystemsbiology/hbgm.git ~/gawcurcra15/Examples
	#echo Getting build info from git | tee -a $log
	#git --git-dir ~/gawcurcra15/Examples/.git log --max-count=1 --format=format:"Last Commit: %h%nAuthor: %an%nCommit Date: %ad%n" > /vagrant/temp/build_info.txt
	echo Writing build info into build_info.txt | tee -a $log
	printf '\nEnvironment built at ' >> /vagrant/temp/build_info.txt
	date >> /vagrant/temp/build_info.txt
echo Got code | tee -a $log

echo Completed install_core.sh | tee -a $log