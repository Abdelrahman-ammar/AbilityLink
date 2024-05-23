import 'package:ability_link1/models/message.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Chat_sample extends StatelessWidget {
  const Chat_sample({
    Key? key,
    required this.message,
    required this.isCurrentUserMessage,
  }) : super(key: key);
  final Message message;
  final bool isCurrentUserMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
            ),
            child: ClipPath(
              clipper: UpperNipMessageClipper(MessageType.send),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  message.message,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          )),
    ]));
  }
}
