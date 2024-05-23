import 'package:ability_link1/search_for_doctors.dart';
import 'package:ability_link1/search_for_schools.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  Search();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xff012306C)),
        ),
        centerTitle: true,
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
                      height: 50,
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchDoctor(),
                              ),
                            );
                          },
                          child: Container(
                            child: Image.asset("assets/images/doc.png"),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SearchSchool(),
                                ),
                              );
                            },
                            child: Container(
                              child: Image(
                                  image:
                                      AssetImage("assets/images/schooll.png")),
                            )),
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
