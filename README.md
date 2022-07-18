# packaging-snap


## Prerequisits to build
 
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

* clone the directory 
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


