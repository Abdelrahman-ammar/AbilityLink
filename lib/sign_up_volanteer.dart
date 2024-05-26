import 'package:ability_link1/SignIn.dart';
import 'package:ability_link1/cache/cache_helper.dart';
import 'package:ability_link1/default%20text%20field.dart';
import 'package:ability_link1/home_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpVolan extends StatelessWidget {
  String? fullName;
  //String? gender;
  String? phonemunber;
  String? email;
  // String? government;
  String? password;

  SignUpVolan();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var fullnamecontroller = TextEditingController();
  var mobnumcontroller = TextEditingController();

 Future<void> addVolun(String uid, String fullName, String phoneNumber) async {
  try {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    CollectionReference volunteers = users.doc(uid).collection('volunteer');
    await volunteers.add({
      'full_name': fullName,
      'phone_number': phoneNumber,
    });
    print("New volunteer added");
  } catch (e) {
    print("Failed to add new volunteer: $e");
    throw e; // rethrow the error for better error handling
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
                        Container(
                          width: 396,
                          height: 81,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Align(
                                  child: SizedBox(
                                    child: Text(
                                      'Gender',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        height: 1.25,
                                        color: Color(0xff12306c),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 20,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(14, 10, 14, 10),
                                  width: 396,
                                  height: 64,
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x0c101828),
                                        offset: Offset(0, 1),
                                        blurRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // buttonvnX (21:2796)
                                        margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                                        width: 160,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Container(
                                          // buttonbase4tj (I21:2796;1040:10)
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color(0xed0072f8)),
                                            color: Color(0xed0072f8),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0x0c101828),
                                                offset: Offset(0, 1),
                                                blurRadius: 1,
                                              ),
                                            ],
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Male',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                height: 1.5,
                                                color: Color(0xffffffff),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // buttonbaseXXR (21:2797)
                                        width: 160,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xed0072f8)),
                                          color: Color(0xed0072f8),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x0c101828),
                                              offset: Offset(0, 1),
                                              blurRadius: 1,
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Female',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              height: 1.5,
                                              color: Color(0xffffffff),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                            phonemunber = data;
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
                            'Wrire your Government',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff12306c),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add_circle, color: Colors.blue),
                          onPressed: () {},
                          style: TextButton.styleFrom(),
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
                              .collection('volunteers');
                          await addVolun(user.user!.uid, fullName!, phonemunber!);

                          await CachHelper.setFirstName(userInfo: fullName);
                          await CachHelper.setEmail(userInfo: email);
                          await CachHelper.setPhone(userInfo:phonemunber);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Home_Page()), 
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
