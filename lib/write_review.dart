import 'package:ability_link1/default text field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// ignore: must_be_immutable
class WriteReview extends StatelessWidget {
  WriteReview({super.key});
  var reviewcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Write a Review",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              glowColor: Colors.white,
              itemPadding: EdgeInsets.symmetric(
                horizontal: 4.0,
              ),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: const Color(0xff0072F9),
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: DefaultTextField(
                controller: reviewcontroller,
                keyboardtype: TextInputType.text,
                labletext: "Write a Review (optional)",
                fillcolor: Color.fromARGB(255, 229, 229, 229),
                // suffixicon: ,
                height: 200,
                weight: double.infinity,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 55,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff0072F9)),
                alignment: Alignment.center,
                child: Text(
                  "Send",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
