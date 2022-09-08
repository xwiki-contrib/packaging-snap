#! /bin/sh 

# put target dir name into a variable to make everything shorter and more readable
TARGET="$SNAP_DATA/"
COM="$SNAP_COMMON/"

if [ ! -e $COM/data ];
then 
  rm -r $COM/data
fi
# copy the script only if it does not yet exist
if [ ! -e $COM/hibernate.cfg.xml ]; 
then
  cp -r $TARGET/data/ $COM/
  cp -r $TARGET/webapps/xwiki/WEB-INF/hibernate.cfg.xml $COM/
  cp -r $TARGET/webapps/xwiki/WEB-INF/xwiki.cfg $COM/
  cp -r $TARGET/webapps/xwiki/WEB-INF/xwiki.properties $COM/
  cp -r $TARGET/webapps/xwiki/WEB-INF/classes/logback.xml $COM/
#  cp -r $TARGET/webapps/xwiki/WEB-INF/observation/ $COM/
 # cp -r $TARGET/webapps/xwiki/WEB-INF/fonts/   $COM/
 # cp -r $TARGET/webapps/xwiki/WEB-INF/cache/   $COM/
 # cp -r $TARGET/webapps/xwiki/WEB-INF/extensions/   $COM/
 # cp -r $TARGET/webapps/xwiki/WEB-INF/jboss-deployment-structure.xml   $COM/
 # cp -r $TARGET/webapps/xwiki/WEB-INF/jetty-web.xml   $COM/  
  #cp -r $TARGET/webapps/xwiki/WEB-INF/portlet.xml   $COM/
 # cp -r $TARGET/webapps/xwiki/WEB-INF/sun-web.xml   $COM/
  #cp -r $TARGET/webapps/xwiki/WEB-INF/   $COM/
  echo "backup successful!"
else
#  rm -r $COM/hibernate.cfg.xml
  rm -r $COM/xwiki.cfg
  rm -r $COM/xwiki.properties
  rm -r $COM/logback.xml
  rm -r $COM/observation
 # rm -r $COM/fonts
  #rm -r $COM/cache
 # rm -r $COM/extensions 
  cp -r $TARGET/data/ $COM/
  cp -r $TARGET/webapps/xwiki/WEB-INF/hibernate.cfg.xml $COM/
  cp -r $TARGET/webapps/xwiki/WEB-INF/xwiki.cfg $COM/
  cp -r $TARGET/webapps/xwiki/WEB-INF/xwiki.properties $COM/
  cp -r $TARGET/webapps/xwiki/WEB-INF/classes/logback.xml $COM/
#  cp -r $TARGET/webapps/xwiki/WEB-INF/observation/ $COM/
  echo "backup successful!"
fi
