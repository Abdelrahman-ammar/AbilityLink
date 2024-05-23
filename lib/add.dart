import 'package:flutter/material.dart';
import 'package:ability_link1/creating_box.dart';

class add_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Scaffold(body: CreateBox(doesPostExist: doesPostExist));
}
