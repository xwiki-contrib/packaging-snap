# Building and installing

## Install the snap from the Snapcraft Store

Simply run the following command
```
sudo snap install xwiki --edge
```

## Running the snap

#### To start XWiki run:
```
sudo xwiki.start
```

#### To stop XWiki run:
```
sudo xwiki.stop
```

## Editing configuration files 

All the config files are avalible in ` /var/snap/xwiki/<revision>/* ` . Edit the config files here and then restart XWiki to see the changes take place.

## Prerequisites to build
 
 You'll need to perform 3 mandatory steps to build the snap :
  * [install snapd](https://snapcraft.io/docs/installing-snapd)
  * [installing snapcraft and multipass](https://snapcraft.io/docs/snapcraft-overview)
  * building the XWiki snap



Run the following commands to install **snapcraft** and **multipass** after installing snapd :
```
sudo snap install snapcraft --classic
sudo snap install multipass
```

## Building the snap

* clone the repository
* cd into xwiki-jetty
* run snapcraft

This will build the xwiki_13.10.8_amd64.snap

## Installing the snap 

Make sure you are in the directory where the snap is built
```
sudo snap install xwiki_13.10.8_amd64.snap --dangerous
```

## NOTE: xwiki-base-snap and xwiki-mysql-snap has been replaced by xwiki-jetty package 

# Setting up the xwiki-base-snap mysql database **(obsolete)**

* Make sure you have [mysql](https://dev.mysql.com/doc/refman/8.0/en/installing.html)5.7 or greater installed.
* Start the MySQL server. You can do that in several ways. For example use mysqld --console
* Create the wiki database.
```
mysql -u root -e "create database xwiki default character set utf8mb4 collate utf8mb4_bin"
```
* Create the xwiki user with password xwiki
```
mysql -u root -e "CREATE USER 'xwiki'@'localhost' IDENTIFIED BY 'xwiki'";
```
* Give privileges to the xwiki user for accessing and creating databases (for the multi wiki support). Specifically, the xwiki users need permissions to be able to execute CREATE DATABASE, DROP SCHEMA, and then all CRUD operations on tables. Note that the command below should be tuned to be more restrictive as granting all permissions is not required:
```
mysql -u root -e "grant all privileges on *.* to xwiki@localhost"
```
* The mysql JDBC Driver JAR and hibernate.cfg.xml have already been configured for mysql in the snap
* Restart the snap 
```
sudo snap restart xwiki.tomcat
```
* now you can launch xwiki: http://localhost:8080/xwiki/bin/view/Main/ 

# Setting up the xwiki-mysql-snap **(obsolete)**

This snap consist of three parts:
* xwiki-14.4.1
* tomcat-9.0.x
* mysql-8

The building would be similar to xwiki-base-snap except the installation part:

install the snap in devmode:
``` 
sudo snap install xwiki_14.4.1_amd64.snap --devmode
```
### Running the snap a system service 
Running mysql as a system service requires root access, but the server itself should never run as root, so it drops privileges to a dedicated user. This user must own the server files and directories. Currently snapd blocks access to creating users and changing process user, so the only way to do this is to disable the restrictions by installing the snap with the --devmode argument.

post installation steps:
```
 sudo snap connect xwiki:process-control :process-control
 xwiki.startup
 xwiki.client -uroot -p
```

This should start the mysql server . Then follow the steps mentioned in **Setting up the xwiki-base-snap mysql database** section and your mysql would be ready .
now you can launch xwiki: http://localhost:8080/xwiki/bin/view/Main/ 

### Files and directories 
The first time you run mysql.startup, it will generate the following in $HOME/snap/xwiki/common (if run as root, /var/snap/xwiki/common is used instead):
- conf/my.cnf: Basic configuration file
- data/: Data directoriy
- files/: Default location for the secure-file-priv option
- log/: Location of error log
- run/: Location of sock and pid files




 
