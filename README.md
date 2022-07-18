# Building and installing


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
* cd into xwiki-base-snap
* run snapcraft

This will build the xwiki_14.4.1_amd64.snap

## Installing the snap 

Make sure you are in the directory where the snap is built
```
sudo snap install xwiki_14.4.1_amd64.sanp --dangerous
```
This will install the snap which is only **mysql compatible**


# Setting up the xwiki-base-snap mysql database

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
