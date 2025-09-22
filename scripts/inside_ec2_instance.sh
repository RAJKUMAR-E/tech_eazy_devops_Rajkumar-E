sudo apt update
sudo apt install git -y
sudo apt install openjdk-17-jdk -y
sudo apt install maven -y
git clone <url>
mvn clean package
java -jar $(ls target/*.jar)
