import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Drop_Down extends StatefulWidget {
  Drop_Down({Key? key}) : super(key: key);

  @override
  State<Drop_Down> createState() {
    return _dropdownstate();
  }
}

class _dropdownstate extends State<Drop_Down> {
  String dropdownvalue = 'select';
  var items = ['select', 'item1', 'item2', 'item3', 'item4'];
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 110,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: DropdownButtonHideUnderline(
            child: DropdownButton(
                value: dropdownvalue,
                icon: Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(items),
                    ),
                  );
                }).toList(),
                onChanged: (String? newvalue) {
                  setState(() {
                    dropdownvalue = newvalue!;
                  });
                })));
  }
}
