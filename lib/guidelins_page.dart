import 'package:ability_link1/default%20text%20field.dart';
import 'package:ability_link1/guidelines_post.dart';
import 'package:flutter/material.dart';
import 'package:ability_link1/utli/posts/guidelines_post.dart';

class Guide_Lines extends StatelessWidget {
  var SearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  controller: SearchController,
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
      body: Guidelines_Gridview(),
    );
  }
}
