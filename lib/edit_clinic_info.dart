import 'package:ability_link1/default text field.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditClinic extends StatelessWidget {
  EditClinic({super.key});
  var clinicnamecontroller = TextEditingController();
  var clinicphonecontroller = TextEditingController();
  var sessionpricecontroller = TextEditingController();
  var clinicstreetcontroller = TextEditingController();
  var clinicbuildingcontroller = TextEditingController();
  var clinicfloorcontroller = TextEditingController();
  var clinictimecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Clinic Information",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: Text(
                            "Edit yout Clinic Information.",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff858585),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          " Clinic Name",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff12306C)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        DefaultTextField(
                          controller: clinicnamecontroller,
                          keyboardtype: TextInputType.text,
                          labletext: "Clinic Name",
                          fillcolor: Color.fromARGB(255, 229, 229, 229),
                          suffixicon: Icons.edit,
                          weight: double.infinity,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          " Clinic Phone",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff12306C)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        DefaultTextField(
                          controller: clinicphonecontroller,
                          keyboardtype: TextInputType.phone,
                          labletext: "Clinic Phone",
                          fillcolor: Color.fromARGB(255, 229, 229, 229),
                          suffixicon: Icons.edit,
                          weight: double.infinity,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          " session Price",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff12306C)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        DefaultTextField(
                          controller: sessionpricecontroller,
                          keyboardtype: TextInputType.number,
                          labletext: "Price",
                          fillcolor: Color.fromARGB(255, 229, 229, 229),
                          weight: double.infinity,
                          suffixicon: Icons.edit,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // text5gf (21:2661)
                          child: Text(
                            'Choose your Government ',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff12306c),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add_circle,
                              color: Colors.blue, size: 25),
                          onPressed: () {},
                          style: TextButton.styleFrom(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          " Street",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff12306C)),
                        ),
                        DefaultTextField(
                          controller: clinicstreetcontroller,
                          keyboardtype: TextInputType.text,
                          labletext: "Street",
                          fillcolor: Color.fromARGB(255, 229, 229, 229),
                          suffixicon: Icons.edit,
                          weight: double.infinity,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  " Building Number",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff12306C)),
                                ),
                                DefaultTextField(
                                  controller: clinicbuildingcontroller,
                                  keyboardtype: TextInputType.number,
                                  labletext: "Building Number",
                                  fillcolor: Color.fromARGB(255, 229, 229, 229),
                                  suffixicon: Icons.edit,
                                  weight: 150,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  " Floor",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff12306C)),
                                ),
                                DefaultTextField(
                                  controller: clinicfloorcontroller,
                                  keyboardtype: TextInputType.number,
                                  labletext: "Floor",
                                  fillcolor: Color.fromARGB(255, 229, 229, 229),
                                  suffixicon: Icons.edit,
                                  weight: 120,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          " Working Times",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff12306C)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        DefaultTextField(
                          controller: clinictimecontroller,
                          keyboardtype: TextInputType.number,
                          labletext: "Time",
                          fillcolor: Color.fromARGB(255, 229, 229, 229),
                          // suffixicon: ,
                          weight: double.infinity,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xff0072F9)),
                      alignment: Alignment.center,
                      child: Text(
                        "Save",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
