# initialisation script


# variables
subnet0=172.20.0.0/16
subnet1=172.30.0.0/16
subnet2=172.40.0.0/16
subnet3=172.50.0.0/16

# build images
echo -e "\n👷‍♀️ Building images..."
echo -e "\n🎮 controller..."
docker build -t controller ./controller
echo -e "\n📡 router..."
docker build -t router ./router
echo -e "\n🖥️ endpoint..."
docker build -t endpoint ./endpoint

# create containers
echo -e "\n📦 Creating containers..."
echo -e "\n🎮 controller..."
docker create --name controller --cap-add=ALL controller

echo -e "\n📡 router0..."
docker create --name router0 --cap-add=ALL router
echo -e "\n📡 router1..."
docker create --name router1 --cap-add=ALL router
echo -e "\n📡 router2..."
docker create --name router2 --cap-add=ALL router

echo -e "\n‼️ Remember to create endpoints using endpoint.sh"

# create networks
echo -e "\n🌐 Creating networks..."
docker network create -d bridge --subnet $subnet0 network0
docker network create -d bridge --subnet $subnet1 network1
docker network create -d bridge --subnet $subnet2 network2
docker network create -d bridge --subnet $subnet3 network3

# Copy tools.py to directories
echo -e "\n👾 Copying tools library to subdirectories"
cp tools.py controller/
cp tools.py endpoint/
cp tools.py router/

# connect everything to networks
echo -e "\n🔌 Connecting controller up with all networks..."
docker network connect network0 controller
docker network connect network1 controller
docker network connect network2 controller
docker network connect network3 controller
docker network disconnect bridge controller

echo -e "\n🧩 Connecting router0 to network0 and network1"
docker network connect network0 router0
docker network connect network1 router0
docker network disconnect bridge router0

echo -e "\n🧩 Connecting router1 to network0 and network2"
docker network connect network0 router1
docker network connect network2 router1
docker network disconnect bridge router1

echo -e "\n🧩 Connecting router2 to network2 and network3"
docker network connect network2 router2
docker network connect network3 router2
docker network disconnect bridge router2