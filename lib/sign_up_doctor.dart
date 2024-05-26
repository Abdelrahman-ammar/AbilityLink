import 'package:ability_link1/SignIn.dart';
import 'package:ability_link1/career_info.dart';
import 'package:ability_link1/clinic_info.dart';
import 'package:ability_link1/default%20text%20field.dart';
import 'package:ability_link1/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/cache/cache_helper.dart';


class SignUpDoc extends StatefulWidget {
  @override
  _SignUpDocState createState() => _SignUpDocState();
}

class _SignUpDocState extends State<SignUpDoc> {
  String? fullName;
  String? gender;
  String? phonenumber;
  String? email;
  String? password;
  String? city;
  //Map? careerInfo;
  // Map? clinicInfo;
  String? userId;

  // CachHelper Cc = CachHelper.init();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var fullnamecontroller = TextEditingController();
  var mobnumcontroller = TextEditingController();
  var gendercontroller = TextEditingController();
  var citycontroller = TextEditingController();

  // void updateCareerInfo(Map<String, String?> careerInfo) {
  //   setState(() {
  //     this.careerInfo = careerInfo;
  //   });
  // }

  // void updateClinicInfo(Map<String, String?> clinicInfo) {
  //   setState(() {
  //     this.clinicInfo = clinicInfo;
  //   });
  // }

  Future<void> addDoc(
    String uid,
    String? fullName,
    String gender,
    String phonenumber,
    String email,
    String password,
    String city,
    //Map? careerInfo,
    //Map? clinicInfo
  ) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      CollectionReference doctors = users.doc('BafSg4C1zRTGrDsan4lZDJdFxpt1').collection('doctors');
      await doctors.add({
        'full_name': fullName,
        'gender': gender,
        'phonenumber': phonenumber,
        'email': email,
        'password': password,
        'city': city,
        // 'career_info': careerInfo,
        //'clinicinfo': clinicInfo,
      });
      print("New doctor added successfully");
    } catch (e) {
      print("Failed to add new doctor: $e");
      // Handle the error appropriately
      if (e is FirebaseAuthException) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("The password provided is too weak."),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("The account already exists for that email."),
            ),
          );
        }
      } else if (e is FirebaseException) {
        if (e.code == 'permission-denied') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Permission denied while accessing Firestore."),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('An error occurred: $e'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign Up",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
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
                            " Start by creating your account.",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff858585),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          " Name",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff12306C)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        DefaultTextField(
                          onChange: (data) {
                            fullName = data;
                          },
                          controller: fullnamecontroller,
                          keyboardtype: TextInputType.name,
                          labletext: "Enter Your Full name",
                          fillcolor: Color.fromARGB(255, 229, 229, 229),
                          weight: double.infinity,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          " Gender",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff12306C)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        DefaultTextField(
                          onChange: (data) {
                            gender = data;
                          },
                          controller: gendercontroller,
                          keyboardtype: TextInputType.text,
                          labletext: "Enter your gender",
                          fillcolor: Color.fromARGB(255, 229, 229, 229),
                          weight: double.infinity,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          " Mobile Number",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff12306C)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        DefaultTextField(
                          onChange: (data) {
                            phonenumber = data;
                          },
                          controller: mobnumcontroller,
                          keyboardtype: TextInputType.phone,
                          labletext: "Enter Your Phone number",
                          fillcolor: Color.fromARGB(255, 229, 229, 229),
                          weight: double.infinity,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          " Email",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff12306C)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        DefaultTextField(
                          onChange: (data) {
                            email = data;
                          },
                          controller: emailController,
                          keyboardtype: TextInputType.emailAddress,
                          labletext: "Enter Your Email",
                          fillcolor: Color.fromARGB(255, 229, 229, 229),
                          weight: double.infinity,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          " Password",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff12306C)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        DefaultTextField(
                          onChange: (data) {
                            password = data;
                          },
                          controller: passwordController,
                          keyboardtype: TextInputType.emailAddress,
                          labletext: "••••••••",
                          fillcolor: Color.fromARGB(255, 229, 229, 229),
                          // suffixicon: Icons.visibility_off,
                          weight: double.infinity,
                          ispass: true,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          ' Must be at least 8 characters.',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff667084),
                          ),
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
                          onChange: (data) {
                            city = data;
                          },
                          controller: citycontroller,
                          keyboardtype: TextInputType.text,
                          labletext: "Enter Your City",
                          fillcolor: Color.fromARGB(255, 229, 229, 229),
                          weight: double.infinity,
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(15),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Container(
                  //         child: Text(
                  //           'Add Your Career Information',
                  //           style: TextStyle(
                  //             fontSize: 17,
                  //             fontWeight: FontWeight.bold,
                  //             color: Color(0xff12306c),
                  //           ),
                  //         ),
                  //       ),
                  //       IconButton(
                  //         icon: Icon(Icons.arrow_circle_right_rounded,
                  //             color: Colors.blue, size: 25),
                  //         onPressed: () async {
                  //           if (userId != null) {
                  //             final result = await Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                 builder: (context) => CareerInfo(
                  //                   onCareerInfoSaved: updateCareerInfo,
                  //                   userId: userId!,
                  //                 ),
                  //               ),
                  //             );
                  //             if (result != null) {
                  //               setState(() {
                  //                 careerInfo = result;
                  //               });
                  //             }
                  //           } else {
                  //             ScaffoldMessenger.of(context).showSnackBar(
                  //               SnackBar(
                  //                 content: Text(
                  //                     "An error occurred. Please try again later."),
                  //               ),
                  //             );
                  //           }
                  //         },
                  //         style: TextButton.styleFrom(),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(15),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Container(
                  //         child: Text(
                  //           'Clinic Information',
                  //           style: TextStyle(
                  //             fontSize: 17,
                  //             fontWeight: FontWeight.bold,
                  //             color: Color(0xff12306c),
                  //           ),
                  //         ),
                  //       ),
                  //       IconButton(
                  //         icon: Icon(Icons.arrow_circle_right_rounded,
                  //             color: Colors.blue, size: 25),
                  //         onPressed: () async {
                  //           if (userId != null) {
                  //             final result = await Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                 builder: (context) => ClinicInfo(
                  //                   onClinicInfoSaved: updateClinicInfo,
                  //                   userId: 'doctors',
                  //                 ),
                  //               ),
                  //             );
                  //             if (result != null) {
                  //               setState(() {
                  //                 clinicInfo = result;
                  //               });
                  //             }
                  //           } else {
                  //             ScaffoldMessenger.of(context).showSnackBar(
                  //               SnackBar(
                  //                 content: Text(
                  //                     "An error occurred. Please try again later."),
                  //               ),
                  //             );
                  //           }
                  //         },
                  //         style: TextButton.styleFrom(),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: InkWell(
                      onTap: () async {
                        try {
                          UserCredential user = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: email!, password: password!);
                          CollectionReference users =
                              FirebaseFirestore.instance.collection('doctors');

                          await addDoc(
                            user.user!.uid, fullName!,
                            gender!,
                            phonenumber!,
                            email!,
                            password!,
                            city!,
                            //careerInfo!,
                            //clinicInfo!
                          );
                          await CachHelper.setFirstName(userInfo: fullName);
                          await CachHelper.setEmail(userInfo: email);
                          await CachHelper.setPhone(userInfo:phonenumber);
                          // String DabishName = CachHelper.getFirstName();
                          // print(DabishName);R

                          var current_user =
                              await FirebaseAuth.instance.currentUser;

                          if (current_user != null) {
                            await current_user.updateDisplayName(fullName);
                          }

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home_Page()),
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code ==
                              'Password should be at least 6 characters') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Password should be at least 6 characters'),
                              ),
                            );
                          } else if (e.code ==
                              'The email address is already in use by another account.') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'The account already exists for that email.'),
                              ),
                            );
                          }
                        }
                      },
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xff0072F9)),
                        alignment: Alignment.center,
                        child: Text(
                          "Create account",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?  ",
                          style: TextStyle(
                              color: Color(0xff858585),
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()));
                          },
                          child: Text(
                            "Log in",
                            style: TextStyle(
                                color: Color(0xff0072F9),
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
