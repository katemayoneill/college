# based on https://pythontic.com/modules/socket/udp-client-server-example
import socket
import base64
import threading

header_size = 8
local_ip     = "broker"
pub_port   = 50000
sub_port = 50001
buffer_size = 1024

subs = {} # create sub dictionary

# create a publishing socket
pub_sock = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)
pub_sock.bind((local_ip, pub_port))

# create subcribing socket
sub_sock = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)
sub_sock.bind((local_ip, sub_port))

print("broker online")

# listen for incoming datagrams
def sub_service():
    while(True):
        data, address = sub_sock.recvfrom(buffer_size)
        header = data[:header_size]
        payload = data[header_size:]

        stream_id = header[0]
        subscriber_id = header[1:]

        if stream_id == "00":
            del subs[subscriber_id]
            print("subscriber number", subscriber_id, "unsubscribed from all streams")

        else:
            subs[subscriber_id] = stream_id
            print("subscriber number", subscriber_id, "subscribed to stream number", stream_id)

# Function to handle data from publishers
def pub_service():
    while True:
        data, address = pub_sock.recvfrom(buffer_size)
        
        received_stream = data[0]
        frame_data = data[1:]
        
        topic = str(received_stream)
        
        if address in subs:
            if subs[address] == topic:
                sub_sock.sendto(frame_data, address)
        
        print("published video frame to subscriber at", address)

# create and start two threads for concurrent processing
subscription_thread = threading.Thread(target=sub_service)
publisher_thread = threading.Thread(target=pub_service)

subscription_thread.start()
publisher_thread.start()