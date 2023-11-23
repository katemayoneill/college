# Network controller
# Handles device address assignment and providing routing information for devices with unknown recipient

import threading
from tools import *
from node import *


# Variables
port = 51510
buff_size = 4096
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
running = True

# Queues
outgoing = list()

# Node list
nodes = list()


# Packet reception thread
class RecPackets(threading.Thread):
    def run(self):
        print("Packet reception thread starting")

        global running, nodes
        while running:
            data, address = s.recvfrom(buff_size)
            pck = tlv_dec(data)
            print("\n")
            print(address)
            print(pck)

            # New device on network
            if "new" in pck and "name" in pck:
                print("New device: " + str(pck.get("new")) + ": " + str(pck.get("name")))

                if pck.get("new") == "router":
                    new_name = socket.gethostbyaddr(address[0])[0].split(".")[0]
                else:
                    new_name = pck.get("name")

                print(new_name)
                new_node = Node(address, pck.get("new"), new_name)

                # Connect to devices on same subnet
                # TODO: Try handle node connections via devices searching
                """
                for node in nodes:
                    if get_subnet(node.address[0]) == get_subnet(address[0]):
                        print("Connecting to: " + node.address[0])
                        node.connect(new_node)
                """

                # Add node to nodes
                nodes.append(new_node)

            # Different subnet device found
            if "route" in pck:
                print("Device connection: " + str(pck.get("name")))

                for i in nodes:
                    if i.address == address:
                        for j in nodes:
                            if j.name == pck.get("name") or j.address[0] == pck.get("route"):
                                # Update name if type is router
                                if j.type == "router":
                                    print("Renaming node")
                                    j.name = pck.get("name")

                                print("Connecting: " + str(i.name) + ", to: " + str(j.name))
                                i.connect(j)

            # Routing information request
            if "name" in pck and "recipient" in pck:
                print("Routing information request: " + str(pck.get("name")) + ": " + str(pck.get("recipient")))
                name = pck.get("name")

                # Search for node by name, else use specified address
                rec = pck.get("recipient")

                if name != "None":
                    for node in nodes:
                        if node.name == name:
                            rec = node.address
                            break

                route = "None"

                for node in nodes:
                    if node.address == address:
                        # Check for pre-existing routing information
                        print("Checking for existing route")
                        if node.routes.get(rec) is not None:
                            route = node.routes.get(rec).address[0]
                            break

                        # If route not found run find_route()
                        print("No existing route found, attempting to create one")
                        rec_node = [n for n in nodes if n.address == rec]
                        if len(rec_node) != 1:
                            print("Recipient node does not exist")
                            break

                        print("Searching for: " + str(rec_node[0].address))
                        find_route(node, rec_node[0])

                        # Check again for routing information
                        if node.routes.get(rec) is not None:
                            route = node.routes.get(rec).address[0]

                        break

                # Return routing information
                if route != "None":
                    print(route)
                    route = socket.gethostbyaddr(route)[0].split(".")[0]
                    print(route)

                print("Sending route: " + str(route) + ", to: " + str(socket.gethostbyaddr(address[0])))
                outgoing.append((tlv_enc("route", route), address))

    pass


# Packet sending thread
class SendPackets(threading.Thread):
    def run(self):
        print("Packet sending thread starting")

        global running, s
        while running:
            for pck in outgoing:
                s.sendto(pck[0], pck[1])

                outgoing.remove(pck)

    pass


# Main loop, handles instantiation and thread management
def main():
    print(__name__)

    # Initialise socket
    print("Initialising socket")
    global port
    s.bind(("0.0.0.0", port))

    # Start packet reception thread
    rec_packets = RecPackets()
    rec_packets.start()

    # Start packet sending thread
    send_packets = SendPackets()
    send_packets.start()

    # TODO: Exit signal


# For debug purposes, run main if script run at top level
if __name__ == "__main__":
    main()
