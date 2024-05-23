import 'package:flutter/material.dart';
import 'package:ability_link1/utli/posts/chats.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class message_page extends StatelessWidget {
  final String dp;
  final String name;
  final String time;
  final String msg;
  final bool isOnline;
  final int counter;

  message_page({
    Key? key,
    required this.dp,
    required this.name,
    required this.time,
    required this.msg,
    required this.isOnline,
    required this.counter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: Stack(
              children: <Widget>[
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back,
                    )),
                CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/images/Group 9204.png",
                  ),
                  radius: 25,
                ),
                Positioned(
                  bottom: 0.0,
                  left: 6.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    height: 11,
                    width: 11,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: isOnline ? Colors.greenAccent : Colors.grey,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        height: 7,
                        width: 7,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            title: Text(
              "${name}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text("${msg}"),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                SizedBox(height: 10),
                Text(
                  "${time}",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 11,
                  ),
                ),
                SizedBox(height: 5),
                counter == 0
                    ? SizedBox()
                    : Container(
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 11,
                          minHeight: 11,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 1, left: 5, right: 5),
                          child: Text(
                            "${counter}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
              ],
            ),
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return Chats(
                      name: name,
                      isOnline: true,
                    );
                  },
                ),
              );
            },
          )));
}
