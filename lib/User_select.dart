import 'package:ability_link1/sign_up_volanteer.dart';
import 'package:ability_link1/sign_up_care.dart';
import 'package:ability_link1/sign_up_doctor.dart';
import 'package:flutter/material.dart';

class UserSelect extends StatelessWidget {
  UserSelect();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Choose Your Character",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xff012306C)),
        ),
        // centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    // Text(
                    //   "Start By Choosing Your Character.",
                    //   style: TextStyle(
                    //       fontSize: 20,
                    //       fontWeight: FontWeight.bold,
                    //       color: Color(0xff012306C)),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpCare()));
                            },
                            child: Image(
                                image: AssetImage("assets/images/care.png"))),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpDoc()));
                            },
                            child: Image(
                                image: AssetImage("assets/images/doc.png"))),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpVolan()));
                            },
                            child: Image(
                                image: AssetImage("assets/images/volan.png")))
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
