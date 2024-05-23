import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class notification_post extends StatelessWidget {
  notification_post(
      {required this.name,
      required this.time,
      required this.title,
      required this.isOnline});
  final String name;
  var img;
  final String time;
  final String title;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      height: 120,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(children: <Widget>[
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
                  )
                ]),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 70),
                      child: Text(
                        name + " " + title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(right: 130, left: 20),
                        child: Text(
                          time,
                        ))
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 90,
          ),
          const Divider(
            color: Color(0xff667085),
            thickness: BorderSide.strokeAlignCenter,
            height: 0,
          ),
        ],
      ),
    ));
  }
}
