#! /bin/sh 

# put target dir name into a variable to make everything shorter and more readable
TARGET="$SNAP_DATA/"
COM="$SNAP_COMMON/"

echo "replace new permanet data folder ? (y/n)"

read data_input
if [ "$data_input" = y ]
then
  if [ -e $TARGET/data ]
  then
    rm -r $TARGET/data
    cp -r $COM/data $TARGET/
    echo "replaced permanent data"
  else
    cp -r $COM/data $TARGET/  
    echo "replaced permanent data"
  fi
elif [ "$data_input" = n ]
then 
  echo "not replacing permanent data"
else
  echo "invalid input"
fi
    
    
echo "enter the appropriate option: (1 or 2)"
echo "1. replace the new config files with old config files"
echo "2. compare and merge them using sdiff"
read option
if [ -e $TARGET/webapps/xwiki/WEB-INF/xwiki.cfg.ori ];
then 
  rm -r $TARGET/webapps/xwiki/WEB-INF/xwiki.cfg.ori
  rm -r $TARGET/webapps/xwiki/WEB-INF/xwiki.properties.ori
  rm -r $TARGET/webapps/xwiki/WEB-INF/hibernate.cfg.xml.ori
  rm -r $TARGET/webapps/xwiki/WEB-INF/classes/logback.xml.ori
  echo "removed previous update config files"
fi
  
if [ "$option" = 2 ]
then
#  rm -r $TARGET/webapps/xwiki/WEB-INF/observation
#  mv $COM/observation/ $TARGET/webapps/xwiki/WEB-INF/
  mv $COM/xwiki.cfg $TARGET/webapps/xwiki/WEB-INF/xwiki.cfg.ori
  sudo sdiff $TARGET/webapps/xwiki/WEB-INF/xwiki.cfg $TARGET/webapps/xwiki/WEB-INF/xwiki.cfg.ori -B -W -E -o $TARGET/webapps/xwiki/WEB-INF/xwiki.cfg
  mv $COM/xwiki.properties $TARGET/webapps/xwiki/WEB-INF/xwiki.properties.ori
  sudo sdiff $TARGET/webapps/xwiki/WEB-INF/xwiki.properties $TARGET/webapps/xwiki/WEB-INF/xwiki.properties.ori -B -W -E -o $TARGET/webapps/xwiki/WEB-INF/xwiki.properties
  mv $COM/hibernate.cfg.xml $TARGET/webapps/xwiki/WEB-INF/hibernate.cfg.xml.ori
  sudo sdiff $TARGET/webapps/xwiki/WEB-INF/hibernate.cfg $TARGET/webapps/xwiki/WEB-INF/hibernate.cfg.xml.ori -B -W -E -o $TARGET/webapps/xwiki/WEB-INF/hibernate.cfg.xml
  mv $COM/logback.xml $TARGET/webapps/xwiki/WEB-INF/classes/logback.xml.ori
  sudo sdiff $TARGET/webapps/xwiki/WEB-INF/classes/logback.xml $TARGET/webapps/xwiki/WEB-INF/classes/logback.xml.ori -B -W -E -o $TARGET/webapps/xwiki/WEB-INF/classes/logback.xml
  echo "merged new config files"
  
  echo "remove old config.ori files?(y/n)"
  read remove_old
  if [ "$remove_old" = y ];
  then 
    rm -r $TARGET/webapps/xwiki/WEB-INF/xwiki.cfg.ori
    rm -r $TARGET/webapps/xwiki/WEB-INF/xwiki.properties.ori
    rm -r $TARGET/webapps/xwiki/WEB-INF/hibernate.cfg.xml.ori
    rm -r $TARGET/webapps/xwiki/WEB-INF/classes/logback.xml.ori
    echo "old config.ori files deleted"
  fi  

elif [ "$option" = 1 ]
then
#  mv $COM/observation/ $TARGET/webapps/xwiki/WEB-INF/
  mv $COM/xwiki.cfg $TARGET/webapps/xwiki/WEB-INF/xwiki.cfg
  mv $COM/xwiki.properties $TARGET/webapps/xwiki/WEB-INF/xwiki.properties
  mv $COM/hibernate.cfg.xml $TARGET/webapps/xwiki/WEB-INF/hibernate.cfg.xml
  mv $COM/logback.xml $TARGET/webapps/xwiki/WEB-INF/classes/logback.xml
  echo "replaced new config files"
else
  echo "invalid option"  
fi
  


