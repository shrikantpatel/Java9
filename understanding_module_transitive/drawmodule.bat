SET PATH=C:/JAVA_INSTALLATION/jdk-9.0.1_64/bin;%PATH%

rem build the the draw module
cd com.draw
rm draw.jar
rmdir /s /q classes

mkdir classes

dir /s /B *.java > sources.txt
javac -d classes @sources.txt

jar -c -f draw.jar -C classes .

move draw.jar ../.
cd ..

rem build the the user module, that depends on the draw module
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

rem build the the main module, that depends on the user module
cd com.main
rm main.jar
rmdir /s /q classes

mkdir classes

dir /s /B *.java > sources.txt
javac --module-path ../ -d classes @sources.txt

jar -c -f main.jar --main-class com.main.MainClass -C classes .

move main.jar ../.
cd ..

java --module-path . -m com.main

