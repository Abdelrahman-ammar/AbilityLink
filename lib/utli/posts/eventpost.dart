import 'package:ability_link1/event.dart';
import 'package:flutter/material.dart';

class Event_Post extends StatelessWidget {
  final String title;
  final String government;
  final String date;

  Event_Post({
    Key? key,
    required this.title,
    required this.government,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> dateParts = date.split('-');

    String day = dateParts.length > 0 ? dateParts[0] : '';
    String month = dateParts.length > 1 ? dateParts[1] : '';
    String year = dateParts.length > 2 ? dateParts[2] : '';

    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 30, top: 10),
            child: Stack(
              children: [
                Container(
                  height: 190,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage("assets/images/Image.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
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
                      padding: const EdgeInsets.only(
                        right: 5,
                        left: 5,
                        top: 120,
                        bottom: 5,
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: 500,
                            height: 90,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.4),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20, top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      title,
                                      style: TextStyle(
                                        color: Color(0xff12306C),
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      government,
                                      style: TextStyle(
                                        color: Color(0xff515968),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 35,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(150, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      day,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      month,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                        150, 255, 255, 255),
                                    iconColor:
                                        const Color.fromRGBO(33, 150, 243, 1),
                                    fixedSize: Size(110, 45),
                                  ),
                                  onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => CreateEvent(),
                                    ),
                                  ),
                                  child: const Row(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'view more',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                          // Text(
                                          //   'more',
                                          //   style: TextStyle(
                                          //     color: Colors.black,
                                          //     fontStyle: FontStyle.normal,
                                          //     fontSize: 12,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                      Spacer(),
                                      RotatedBox(
                                        quarterTurns: 90,
                                        child: Icon(
                                          Icons.arrow_back_ios_outlined,
                                          color: Colors.blueAccent,
                                          size: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
