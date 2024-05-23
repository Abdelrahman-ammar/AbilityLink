import 'package:ability_link1/default%20text%20field.dart';
import 'package:ability_link1/sign_up_doctor.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ClinicInfo extends StatefulWidget {
  final Function(Map<String, String?>) onClinicInfoSaved;

  ClinicInfo({required this.onClinicInfoSaved, required String userId});

  @override
  _ClinicInfoState createState() => _ClinicInfoState();
}

class _ClinicInfoState extends State<ClinicInfo> {
  String? clinicName;
  String? clinicPhone;
  String? sessionPrice;
  String? city;
  String? street;
  String? buildingNum;
  String? floor;
  String? workingTimes;
  var clinicnamecontroller = TextEditingController();
  var clinicphonecontroller = TextEditingController();
  var sessionpricecontroller = TextEditingController();
  var clinicstreetcontroller = TextEditingController();
  var clinicbuildingcontroller = TextEditingController();
  var clinicfloorcontroller = TextEditingController();
  var clinictimecontroller = TextEditingController();
  var citycontroller = TextEditingController();

  Future<void> addDoc(
    CollectionReference users,
    String userId,
    String clinicName,
    String clinicPhone,
    String sessionPrice,
    String city,
    String street,
    String buildingNum,
    String floor,
    String workingTimes,
  ) async {
    try {
      // Call the user's CollectionReference to add new career information
       await FirebaseFirestore.instance
          .collection('users') // Access the 'users' collection
          .doc('BafSg4C1zRTGrDsan4lZDJdFxpt1') // Use the specified document ID
          .collection('doctors') // Access the 'doctors' subcollection
          .doc(userId) // Use userId as the document ID within the subcollection
          .set({
        'clinicName': clinicName,
        'clinicPhone': clinicPhone,
        'sessionPrice': sessionPrice,
        'city': city,
        'street': street,
        'buildingNum': buildingNum,
        'floor': floor,
        'workingTimes': workingTimes
      });
      print("Clinic info added successfully");
    } catch (e) {
      print("Failed to add clinic info: $e");
      // Handle the error appropriately
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to add clinic info: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Clinic Information",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
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
                          padding: const EdgeInsets.only(left: 25),
                          child: Text(
                            " Add yout Clinic Information",
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
                          onChange: (data) => setState(() => clinicName = data),
                          controller: clinicnamecontroller,
                          keyboardtype: TextInputType.text,
                          labletext: "Enter Here",
                          fillcolor: Color.fromARGB(255, 229, 229, 229),
                          // suffixicon: ,
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
                          onChange: (data) =>
                              setState(() => clinicPhone = data),
                          controller: clinicphonecontroller,
                          keyboardtype: TextInputType.phone,
                          labletext: "Enter Here",
                          fillcolor: Color.fromARGB(255, 229, 229, 229),
                          // suffixicon: ,
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
                          onChange: (data) =>
                              setState(() => sessionPrice = data),
                          controller: sessionpricecontroller,
                          keyboardtype: TextInputType.number,
                          labletext: "Session Price",
                          fillcolor: Color.fromARGB(255, 229, 229, 229),
                          weight: double.infinity,
                        ),
                        Text(
                          " City",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff12306C)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        DefaultTextField(
                          onChange: (data) => setState(() => city = data),
                          controller: citycontroller,
                          keyboardtype: TextInputType.text,
                          labletext: "Enter Your City",
                          fillcolor: Color.fromARGB(255, 229, 229, 229),
                          // suffixicon: ,
                          weight: double.infinity,
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
                          onChange: (data) => setState(() => street = data),
                          controller: clinicstreetcontroller,
                          keyboardtype: TextInputType.text,
                          labletext: "Enter Here",
                          fillcolor: Color.fromARGB(255, 229, 229, 229),
                          // suffixicon: ,
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
                                  onChange: (data) =>
                                      setState(() => buildingNum = data),
                                  controller: clinicbuildingcontroller,
                                  keyboardtype: TextInputType.number,
                                  labletext: "Enter Here",
                                  fillcolor: Color.fromARGB(255, 229, 229, 229),
                                  // suffixicon: ,
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
                                  onChange: (data) =>
                                      setState(() => floor = data),
                                  controller: clinicfloorcontroller,
                                  keyboardtype: TextInputType.number,
                                  labletext: "Enter Here",
                                  fillcolor: Color.fromARGB(255, 229, 229, 229),
                                  // suffixicon: ,
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
                          onChange: (data) =>
                              setState(() => workingTimes = data),
                          controller: clinictimecontroller,
                          keyboardtype: TextInputType.number,
                          labletext: "Enter Here",
                          fillcolor: Color.fromARGB(255, 229, 229, 229),
                          // suffixicon: ,
                          weight: double.infinity,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: InkWell(
                      onTap: () async {
                        // Get current user's ID
                        final userId = FirebaseAuth.instance.currentUser!.uid;
                        // Add clinic info to Firestore
                        await addDoc(
                            FirebaseFirestore.instance.collection('doctors'),
                            userId,
                            clinicName!,
                            clinicPhone!,
                            sessionPrice!,
                            city!,
                            street!,
                            buildingNum!,
                            floor!,
                            workingTimes!);

                        // Call the callback function provided by the parent page
                        // with the clinic information
                        final clinicinfo = {
                          'clinicName': clinicName,
                          'clinicPhone': clinicPhone,
                          'sessionPrice': sessionPrice,
                          'city': city,
                          'street': street,
                          'buildingNum': buildingNum,
                          'floor': floor,
                          'workingTimes': workingTimes,
                        };

                        widget.onClinicInfoSaved(clinicinfo);

                        // Navigate back to the previous page
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xff0072F9)),
                        alignment: Alignment.center,
                        child: Text(
                          "Done",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
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
