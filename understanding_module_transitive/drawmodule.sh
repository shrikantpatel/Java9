export JAVA_HOME=/opt/homebrew/opt/openjdk@11/bin/

cd com.draw
rm draw.jar
rm -rf classes

mkdir classes

ls -R | find -L . | grep java > sources.txt

$JAVA_HOME/javac -d classes @sources.txt

$JAVA_HOME/jar -c -f draw.jar -C classes .

mv draw.jar ../.
cd ..

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

cd com.main
rm main.jar
rm -rf classes

mkdir classes

ls -R | find -L . | grep java > sources.txt
$JAVA_HOME/javac --module-path ../ -d classes @sources.txt

$JAVA_HOME/jar -c -f main.jar --main-class com.main.MainClass -C classes .

mv main.jar ../.
cd ..

$JAVA_HOME/java --module-path . -m com.main