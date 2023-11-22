# initialisation script


# variables
subnet0=172.20.0.0/16
subnet1=172.30.0.0/16
subnet2=172.40.0.0/16
subnet3=172.50.0.0/16

# build images
printf "\n👷‍♀️ Building images..."
printf "\n🎮 controller..."
docker build -t controller ./controller
printf "\n📡 router..."
docker build -t router ./router
printf "\n🖥️ endpoint..."
docker build -t endpoint ./endpoint

# create containers
printf "\n📦 Creating containers..."
printf "\n🎮 controller..."
docker create --name controller --cap-add=ALL controller

printf "\n📡 router0..."
docker create --name router0 --cap-add=ALL router
printf "\n📡 router1..."
docker create --name router1 --cap-add=ALL router
printf "\n📡 router2..."
docker create --name router2 --cap-add=ALL router

printf "\n‼️ Remember to create endpoints using endpoint.sh"

# create networks
printf "\n🌐 Creating networks..."
docker network create -d bridge --subnet $subnet0 network0
docker network create -d bridge --subnet $subnet1 network1
docker network create -d bridge --subnet $subnet2 network2
docker network create -d bridge --subnet $subnet3 network3

# Copy tools.py to directories
printf "\n👾 Copying tools library to subdirectories"
cp tools.py controller/
cp tools.py endpoint/
cp tools.py router/

# connect everything to networks
printf "\n🔌 Connecting controller up with all networks..."
docker network connect network0 controller
docker network connect network1 controller
docker network connect network2 controller
docker network connect network3 controller
docker network disconnect bridge controller

printf "\n🧩 Connecting router0 to network0 and network1"
docker network connect network0 router0
docker network connect network1 router0
docker network disconnect bridge router0

printf "\n🧩 Connecting router1 to network0 and network2"
docker network connect network0 router1
docker network connect network2 router1
docker network disconnect bridge router1

printf "\n🧩 Connecting router2 to network2 and network3"
docker network connect network2 router2
docker network connect network3 router2
docker network disconnect bridge router2