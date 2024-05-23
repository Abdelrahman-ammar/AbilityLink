import 'package:ability_link1/chatFromFriend.dart';
import 'package:ability_link1/models/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ability_link1/chatbottomsheet.dart';
import 'package:ability_link1/chats_sample.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Chats extends StatelessWidget {
  final String name;
  final bool isOnline;

  final _controller = ScrollController();
  var messageController = TextEditingController();

  Chats({
    Key? key,
    required this.name,
    required this.isOnline,
  }) : super(key: key);

  CollectionReference messages =
      FirebaseFirestore.instance.collection('message');

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String senderID = FirebaseAuth.instance.currentUser!.uid;
    String receiverID = "";
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy('createdAt', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("Data: ${snapshot.data}");
            List<Message> messageslist = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messageslist.add(Message.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
                appBar: AppBar(
                  title: Row(children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          "assets/images/Group 9204.png",
                          height: 45,
                          width: 45,
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 0, right: 50),
                            child: Text(
                              name,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 21, right: 50),
                              child: Text("Active now",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey[500])))
                        ],
                      ),
                    ),
                  ]),
                ),
                body: Stack(children: [
                  ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messageslist.length,
                    itemBuilder: (context, index) {
                      final message = messageslist[index];
                      final bool isCurrentUserMessage =
                          message.senderID == senderID;
                      return isCurrentUserMessage
                          ? Chat_sample(
                              message: message,
                              isCurrentUserMessage: isCurrentUserMessage,
                            )
                          : Chat_friends(
                              message: message,
                              isCurrentUserMessage: isCurrentUserMessage,
                            );
                    },
                    padding: EdgeInsets.only(
                        top: 20, left: 20, right: 20, bottom: 80),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(children: [
                        Container(
                            height: 65,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Row(children: [
                              Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: RotatedBox(
                                      quarterTurns: 45,
                                      child: IconButton(
                                          onPressed: () {
                                            showModalBottomSheet(
                                                context: context,
                                                builder: (context) {
                                                  return Container(
                                                    width: 400,
                                                    height: 300,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 30),
                                                      child: Column(
                                                        children: [
                                                          const Text(
                                                            'ShareContent',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontSize: 20),
                                                          ),
                                                          Row(
                                                            children: [
                                                              IconButton(
                                                                  onPressed:
                                                                      () {},
                                                                  icon:
                                                                      const Icon(
                                                                    Icons
                                                                        .camera_alt_outlined,
                                                                    color: Colors
                                                                        .blue,
                                                                    size: 30,
                                                                  )),
                                                              const SizedBox(
                                                                width: 15,
                                                              ),
                                                              const Text(
                                                                'Camera',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              IconButton(
                                                                  onPressed:
                                                                      () {},
                                                                  icon:
                                                                      const Icon(
                                                                    Icons
                                                                        .edit_document,
                                                                    color: Colors
                                                                        .blue,
                                                                    size: 30,
                                                                  )),
                                                              const SizedBox(
                                                                width: 15,
                                                              ),
                                                              const Text(
                                                                'Document',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              IconButton(
                                                                  onPressed:
                                                                      () {},
                                                                  icon:
                                                                      const Icon(
                                                                    Icons
                                                                        .photo_album_outlined,
                                                                    color: Colors
                                                                        .blue,
                                                                    size: 30,
                                                                  )),
                                                              const SizedBox(
                                                                width: 15,
                                                              ),
                                                              const Text(
                                                                'Media',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                });
                                          },
                                          icon: Icon(
                                              Icons.attachment_outlined)))),
                              Padding(
                                  padding: EdgeInsets.only(left: 30),
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    width: 200,
                                    child: TextField(
                                      controller: controller,
                                      onSubmitted: (data) async {
                                        final user =
                                            FirebaseAuth.instance.currentUser;

                                        messages.add({
                                          'message': data,
                                          'createdAt': DateTime.now(),
                                          'senderID': user!.uid,
                                          'receiverID': receiverID,
                                        });
                                        controller.clear();
                                        _controller.animateTo(0,
                                            duration: Duration(seconds: 1),
                                            curve: Curves.fastOutSlowIn);
                                      },
                                      decoration: InputDecoration(
                                        hintText: "write your message",
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 0),
                                child: RotatedBox(
                                  quarterTurns: 180,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.send,
                                      color: Colors.blue,
                                      size: 30,
                                    ),
                                    onPressed: () async {
                                      final user =
                                          FirebaseAuth.instance.currentUser;
                                      if (controller.text.isNotEmpty) {
                                        // If the message is not empty
                                        messages.add({
                                          'message': controller.text,
                                          'createdAt': DateTime.now(),
                                          'senderID': user!.uid,
                                          'receiverID': receiverID,
                                        });
                                        controller.clear();
                                        _controller.animateTo(0,
                                            duration: Duration(seconds: 1),
                                            curve: Curves.fastOutSlowIn);
                                      }
                                    },
                                  ),
                                ),
                              )
                            ]))
                      ]))
                ]));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
