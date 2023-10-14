# based on https://pythontic.com/modules/socket/udp-client-server-example
import socket

broker_ip = "broker"
sub_port = 50001
buffer_size = 1024

# Create a UDP socket at client side
sub_sock = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)
sub_sock.bind((broker_ip, sub_port))

print("subscriber is ready to receive video frames on port", sub_port)

# Send to server using created UDP socket
msgFromServer = sub_sock.recvfrom(buffer_size)
msg = "Message from broker {}".format(msgFromServer[0])
print(msg)


# Function to subscribe to a stream
def sub(stream_id):
    sub_data = bytes([int(stream_id)])  # Convert the stream identifier to a single byte
    sub_sock.sendto(sub_data, (broker_ip, sub_port))
    print(f"subscribed to stream {stream_id}")

# Function to unsubscribe from all streams
def unsub():
    unsubscribe_data = bytes([0])  # 0 is used to indicate an unsubscribe request
    sub_sock.sendto(unsubscribe_data, (broker_ip, sub_port))
    print("unsubscribed from all streams")

# Function to receive and display frames
def pub():
    while True:
        data, _ = sub_sock.recvfrom(buffer_size)
        # Process the received frame data (e.g., display it)
        print("received frame data:", data)  # Replace with your actual processing/display logic

# Subscribe to streams based on user input
while True:
    action = input("Enter 's' to subscribe, 'u' to unsubscribe, or 'q' to quit: ").lower()
    
    if action == 's':
        stream_identifier = input("Enter the stream identifier to subscribe: ")
        sub(stream_identifier)
    elif action == 'u':
        unsub()
    elif action == 'q':
        break
    else:
        print("Invalid input. Please enter 's', 'u', or 'q'.")

# Start a thread to continuously receive and display frames
import threading
frame_thread = threading.Thread(target=pub)
frame_thread.start()

