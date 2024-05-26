import 'package:ability_link1/cache/cache_helper.dart';
import 'package:ability_link1/default text field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:your_project_name/cache_helper.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var fullnamecontroller = TextEditingController();
  var mobnumcontroller = TextEditingController();




Future<void> updateDoc(
    String? fullName,
    String gender,
    String phonenumber,
    
) async {
  try {
    // Get the email from SharedPreferences
    String email = CachHelper.getEmail();

    if (email.isNotEmpty) {
      CollectionReference users = FirebaseFirestore.instance.collection('users');
      CollectionReference doctors = users.doc('BafSg4C1zRTGrDsan4lZDJdFxpt1').collection('doctors');
      
      // Query to find the document by email
      QuerySnapshot querySnapshot = await doctors.where('email', isEqualTo: email).get();

      if (querySnapshot.docs.isNotEmpty) {
        // Assuming email is unique and there is only one document returned
        DocumentSnapshot doctorDoc = querySnapshot.docs.first;
        String docId = doctorDoc.id;

        // Update the document with the new information
        await doctors.doc(docId).update({
          'full_name': fullName,
          'gender': gender,
          'phonenumber': phonenumber,
          // 'career_info': careerInfo,
          //'clinicinfo': clinicInfo,
        });
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







  @override
  void initState() {
    super.initState();
    initializeControllers();
  }

  void initializeControllers() {
    fullnamecontroller.text = CachHelper.getFirstName();
    emailController.text = CachHelper.getEmail();
    mobnumcontroller.text = CachHelper.getPhone();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    fullnamecontroller.dispose();
    mobnumcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
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
                    Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: Text(
                        "Edit your profile information.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff858585),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      " Name",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff12306C),
                      ),
                    ),
                    SizedBox(height: 5),
                    DefaultTextField(
                      controller: fullnamecontroller,
                      keyboardtype: TextInputType.name,
                      labletext: "Name",
                      fillcolor: Color.fromARGB(255, 229, 229, 229),
                      suffixicon: Icons.edit,
                      weight: double.infinity,
                    ),
                    SizedBox(height: 10),
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                                    width: 160,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Color(0xed0072f8)),
                                        color: Color(0xed0072f8),
                                        borderRadius: BorderRadius.circular(8),
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
                                    width: 160,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Color(0xed0072f8)),
                                      color: Color(0xed0072f8),
                                      borderRadius: BorderRadius.circular(8),
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
                    SizedBox(height: 10),
                    Text(
                      " Mobile Number",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff12306C),
                      ),
                    ),
                    SizedBox(height: 5),
                    DefaultTextField(
                      controller: mobnumcontroller,
                      keyboardtype: TextInputType.phone,
                      labletext: "Mobile Number",
                      fillcolor: Color.fromARGB(255, 229, 229, 229),
                      suffixicon: Icons.edit,
                      weight: double.infinity,
                    ),
                    SizedBox(height: 10),
                    Text(
                      " Email",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff12306C),
                      ),
                    ),
                    SizedBox(height: 5),
                    DefaultTextField(
                      controller: emailController,
                      keyboardtype: TextInputType.emailAddress,
                      labletext: "Email",
                      fillcolor: Color.fromARGB(255, 229, 229, 229),
                      suffixicon: Icons.edit,
                      weight: double.infinity,
                    ),
                    SizedBox(height: 10),
                    Text(
                      " Password",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff12306C),
                      ),
                    ),
                    SizedBox(height: 5),
                    DefaultTextField(
                      controller: passwordController,
                      keyboardtype: TextInputType.emailAddress,
                      labletext: "••••••••",
                      fillcolor: Color.fromARGB(255, 229, 229, 229),
                      suffixicon: Icons.edit,
                      weight: double.infinity,
                      ispass: true,
                    ),
                    SizedBox(height: 5),
                    // Text(
                    //   ' Must be at least 8 characters.',
                    //   style: TextStyle(
                    //     fontSize: 14,
                    //     fontWeight: FontWeight.w400,
                    //     color: Color(0xff667084),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: InkWell(
                  onTap: () async {
                      try {
                      String? fullName = fullnamecontroller.text;
                      String gender = 'Male'; // Example value, you should get the actual value from your input
                      String phonenumber = mobnumcontroller.text;


                      await updateDoc(
                        fullName,
                        gender,
                        phonenumber,
                      );

                      await CachHelper.setFirstName(userInfo: fullName);
                      await CachHelper.setPhone(userInfo: phonenumber);
                      } catch(e){
                        print('Error updating profile: $e');
                      }
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff0072F9),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Save",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
