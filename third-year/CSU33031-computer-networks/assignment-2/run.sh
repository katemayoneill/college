echo -e "🌙 Launching components"

# Launch server
echo -e "\n🦉 Launching controller"
sudo docker container start controller

# Launch sensors
echo -e "\n🚅 Launching routers"
# sudo docker kill $(sudo docker container ls -q)
#sudo docker container start $(sudo docker container ls -a -q -f name="router*") > /dev/null
sudo docker container start router