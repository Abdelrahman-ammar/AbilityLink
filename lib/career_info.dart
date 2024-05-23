import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CareerInfo extends StatefulWidget {
  final Function(Map<String, String?>) onCareerInfoSaved;
  final String userId; // Add userId as a parameter

  CareerInfo({required this.onCareerInfoSaved, required this.userId}); // Pass userId to the constructor

  @override
  _CareerInfoState createState() => _CareerInfoState();
}

class _CareerInfoState extends State<CareerInfo> {
  String? jobTitle;
  String? deptName;
  String? expYears;
  var jobController = TextEditingController();
  var yearsController = TextEditingController();
  var departmentController = TextEditingController();

  // Add a comment for clarity
  // Function to add career info to Firestore
  Future<void> addDoc(
      CollectionReference users, String userId, String jobTitle,
      String deptName, String expYears) async {
    try {
      // Access Firestore and set career info
      await FirebaseFirestore.instance
          .collection('users')
          .doc('BafSg4C1zRTGrDsan4lZDJdFxpt1')
          .collection('doctors')
          .doc(userId)
          .set({
        'job_title': jobTitle,
        'dept_name': deptName,
        'exp_years': expYears,
      });
      print("Career info added successfully");
    } catch (e) {
      print("Failed to add career info: $e");
      // Handle the error appropriately
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to add career info: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Career Information",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
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
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        " Add your Career Information", // Corrected typo
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff858585),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Edit comments for clarity
                    // Text field for job title
                    TextField(
                      controller: jobController,
                      onChanged: (data) => setState(() => jobTitle = data),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Job Title",
                        fillColor: Color.fromARGB(255, 229, 229, 229),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Text field for department name
                    TextField(
                      controller: departmentController,
                      onChanged: (data) => setState(() => deptName = data),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Department Name",
                        fillColor: Color.fromARGB(255, 229, 229, 229),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Text field for experience years
                    TextField(
                      controller: yearsController,
                      onChanged: (data) => setState(() => expYears = data),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Experience Years",
                        fillColor: Color.fromARGB(255, 229, 229, 229),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              // Button to save career info
              Padding(
                padding: const EdgeInsets.all(15),
                child: InkWell(
                  onTap: () async {
                    // Get current user ID
                    final userId = FirebaseAuth.instance.currentUser!.uid;
                    // Call addDoc to save career info to Firestore
                    await addDoc(
                        FirebaseFirestore.instance.collection('doctors'),
                        userId,
                        jobTitle!,
                        deptName!,
                        expYears!);

                    // Create careerInfo map to pass back to parent page
                    final careerInfo = {
                      'jobTitle': jobTitle,
                      'deptName': deptName,
                      'expYears': expYears,
                    };
                    // Call the callback function provided by the parent page
                    // with the career information
                    widget.onCareerInfoSaved(careerInfo);

                    // Navigate back to the previous page
                    Navigator.pop(context);
                  },
                  // Button UI
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
          ),
        ),
      ),
    );
  }
}
