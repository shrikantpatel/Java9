export JAVA_HOME=/opt/homebrew/opt/openjdk@11/bin/

rem build the the draw module
cd com.draw
rm draw.jar
rm -rf classes

mkdir classes

ls -R | find -L . | grep java > sources.txt

$JAVA_HOME/javac -d classes @sources.txt

$JAVA_HOME/jar -c -f draw.jar -C classes .

mv draw.jar ../.
cd ..

rem build the the user module, that depends on the draw module
cd com.user
rm user.jar
rm -rf classes

mkdir classes

ls -R | find -L . | grep java > sources.txt
$JAVA_HOME/javac --module-path ../ -d classes @sources.txt

$JAVA_HOME/jar -c -f user.jar --main-class com.user.User -C classes .

mv user.jar ../.
cd ..

$JAVA_HOME/java --module-path . -m com.user