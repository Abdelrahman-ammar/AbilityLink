class Message {
  final String message;
  final String receiverID;
  final String senderID;
  Message(this.message, this.senderID, this.receiverID);

  factory Message.fromJson(jsonData) {
    return Message(
        jsonData['message'], jsonData['senderID'], jsonData['receiverID']);
  }
}
