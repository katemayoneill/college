# based on https://pythontic.com/modules/socket/udp-client-server-example
import socket
import time
import random

broker_ip = "broker"
pub_port = 50000
buffer_size = 1024

# Create a socket for publishing
pub_sock = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)

print("producer is ready to send data to the broker on port", pub_port)

# Function to simulate data production
def generate_data():
    # Replace this with your actual data generation logic
    return str(random.randint(0, 100)).encode()  # Generating a random number for demonstration

# Function to publish data
def publish_data(data):
    pub_sock.sendto(data, (broker_ip, pub_port))
    print(f"published data: {data.decode()}")

# Produce and publish data at regular intervals
while True:
    data = generate_data()
    publish_data(data)
    time.sleep(1)  # Simulating data production every 1 second