

# Variables
subnet0=172.20.0.0/16
subnet1=172.30.0.0/16

# Create Networks
echo -e "\n🌐 Creating networks"
sudo docker network create -d bridge --subnet $subnet0 network0
sudo docker network create -d bridge --subnet $subnet1 network1

# Copy tools.py to directories
echo -e "\n👾 Copying tools library to subdirectories"
cp tools.py controller/
cp tools.py endpoint/
cp tools.py router/

# Create Controller
echo -e "\n🎮 Creating controller image and containers"
sudo docker build -t controller ./controller
sudo docker container create --name controller --cap-add=ALL controller
sudo docker network connect network0 controller
sudo docker network connect network1 controller
sudo docker network disconnect bridge controller

# Create router
echo -e "\n🚅 Creating router image and containers"
sudo docker build -t a2-router ./router

# Router 0
sudo docker container create --name router0 --cap-add=ALL a2-router
sudo docker network connect network0 router0
sudo docker network connect network1 router0
sudo docker network disconnect bridge router0

# Router 1
sudo docker container create --name a2-router1 --cap-add=ALL a2-router
sudo docker network connect a2-network1 a2-router1
sudo docker network connect a2-network2 a2-router1
sudo docker network connect a2-network4 a2-router1
sudo docker network disconnect bridge a2-router1

# Create Endpoint image, must be launched with run command
echo -e "\n💫 Creating endpoint image"
sudo docker build -t a2-endpoint ./endpoint

