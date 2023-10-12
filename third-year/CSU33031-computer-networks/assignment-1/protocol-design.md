Producers should be identified by a 3-byte code e.g. ”ABCD99” and their current streams are given a number, encoded in another byte e.g. “ABCD9901” for the stream 1 by producer “ABCD99”.

The protocol i have designed is as follows : packet type (2 bytes), producerID (3 bytes), streamID (1 byte), videoFrameID (4 bytes), length of video frame (4 bytes), bytes of the video frame

### packet types

#### Subscription Request Packet:

Purpose: Consumers use this packet to request a subscription to specific streams from a particular producer or all streams from that producer.
Header: Contains information about the consumer, producer, stream subscriptions, and any additional details.
#### Publication Packet:

Purpose: Producers use this packet to send frames or content to the broker for distribution to consumers.
Header: Includes information about the producer, the stream number, and possibly other relevant data.
#### Acknowledgment Packet:

Purpose: Consumers can send acknowledgment packets to inform the broker or producer about the status of received frames. Acknowledgments can be used for error recovery and flow control.
Header: Contains acknowledgment information and may reference the frames being acknowledged.