import 'dart:convert';
import 'package:ability_link1/cache/cache_helper.dart';
import 'package:ability_link1/cache/customButton.dart';
import 'package:ability_link1/cache/passwordfield.dart';
import 'package:ability_link1/cache/show_snack_bar.dart';
import 'package:ability_link1/my_profile_menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'default_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email; // Add email parameter here

  const ResetPasswordScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  String? password, confirmPassword;
  final formKey = GlobalKey<FormState>();
  bool success = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Reset Password",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'RESET PASSWORD',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff1F5D6B),
                  fontFamily: 'Langar',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "New Password",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff12306C),
                ),
              ),
              const SizedBox(height: 5),
              PasswordField(
                      onChanged: (data) {
                        passwordController.text=data;
                      password = data;
                    },
                    hintText: 'New Password',
                    minLength: 6,
                    onValidate: (data) {
                      if (data == null || data.isEmpty) {
                        return 'Field is required';
                      }
                      // Add your custom password validation rules here
                      if (data.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }
                      if (!data.contains(RegExp(r'[A-Z]'))) {
                        return 'Password must contain at least one uppercase letter';
                      }
                      if (!data.contains(RegExp(r'[a-z]'))) {
                        return 'Password must contain at least one lowercase letter';
                      }
                      if (!data.contains(RegExp(r'[0-9]'))) {
                        return 'Password must contain at least one digit';
                      }
                      return null;
                    },
              ),
              const SizedBox(height: 10),
              const Text(
                "Confirm New Password",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff12306C),
                ),
              ),
              const SizedBox(height: 5),
              PasswordField(
                     onChanged: (data) {
                      confirmPasswordController.text = data;
                      confirmPassword =data;
                    },
                    hintText: 'Confirm New Password',
                    minLength: 6,
                    onValidate: (data) {
                      if (data == null || data.isEmpty) {
                        return 'Field is required';
                      }
                      if (data != password) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    if (passwordController.text == confirmPasswordController.text) {
                      try {
                        await resetPassword(passwordController.text);
                        if (success) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyProfile(),
                            ),
                          );
                        }
                      } catch (ex) {
                        print(ex.toString());
                        showSnackBar(context, 'Failed to change password');
                      }
                    } else {
                      showSnackBar(context, 'Passwords do not match');
                    }
                  }
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xff0072F9),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "CHANGE PASSWORD",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> resetPassword(String password) async {
    try {
      print(password);
      String emaill = CachHelper.getEmail();

      if (emaill.isNotEmpty) {
        CollectionReference users = FirebaseFirestore.instance.collection('users');
        CollectionReference doctors = users.doc('BafSg4C1zRTGrDsan4lZDJdFxpt1').collection('doctors');
        
        // Query to find the document by email
        QuerySnapshot querySnapshot = await doctors.where('email', isEqualTo: emaill).get();
        if (querySnapshot.docs.isNotEmpty) {
          // Assuming email is unique and there is only one document returned
          DocumentSnapshot doctorDoc = querySnapshot.docs.first;
          String docId = doctorDoc.id;

          // Update the document with the new information
          await doctors.doc(docId).update({
            'password': password,
          });
          success = true;
        } else {
          print('No doctor found with this email.');
        }
      } else {
        print('Email is empty.');
      }
    } catch (e) {
      print('Error updating doctor information: $e');
    }
  }
}