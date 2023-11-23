# Launch routers
printf "\n🚅 Launching routers"
sudo docker container start controller
sudo docker container start router0
sudo docker container start router1
sudo docker container start router2

printf "\nLaunching controller in interactive mode..."

clear
docker logs -f controller
