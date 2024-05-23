// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:ability_link1/commentpage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Saved_Post extends StatelessWidget {
//   final String name;
//   final String time;
//   final String title;
//   final bool isOnline;
//   final String postId;

//   Saved_Post(this.name, this.time, this.title, this.isOnline, this.postId);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Container(
//             height: 325,
//             decoration: BoxDecoration(
//               color: Color.fromARGB(255, 255, 255, 255),
//               borderRadius: BorderRadius.all(Radius.circular(8)),
//             ),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 0, top: 0, left: 10),
//                   child: Row(
//                     children: [
//                       Stack(
//                         children: <Widget>[
//                           CircleAvatar(
//                             backgroundImage: AssetImage(
//                               "assets/images/Group 9204.png",
//                             ),
//                             radius: 25,
//                           ),
//                           Positioned(
//                             bottom: 0.0,
//                             left: 6.0,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(6),
//                               ),
//                               height: 11,
//                               width: 11,
//                               child: Center(
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     color: isOnline ? Colors.greenAccent : Colors.grey,
//                                     borderRadius: BorderRadius.circular(6),
//                                   ),
//                                   height: 7,
//                                   width: 7,
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Column(
//                         children: [
//                           Text(
//                             name,
//                             style: const TextStyle(
//                               fontWeight: FontWeight.normal,
//                               fontSize: 10,
//                               color: Colors.black,
//                             ),
//                           ),
//                           Text(
//                             time,
//                             style: const TextStyle(
//                               fontWeight: FontWeight.normal,
//                               fontSize: 10,
//                               color: Colors.black,
//                             ),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   title,
//                   style: TextStyle(
//                     color: Color(0xff667085),
//                     fontWeight: FontWeight.normal,
//                     fontSize: 10,
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 50,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10.0, right: 10),
//                   child: Container(
//                     height: 185,
//                     decoration: BoxDecoration(
//                       color: Colors.grey[300],
//                       borderRadius: BorderRadius.circular(30),
//                       image: DecorationImage(
//                         image: AssetImage("assets/images/userpost2.png"),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 30.0, top: 10, bottom: 0),
//                   child: Row(
//                     children: [
//                       IconButton(
//                         icon: Icon(
//                           Icons.favorite_border,
//                         ),
//                         color: Color(0xff667085),
//                         onPressed: () {
//                           print('love');
//                         },
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       IconButton(
//                         icon: Icon(
//                           FontAwesomeIcons.comment,
//                           color: Color(0xff667085),
//                         ),
//                         onPressed: () {
//                           Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: (context) => comment_page(postId: postId),
//                             ),
//                           );
//                         },
//                       ),
//                       Text(
//                         '472',
//                         style: TextStyle(
//                           fontWeight: FontWeight.normal,
//                           fontSize: 10,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 100,
//                       ),
//                       IconButton(
//                         icon: Icon(
//                           Icons.bookmark_border,
//                           color: Color.fromARGB(255, 50, 102, 214),
//                         ),
//                         onPressed: () {
//                           print('saved');
//                         },
//                       ),
//                       SizedBox(
//                         width: 20,
//                       ),
//                       Icon(
//                         FontAwesomeIcons.share,
//                         color: Color(0xff667085),
//                       )
//                     ],
//                   ),
//                 ),
//                 const Divider(
//                   color: Color(0xff667085),
//                   thickness: BorderSide.strokeAlignCenter,
//                   height: 0,
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
