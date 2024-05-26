import 'package:ability_link1/User_select.dart';
import 'package:ability_link1/default%20text%20field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ability_link1/bottomnavigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/cache/cache_helper.dart';




class SignIn extends StatelessWidget {
  SignIn();
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Log In",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            // color: Color(0xff47bef1),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      " Welcome back! \n Please enter your details.",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff858585),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      " Email",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff12306C)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DefaultTextField(
                      controller: emailController,
                      keyboardtype: TextInputType.emailAddress,
                      labletext: "Enter Your Email",
                      fillcolor: Color.fromARGB(255, 229, 229, 229),
                      weight: double.infinity,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      " Password",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff12306C)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DefaultTextField(
                      controller: passwordController,
                      keyboardtype: TextInputType.emailAddress,
                      labletext: "••••••••",
                      fillcolor: Color.fromARGB(255, 229, 229, 229),
                      suffixicon: Icons.visibility_off,
                      weight: double.infinity,
                      ispass: true,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Forget password?",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Colors.black),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: InkWell(
                  onTap: () async {
                    final String email = emailController.text;
                    final String password = passwordController.text;
                    try {
                      final UserCredential userCredential =
                          await _auth.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      

                      final User? user = userCredential.user;
                      print('Signed in as ${user?.email}');
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Bottom_navy()));
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                      } else {
                        print('Error: ${e.code}');
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
                      "Sign in",
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
                height: 32,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account? ",
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
                                builder: (context) => UserSelect()));
                      },
                      child: Text(
                        "sign up",
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
          ),
        ),
      ),
    );
  }
}
