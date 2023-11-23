# Network node class and methods

"""
~~~~ Routing table format ~~~~
(╯°□°）╯︵ ┻━┻

Each node in a network contains node.routes, which is a dictionary of routes by destination.
These dictionary follow this format:
{
    <DESTINATION_IP>: <NEXT_NODE_IN_ROUTE>
}
"""


# Node class
class Node:
    # Constructor
    def __init__(self, address, dev_type, name=None):
        self.name = name
        self.address = address
        self.type = dev_type
        self.connections = list()  # List of all connected nodes
        self.routes = dict()  # Contains a list of dictionaries with routing

    # Connect another node to this one
    def connect(self, node, bi=True):
        if node not in self.connections:
            self.connections.append(node)

        # Add self to node's connections
        if bi:
            node.connect(self, False)

    pass


# Find route between source and destination
# Updates all nodes in route's routing table with discovered route and returns the route
# Greets: Emmet! For helping me debug this
def find_route(src, dst):
    route = find_route_rec(src, dst, set())

    if route is None:
        print("No route found")
        return None

    for i, node in enumerate(route):
        if i == len(route) - 1:
            print("Destination reached: " + str(dst.address))
            node.routes.update({dst.address: dst.address})
        else:
            next_node = route[i + 1]
            print("Updating node: " + str(node.address[0]) + ", " + str(next_node.address[0]))
            node.routes.update({dst.address: next_node})

        print(node.routes)

    return route.copy()


# Recursive helper function for find route
# TODO: Return shortest route, currently returns last found route
def find_route_rec(src, dst, visited):
    print("src: " + str(src.address[0]) + ", dst: " + str(dst.address[0]))

    if src.address == dst.address:
        print("Destination found: " + str(src.address[0]))
        return [src]

    visited.add(src)
    
    for node in src.connections:
        print("Checking: " + str(node.address[0]))

        if node not in visited:
            print("Destination not found")
            updated_route = find_route_rec(node, dst, visited.copy())
            if updated_route is not None:
                updated_route.insert(0, src)  # Insert the current node at the beginning of the route
                return updated_route

    return None
