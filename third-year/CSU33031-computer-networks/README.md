[Taken from https://teaching.scss.tcd.ie/module/csu33031-computer-networks/]

# CSU33031 – Computer Networks

| Module Code | CSU33031 |
| --- | --- |
| Module Name | Computer Networks |
| ECTS Weighting | 5 ECTS |
| Semester Taught | Semester 1 |
| Module Coordinator/s | Stefan Weber |

## Module Learning Outcomes


On successful completion of this module, students will be able to:

1. Describe and discuss protocols used at the Link layer for communication between nodes connected to a local area network;
2. Describe and discuss protocols used at the Network layer for communication between nodes connected to the Internet;
3. Describe and analyse the flow of information between two devices connected to the Internet;
4. Analyse and appraise current protocols underlying the Internet;
5. Design and develop solutions for communication between nodes in the Internet;
6. Assess designs of communication protocols.

## Module Content

The module introduces the basic concepts underlying the communication between nodes connected to the Internet. The explanation of this communication can be split into two layers: one layer focuses on the delivery of data between two immediately connected devices e.g. nodes connected to the same local network; the other layer focuses on the interconnection of individual networks into the Internet and the communication between nodes connected to the Internet.

Topics addressed in this module include:

- Error Detection and Flow Control;
- Example protocols such as HDLC and PPP;
- Medium Access Control (MAC);
- Examples of MAC protocols such as IEEE 802.11 Wifi and IEEE 802.3 Ethernet;
- Switching & Routing;
- Internet Protocol v4/v6;
- Routing Protocols;
- Software-Defined Networking and OpenFlow Past & current structure of the Internet.

## Lectures

### Flow control

#### OSI Stack & Data Units

| Layer |              |
| ---   | ---          |
| 7     | Application  |
| 6     | Presentation |
| 5     | Session      |
| 4     | Transport    |
| 3     | Network      |
| 2     | Data-Link    |
| 1     | Physical     |

#### General Terms

|            |                      |
| ---        | ---                  |
| **Sender** | issues 'signals'     | 
| Receiver   | receives 'signals'   | 
| **Client** | requests info        |
| Server     | serves info          | 
| **Master** | controls other nodes | 
| Slave      | is being controlled  |
