import 'dart:io';
import 'package:ability_link1/bottomnavigation.dart';
import 'package:ability_link1/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

Future<bool> doesPostExist(String userId, String postText) async {
  QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
      .instance
      .collection('posts')
      .where('user_id', isEqualTo: userId)
      .where('post_text', isEqualTo: postText)
      .get();

  return querySnapshot.docs.isNotEmpty;
}

class CreateBox extends StatefulWidget {
  const CreateBox(
      {Key? key,
      required Future<bool> Function(String userId, String postText)
          doesPostExist})
      : super(key: key);

  @override
  _CreateBoxState createState() => _CreateBoxState();
}

class _CreateBoxState extends State<CreateBox> {
  String? _image;
 TextEditingController postTextController = TextEditingController();
  Future<String?> _uploadImage() async {
    try {
      final FirebaseStorageUtils _firebaseStorageUtils = FirebaseStorageUtils();
      final headerImagePath = await _firebaseStorageUtils.uploadImage(
        path: 'imageurl/${DateTime.now().toString()}',
        file: File(_image!),
      );

      return headerImagePath;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Text(
                      'CreatePost',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                    Spacer(),
                    Container(
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.blue),
                        ),
                        onPressed: () async {
                          var current_user =
                              await FirebaseAuth.instance.currentUser;
                          Timestamp currentTime = Timestamp.now();

                          bool postExists = await doesPostExist(
                              current_user!.uid, postTextController.text);

                          if (!postExists) {
                           
                            if (_image != null) {
                              print(_image.toString());
                              final imageurl = await _uploadImage();
                              FirebaseFirestore.instance
                                  .collection('posts')
                                  .doc()
                                  .set({
                                'username': current_user.email,
                                'post_text': postTextController.text,
                                'user_id': current_user.uid,
                                'timestamp': currentTime,
                                'image_url': imageurl,
                              });
                            }
                            postTextController.clear();

                          } 
                          
                          else {
                            print('Post already exists.');
                          }


                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Bottom_navy(),
                          ));
                        },
                        child: Text(
                          'Post',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 0,
                  bottom: 0,
                ),
                child: TextField(
                  controller: postTextController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "What is in your head!....",
                    fillColor: Color.fromARGB(255, 239, 244, 246),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  maxLines: null,
                  minLines: 5,
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      Text(
                        'ShareContent',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () async {
                              // FilePickerResult? result =
                              //     await FilePicker.platform.pickFiles(
                              //   type: FileType.image,
                              // );
                              // if (result != null) {
                              //   setState(() {
                              //     _image = File(result.files.single.path!;
                              //   });
                              // } else {
                              //   print('User canceled the file picker');
                              // }
                            },
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.blue,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Camera',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () async {
                              final result =
                                  await ImagePicker().pickImage(
                                source: ImageSource.gallery,
                              );
                              if (result != null) {
                                setState(() {
                                  _image = result.path;
                                });
                              } else {
                                print('User canceled the file picker');
                              }
                            },
                            icon: Icon(
                              Icons.photo_album_outlined,
                              color: Colors.blue,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Media',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ],
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
