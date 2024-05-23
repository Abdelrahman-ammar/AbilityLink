import 'package:flutter/material.dart';
import 'package:ability_link1/write_review.dart';
import 'package:rating_summary/rating_summary.dart';

class SchoolReviews extends StatelessWidget {
  final String documentId;

  SchoolReviews({required this.documentId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reviews",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Ratings(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 170),
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          Reviews(),
                          Reviews(),
                          Reviews(),
                          Reviews(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      const Color.fromARGB(255, 7, 7, 7)
                    ],
                  ),
                  color: Colors.transparent.withOpacity(0.7),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(50),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WriteReview(),
                        ),
                      );
                    },
                    child: Container(
                      height: 55,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff0072F9),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Write a Review",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Reviews extends StatelessWidget {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
      child: Container(
        width: 360,
        decoration: BoxDecoration(
          color: Color(0xff0072F9),
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Color.fromARGB(255, 21, 20, 20),
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/images/user.png",
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Sharon Jem",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 18,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xffD0FD3E),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      textAlign: TextAlign.center,
                      "4.8",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    "2d ago",
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Good School  Good School  Good School  Good School  Good School  Good School  Good School  Good School  Good School  Good School  Good School  Good School   ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Ratings extends StatelessWidget {
  const Ratings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: RatingSummary(
        counter: 16,
        average: 4.0,
        counterFiveStars: 5,
        counterFourStars: 4,
        counterThreeStars: 2,
        counterTwoStars: 3,
        counterOneStars: 2,
        color: Color(0xff0072F9),
      ),
    );
  }
}
