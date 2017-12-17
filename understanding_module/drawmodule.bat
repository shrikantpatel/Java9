SET PATH=C:/JAVA_INSTALLATION/jdk-9.0.1_64/bin;%PATH%

cd com.draw
rm draw.jar
rmdir /s /q classes

mkdir classes

dir /s /B *.java > sources.txt
javac -d classes @sources.txt

jar -c -f draw.jar -C classes .

move draw.jar ../.
cd ..

cd com.user
rm user.jar
rmdir /s /q classes

mkdir classes

dir /s /B *.java > sources.txt
javac --module-path ../ -d classes @sources.txt

jar -c -f user.jar --main-class com.user.User -C classes .

move user.jar ../.
cd ..

java --module-path . -m com.user