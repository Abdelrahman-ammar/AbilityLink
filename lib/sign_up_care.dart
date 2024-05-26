import 'package:ability_link1/SignIn.dart';
import 'package:ability_link1/cache/cache_helper.dart';
import 'package:ability_link1/default%20text%20field.dart';
import 'package:ability_link1/home_page.dart';
import 'package:ability_link1/search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpCare extends StatelessWidget {
  String? fullName;
  String? gender;
  String? phonenumber;
  String? email;
  String? password;
  String? city;

  //String? government;

  SignUpCare();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var fullnamecontroller = TextEditingController();
  var mobnumcontroller = TextEditingController();
  var gendercontroller = TextEditingController();
  var citycontroller = TextEditingController();

  Future<void> addcare(
      CollectionReference users,
      String uid,
      String fullName,
      String gender,
      String phonenumber,
      String email,
      String password,
      String city) async{
    // Call the user's CollectionReference to add a new user
    //return users
     await FirebaseFirestore.instance
          .collection('users') 
         .doc('2mSUVmslMgRePZsqn03pYPjkUKJ3') // Use the specified document ID
        .collection('caregivers') // Access the 'caregivers' subcollection
        .doc(uid) // Use uid as the document ID within the subcollection
        .set({
          'full_name': fullName,
          'gender': gender,
          'phonenumber': phonenumber,
          'email': email,
          'password': password,
          'city': city
        })
        .then((value) => print("new caregiver Added"))
        .catchError((error) => print("Failed to add new caregiver: $error"));
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
                          // suffixicon: ,
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
                          // suffixicon: ,
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
                          // suffixicon: ,
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
                          // suffixicon: ,
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
                        SizedBox(
                          height: 10,
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
                        try {
                          UserCredential user = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: email!, password: password!);
                          CollectionReference users = FirebaseFirestore.instance
                              .collection('caregivers');
                          await addcare(users, user.user!.uid, fullName!,
                              gender!, phonenumber!, email!, password!, city!);
                          
                          await CachHelper.setFirstName(userInfo: fullName);
                          await CachHelper.setEmail(userInfo: email);
                          await CachHelper.setPhone(userInfo:phonenumber);


                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const Home_Page()), // Replace HomePage with your actual homepage widget
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
                                builder: (context) => SignIn(),
                              ),
                            );
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
