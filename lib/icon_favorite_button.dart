import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class icon_favorite extends StatefulWidget {
  @override
  State<icon_favorite> createState() {
    return _iconfavorite();
  }
}

class _iconfavorite extends State<icon_favorite> {
  @override
  Widget build(BuildContext context) {
    // int _favoritecount = 0;

    return LikeButton(
      likeBuilder: (bool isLiked) {
        return Icon(
          Icons.favorite_border,
          color: isLiked ? Colors.red : Colors.grey,
        );
      },
      likeCount: 99,
      countBuilder: (int? count, isLiked, text) {
        var color = isLiked ? Colors.red : Colors.grey;
        Widget result;
        if (count == 0) {
          result = Text(
            "love",
            style: TextStyle(color: color),
          );
        } else {
          result = Text(
            text,
            style: TextStyle(color: color),
          );
          return result;
        }
      },
    );
  }
}
