import 'dart:io';
import 'package:ability_link1/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:ability_link1/commentpage.dart';
import 'package:ability_link1/icon_favorite_button.dart';
import 'package:ability_link1/userfortest.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UserPosts extends StatefulWidget {
  UserPosts(
    this.name, ///
    this.formattedTime,///
    this.title, ///
    this.isOnline, ///
    this.postId,
    this.imageUrl, ///
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
  int _likeCount = 0;
  int _commentCount = 0;
  bool _isLiked = false;
  bool saved = false;

  @override
  void initState() {
    super.initState();
    _fetchPostCounts();
    _checkUserLiked();
    _checkSaved();
  }

  Future<void> _fetchPostCounts() async {
    // Fetch like count
    var likeDoc = await FirebaseFirestore.instance
        .collection('posts')
        .doc(widget.postId)
        .collection('likes')
        .doc('likes_count')
        .get();
    setState(() {
      _likeCount = likeDoc.exists ? likeDoc['count'] : 0;
    });



    // Future<void> _fetchallPosts(){};

    // Fetch comment count
    var commentSnapshot = await FirebaseFirestore.instance
        .collection('posts')
        .doc(widget.postId)
        .collection('comments')
        .get();
    setState(() {
      _commentCount = commentSnapshot.docs.length;
    });
  }

  Future<void> _checkUserLiked() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      var likedDoc = await FirebaseFirestore.instance
          .collection('posts')
          .doc(widget.postId)
          .collection('likes')
          .doc(currentUser.uid)
          .get();
      setState(() {
        _isLiked = likedDoc.exists;
      });
    }
  }

  Future<void> _toggleLike() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      var likeDoc = FirebaseFirestore.instance
          .collection('posts')
          .doc(widget.postId)
          .collection('likes')
          .doc(currentUser.uid);

      if (_isLiked) {
        await likeDoc.delete();
        setState(() {
          _likeCount--;
          _isLiked = false;
        });
      } else {
        await likeDoc.set({'liked': true});
        setState(() {
          _likeCount++;
          _isLiked = true;
        });
      }
    }
  }

  Future<void> _checkSaved() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      var doc = await FirebaseFirestore.instance
          .collection('posts')
          .doc(widget.postId)
          .get();
      if (doc.exists) {
        setState(() {
          saved = doc['saved'] ?? false;
        });
      }
    }
  }

  void _toggleSave() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      var docRef = FirebaseFirestore.instance
          .collection('saved')
          .doc(currentUser.uid)
          .collection('user_saved_posts')
          .doc(widget.postId);
          print("${widget.postId}");


      await docRef.set({
        'name': CachHelper.getFirstName(), //the saved post only has the email
        'formattedTime': widget.formattedTime,
        'title': widget.title,
        'isOnline': widget.isOnline,
        'imageUrl': widget.imageUrl,
        'postId' : widget.postId,
      });
      setState(() {
        saved = true;
      });
    }
  }

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
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, bottom: 8, right: 20),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.title,
                      style: TextStyle(
                          color: Color(0xff667085),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GestureDetector(
                    child: Container(
                      height: 280,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(15),
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
                  padding: const EdgeInsets.only(
                    left: 35,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.solidHeart,
                          color: _isLiked ? Colors.red : Colors.grey,
                        ),
                        onPressed: _toggleLike,
                      ),
                      // SizedBox(
                      //   width: 0,
                      // ),
                      Text(
                        _likeCount.toString(),
                      ),
                      Spacer(),
                      // SizedBox(
                      //   width: 30,
                      // ),
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.comment,
                          color: Colors.grey,
                        ),
                        onPressed: () => _navigateToCommentPage(context),
                      ),
                      FutureBuilder(
                        future: FirebaseFirestore.instance
                            .collection('posts')
                            .doc(widget.postId)
                            .collection('comments')
                            .get(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          }
                          if (snapshot.hasError) {
                            return Text('Error');
                          }
                          return Text(snapshot.data!.docs.length.toString());
                        },
                      ),
                      // SizedBox(
                      //   width: 40,
                      // ),
                      Spacer(),
                      IconSaveButton(saved: saved, toggleSave: _toggleSave),
                      SizedBox(
                        width: 30,
                      ),
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

class IconSaveButton extends StatelessWidget {
  final bool saved;
  final VoidCallback toggleSave;

  IconSaveButton({required this.saved, required this.toggleSave});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        saved ? Icons.bookmark : Icons.bookmark_border,
        color: saved ? Colors.blue : Colors.grey,
      ),
      onPressed: toggleSave,
    );
  }
}
