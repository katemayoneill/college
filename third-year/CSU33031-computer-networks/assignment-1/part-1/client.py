import socket
import sys

# Define server IP and port
server_ip = "server"
server_port = 50000

def subscribe():
    # Create a UDP socket
    UDPClientSocket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

    try:
        # Prompt the user for subscription parameters
        producer_id = input("Enter Producer ID: ").encode()
        stream_id = int(input("Enter Stream ID (0-255): "))
        
        if not (0 <= stream_id <= 255):
            print("Invalid Stream ID. Please enter a value between 0 and 255.")
            return

        # Create a subscription request packet (packet type 0x01 for subscription)
        packet_type = b'\x01'
        stream_id_bytes = bytes([stream_id])

        subscription_request = packet_type + producer_id + stream_id_bytes + b'\x00\x00\x00\x00'  # Assuming 0-length frame

        # Send the subscription request to the server
        UDPClientSocket.sendto(subscription_request, (server_ip, server_port))

        # Receive and process subscription confirmation
        confirmation_packet, server_address = UDPClientSocket.recvfrom(1024)

        # Extract header information from the confirmation
        confirmation_type = confirmation_packet[:2]
        confirmation_producer_id = confirmation_packet[2:5]
        confirmation_stream_id = confirmation_packet[5]

        if confirmation_type == b'\x02':
            print(f"Subscription confirmed by server for Producer ID: {confirmation_producer_id.decode()} "
                  f"and Stream ID: {int.from_bytes(confirmation_stream_id, 'big')}")
        else:
            print("Unexpected confirmation received")

    except KeyboardInterrupt:
        print("Subscription canceled by the user.")
    finally:
        # Close the client socket
        UDPClientSocket.close()

if __name__ == "__main__":
    subscribe()
