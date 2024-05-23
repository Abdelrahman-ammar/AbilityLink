import 'package:ability_link1/LetsStart.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboardingpage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<Onboardingpage> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Color(0xff2A7FFE),
        body: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 480,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/on1.png"),
                        fit: BoxFit.fill),
                    // borderRadius: BorderRadius.all(
                    //   Radius.circular(30),
                    // ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Container(
                    child: Text(
                      textAlign: TextAlign.center,
                      "Welcome we're thrilled to have you join our inclusive community.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 470,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/on2.png"),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Container(
                    child: Text(
                      textAlign: TextAlign.center,
                      "Together, let's navigate this journey with smiles, support, and a shared sense of hope.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 460,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/on3.png"),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Container(
                    child: Text(
                      textAlign: TextAlign.center,
                      "Ultimate happiness hub for families of superheroes!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        bottomSheet: isLastPage
            ? Container(
                color: Color(0xff2A7FFE),
                height: 150,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LetsStart(),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color.fromARGB(164, 0, 66, 249),
                        ),
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Start now",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(
                                        255, 195, 195, 195)),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: const Color.fromARGB(255, 195, 195, 195),
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: WormEffect(
                        dotColor: Colors.grey,
                        activeDotColor: Color.fromARGB(255, 8, 79, 141),
                      ),
                      onDotClicked: (index) => controller.animateToPage(index,
                          duration: const Duration(
                            milliseconds: 500,
                          ),
                          curve: Curves.easeInOut),
                    )
                  ],
                ),
              )
            : Container(
                height: 60,
                color: Color(0xff2A7FFE),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => controller.jumpToPage(2),
                      child: Text(
                        "skip",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: WormEffect(
                          dotColor: Colors.grey,
                          activeDotColor: Color.fromARGB(255, 8, 79, 141),
                        ),
                        onDotClicked: (index) => controller.animateToPage(index,
                            duration: const Duration(
                              milliseconds: 500,
                            ),
                            curve: Curves.easeInOut),
                      ),
                    ),
                    IconButton(
                      onPressed: () => controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn),
                      icon: Icon(
                        Icons.arrow_forward_outlined,
                      ),
                      color: Colors.black,
                      iconSize: 25,
                    ),
                  ],
                ),
              ),
      );
}
