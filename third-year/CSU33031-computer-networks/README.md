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

|            |                                        |
| ---        | ---                                    |
| **Sender** | issues 'signals'                       | 
| Receiver   | receives 'signals'                     | 
| **Client** | requests info                          |
| Server     | serves info                            | 
| **Master** | controls other nodes                   | 
| Slave      | is being controlled                    |
| Header     | management information                 |
| Payload    | information that should be transferred | 

#### Link Layer

##### Duties of the Data Link Layer

- packetizing
- flow control
- media access control
- addressing 
- error control

The data link layer is responsible for transmitting frames for one node to the next.
###### Packetizing and flow control

Packetizing: encapsulating in framer cell i.e. adding header and trailer  
Addressing: Determining the address of the next hop (LANs) or the vertual circuit address

###### Communication

Byte stuffing: process of adding1 extra byte whenever there is a flag or escape character in the text.  

###### Bit Stuffing

Process od adding an extra 0 whenever five consecutive 1s follow a 0 in the data.

##### Networking issues

time -> latency  
amount -> throughput  
management information -> overhead  
overhead vs. payload

##### Flow control

- Forouzans definition: Flow control refers to a setof procedures used to restrict the amount of data that the sender can send before wating for acknowledgment.
- Lecturers definition: Flow control refers to the control of the amount of data that sender can transmit without overflowing the receiver.

##### Flow control protocols

| for noiseless channel | for noisy channel    |
| ---                   | ---                  |
| simplest              | stop-and-wait ARQ    |
| stop-and-wait         | go-back-N ARQ        |
|                       | selective repeat ARQ |

##### Simplest Protocol

Sender sends frames as fast as data arrives  
receiver recieves all data sent

##### Stop-and-Wait

- sender sends framesand waits for ACK
- receiver replies tor received frame with ACK

##### Error control

- Frames may get lost or corrupted
  - incorrect checksum, CRC's, etc.
- Error control need to ensure retransmission
- Error control protocols:
  - Stop-and-wait ARQ
  - Go-Back-N ARQ
  - Selective Repeat ARQ (ARQ = Automatic Repeat Request)
  
###### Ingredients for Error Control
- Error detection
- Postive Acknowledgment
  - Receiver returns positive ACK for received, error-free frames
- Retranmission after timeoout
  - Sender retransmit packet after given time
- Negative acknowledgment and retransmission
  - Receiver returns negative ACK - or NACK - for packets with errors
  - Stop-and-wait ARQ
 