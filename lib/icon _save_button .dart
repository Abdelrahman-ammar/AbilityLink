import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class icon_saved extends StatefulWidget {
  @override
  State<icon_saved> createState() {
    return _iconsaved();
  }
}

class _iconsaved extends State<icon_saved> {
  @override
  Widget build(BuildContext context) {
    return LikeButton(
      likeBuilder: (bool isLiked) {
        return Icon(
          Icons.bookmark,
          color: isLiked ? Colors.blueAccent : Colors.grey,
        );
      },
      /* likeCount: 99,
      countBuilder: (int? count, isLiked, text) {
        var color = isLiked ? Colors.blueAccent : Colors.grey;
        Widget result;
        if (count == 0) {
          result = Text(
            "saved",
            style: TextStyle(color: color),
          );
        } else {
          result = Text(
            text,
            style: TextStyle(color: color),
          );
          return result;
        }
      },*/
    );
  }
}
