me: "develop a reactive routing approach as an overlay that estashlishesrouting information by broadcasting requests for locations of destinations that are not listed in current routing information"

chat gpt: "A reactive routing approach, also known as on-demand routing, establishes routing information only when necessary, which helps reduce overhead in the network. In this approach, when a source node needs to send data to a destination node for which there is no current routing information, it broadcasts a request to discover a route. Here's how you can develop a reactive routing approach as an overlay network:

1. Node Registration:
   - Each node in the network should be aware of its neighbors. This information can be obtained through periodic hello messages or some other mechanism.

2. Route Request (RREQ) Broadcast:
   - When a source node wants to send data to a destination node for which it has no routing information, it initiates a Route Request (RREQ) packet.
   - The RREQ packet contains information about the source, destination, a unique request identifier, and a hop count (initially set to zero).
   - The source node broadcasts the RREQ to its neighbors.

3. RREQ Forwarding and Processing:
   - Neighboring nodes receive the RREQ and check if they are the destination node. If they are, they respond with a Route Reply (RREP) directly to the source.
   - If a node is not the destination, it checks if it has seen the RREQ before (using the request identifier). If not, it increments the hop count and forwards the RREQ to its neighbors.

4. RREP Propagation:
   - When the RREQ reaches the destination node or an intermediate node with information about the destination, it generates a Route Reply (RREP) packet.
   - The RREP packet includes the path from the source to the destination.
   - The RREP is sent back to the source following the reverse path taken by the RREQ.

5. Route Maintenance:
   - The source node stores the obtained route information for future use.
   - Intermediate nodes that have forwarded the RREQ also store the route information.
   - Routes expire after a certain time or after a number of hops, and new RREQs must be initiated if needed.

6. Data Transmission:
   - Once the source node has received a valid route (RREP), it can start transmitting data packets to the destination using the established route.

7. Route Discovery and Updates:
   - If the existing route becomes invalid (e.g., due to node mobility or link failures), the source node can initiate a new RREQ to discover an updated route.

8. Timeout and Cache Management:
   - The nodes should periodically refresh or invalidate routes based on timeouts and network conditions.
   - A route cache can be used to store routing information and avoid repetitive route discovery.

This approach allows the network to establish routing information dynamically as needed, reducing the overhead of maintaining routing tables for every possible destination. It is often used in ad-hoc and mesh networks where nodes may frequently change their positions or join/leave the network. The route discovery process is triggered reactively when data needs to be sent, ensuring efficient resource usage."

## Step 1: figure out
- communication between endpoints and router
- broadcast of requests to resolve an address 
- response to request broadcast
- forwarding of original information

## Step 2: expand
- number of packets
- number of routers & endpoints
- handle exceptional cases