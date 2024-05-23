import 'dart:io';

import 'package:ability_link1/commentpage.dart';
import 'package:ability_link1/icon%20_save_button%20.dart';
import 'package:ability_link1/icon_favorite_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UserPosts extends StatefulWidget {
  UserPosts(
    this.name,
    this.formattedTime,
    this.title,
    this.isOnline,
    this.postId,
    this.imageUrl,
  );
  final String name;
  final String formattedTime;
  final String title;
  final bool isOnline;
  final String postId;
  final String imageUrl;

  @override
  _UserPostsState createState() => _UserPostsState();
}

class _UserPostsState extends State<UserPosts> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });

      var storage = firebase_storage.FirebaseStorage.instance;

      var storageRef = storage
          .ref()
          .child('post_img/${DateTime.now().millisecondsSinceEpoch}');

      var uploadTask = storageRef.putFile(_image!);

      await uploadTask.whenComplete(() => print('File Uploaded'));

      String downloadURL = await storageRef.getDownloadURL();

      await FirebaseFirestore.instance
          .collection('posts')
          .doc(widget.postId)
          .set({
        'name': widget.name,
        'formattedTime': widget.formattedTime,
        'title': widget.title,
        'isOnline': widget.isOnline,
        'postImgUrl': downloadURL,
      });

      print('File URL: $downloadURL');
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 325,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          "assets/images/Group 9204.png",
                        ),
                        radius: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.formattedTime,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  widget.title,
                  style: TextStyle(color: Color(0xff667085)),
                ),
                const SizedBox(
                  width: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GestureDetector(
                    child: Container(
                      height: 185,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(30),
                        image: widget.imageUrl != null &&
                                widget.imageUrl.isNotEmpty
                            ? DecorationImage(
                                image: NetworkImage(widget.imageUrl),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: widget.imageUrl == null || widget.imageUrl.isEmpty
                          ? Center(
                              child: Icon(
                                Icons.add_photo_alternate,
                                size: 40,
                                color: Colors.grey,
                              ),
                            )
                          : null,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 40.0, top: 10, bottom: 0, right: 40),
                  child: Row(
                    children: [
                      icon_favorite(),
                      SizedBox(
                        width: 30,
                      ),
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.comment,
                          color: Colors.grey,
                        ),
                        onPressed: () => _navigateToCommentPage(context),
                      ),
                      Text('472'),
                      SizedBox(
                        width: 40,
                      ),
                      icon_saved(),
                      SizedBox(
                        width: 30,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.share,
                          color: Color(0xff667085),
                          size: 20.0,
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Color(0xff667085),
                  thickness: 1.0,
                  height: 0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToCommentPage(BuildContext context) async {
    DocumentSnapshot postSnapshot = await FirebaseFirestore.instance
        .collection('posts')
        .doc(widget.postId)
        .get();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => comment_page(postId: postSnapshot.id),
      ),
    );
  }
}
