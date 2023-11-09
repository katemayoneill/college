# initialisation script


# variables
subnet0=172.20.0.0/16
subnet1=172.30.0.0/16

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
docker create -ti --name controller --cap-add=ALL controller
echo -e "\n📡 router..."
docker create -ti --name router --cap-add=ALL router
echo -e "\n🖥️ endpoint..."
docker create -ti --name endpoint --cap-add=ALL endpoint

# create networks
echo -e "\n🌐 Creating networks..."
docker network create -d bridge --subnet $subnet0 network0
docker network create -d bridge --subnet $subnet1 network1

# Copy tools.py to directories
echo -e "\n👾 Copying tools library to subdirectories"
cp tools.py controller/
cp tools.py endpoint/
cp tools.py router/

# connect everything to networks
echo -e "\n🔌 Connecting things up..."
docker network connect anetwork0 controller
docker network connect network1 controller
docker network disconnect bridge controller
docker network connect network0 router
docker network connect network1 router
docker network disconnect bridge router

# remove tools.py from directories
echo -e "\n🧹🫧 Cleaning up..."
rm controller/tools.py
rm endpoint/tools.py
rm router/tools.py