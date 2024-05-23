import 'package:flutter/material.dart';

class Guidelines_ontap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/guidelines2.png"),
                  fit: BoxFit.fill),
            ),
            child: Padding(
              padding:
                  EdgeInsets.only(left: 30, top: 60, right: 30, bottom: 60),
              child: Text(
                "Listen actively: Allow the individual to express their feelings without judgment"
                ".Encourage professional help: Encourage them to seek therapy or medication."
                "Provide a supportive environment: Offer comfort, reassurance, and emotional support."
                "Encourage self-care: Promote healthy habits like exercise, good nutrition, and sleep.",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )));
  }
}
