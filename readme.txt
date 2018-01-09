Command to remember 

PATH=C:\JAVA_INSTALLATION\jdk-9.0.1_64\bin;%PATH%;

set JAVA_HOME=C:\JAVA_INSTALLATION\jdk-9.0.1_64

jdeps -m com.main --module-path . -R

jdeps -m com.user --module-path . -R

jlink --module-path .;%JAVA_HOME%\jmods --add-modules com.main --output main --bind-services

C:\Shrikant\DEVELOPMENT\JAVA\PROJECT\Java9\understanding_module_transitive\main\bin\java.exe --list-modules

java.exe --list-modules

javac --module-path %JAVA_HOME%\jmods --add-modules java.activation Test.java

java --module-path C:\JAVA_INSTALLATION\jdk-9.0.1_64\jmods --add-modules java.activation Test