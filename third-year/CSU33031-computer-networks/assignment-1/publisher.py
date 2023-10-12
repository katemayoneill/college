# based on https://pythontic.com/modules/socket/udp-client-server-example
import socket

msgFromClient       = "publisher connected to broker"
bytesToSend         = str.encode(msgFromClient)
serverAddressPort   = ("broker", 50000)
bufferSize          = 1024

# Create a UDP socket at publisher side
UDPClientSocket = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)

# Send to broker using created UDP socket
UDPClientSocket.sendto(bytesToSend, serverAddressPort)

msgFromServer = UDPClientSocket.recvfrom(bufferSize)
msg = "Message from broker {}".format(msgFromServer[0])
print(msg)

# TODO start and stop streaming, send these meagges to broker