import 'package:ability_link1/models/message.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Chat_friends extends StatelessWidget {
  const Chat_friends({
    Key? key,
    required this.message,
    required this.isCurrentUserMessage,
  }) : super(key: key);

  final Message message;
  final bool isCurrentUserMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:
          isCurrentUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: isCurrentUserMessage
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: ClipPath(
              clipper: isCurrentUserMessage
                  ? UpperNipMessageClipper(MessageType.send)
                  : UpperNipMessageClipper(MessageType.receive),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: isCurrentUserMessage
                      ? Colors.blue
                      : const Color.fromARGB(255, 197, 196, 196),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  message.message,
                  style: TextStyle(
                      fontSize: 16,
                      color: isCurrentUserMessage
                          ? const Color.fromARGB(255, 197, 196, 196)
                          : Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
