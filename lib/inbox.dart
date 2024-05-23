import 'package:flutter/material.dart';
import 'package:ability_link1/messages.dart';
import 'package:ability_link1/default%20text%20field.dart';

// ignore: must_be_immutable
class inbox_page extends StatelessWidget {
  final String dp;
  final String name;
  final String time;
  final String msg;
  final bool isOnline;
  final int counter;
  var SearchController5 = TextEditingController();

  List items = [
    message_page(
        dp: 'jh',
        name: 'name',
        time: '2 hours',
        msg: 'how are you',
        isOnline: true,
        counter: 3),
    message_page(
        dp: 'jh',
        name: 'name',
        time: '2 hours',
        msg: 'how are you',
        isOnline: true,
        counter: 3),
    message_page(
        dp: 'jh',
        name: 'name',
        time: '2 hours',
        msg: 'how are you',
        isOnline: true,
        counter: 3),
  ];

  inbox_page({
    Key? key,
    required this.dp,
    required this.name,
    required this.time,
    required this.msg,
    required this.isOnline,
    required this.counter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        bottom: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 40),
              child: Container(
                width: 330,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DefaultTextField(
                  controller: SearchController5,
                  keyboardtype: TextInputType.text,
                  labletext: "Search By Name",
                  prefixicon: Icons.search,
                  weight: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Dismissible(
            confirmDismiss: (DismissDirection direction) async {
              if (direction == DismissDirection.endToStart) {
                return await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: Text('Delete'),
                        content: Text(' Are YOU Sure You Want to Delete it ?'),
                        actions: <Widget>[
                          ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: Text(
                                "yes",
                                style: TextStyle(color: Colors.blueAccent),
                              )),
                          ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: Text("no",
                                  style: TextStyle(color: Colors.blueAccent))),
                        ],
                      );
                    });
              }
            },
            background: 
                Padding(
              padding: EdgeInsets.only(left: 250),
              child: Row(children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                          image: AssetImage("assets/images/notification.png"),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                          image: AssetImage("assets/images/Trash (1).png"),
                          fit: BoxFit.cover)),
                ),
              ]),
            ),
            key: ValueKey(items[index]),
            child: message_page(
                dp: dp,
                name: name,
                time: time,
                msg: msg,
                isOnline: isOnline,
                counter: counter),
          );
        },
      ));
  Widget buildListTile(message_page item) => ListTile(
        onTap: () {},
      );
}

class DismissibleWidget {}
