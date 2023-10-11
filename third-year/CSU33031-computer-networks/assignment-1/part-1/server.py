import socket

# Define server IP and port
server_ip = "0.0.0.0"
server_port = 50000

# Create a UDP socket
UDPServerSocket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

# Bind the socket to the server IP and port
UDPServerSocket.bind((server_ip, server_port))

print("UDP server up and listening")

while True:
    # Receive data from clients
    data, client_address = UDPServerSocket.recvfrom(1024)

    # Extract header information
    packet_type = data[:2]
    producer_id = data[2:5]
    stream_id = data[5]
    
    if packet_type == b'\x01':  # Subscription request (Assuming packet type 0x01 for subscription)
        # Process subscription request
        print(f"Received subscription request from {client_address}")
        
        # Simulate subscription confirmation (packet type 0x02 for confirmation)
        confirmation_packet = b'\x02' + producer_id + bytes([stream_id]) + b'\x00\x00\x00\x00'  # Assuming 0-length frame
        UDPServerSocket.sendto(confirmation_packet, client_address)
        print(f"Sent subscription confirmation to {client_address}")
