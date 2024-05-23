import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class PickTime extends StatefulWidget {
  final Function(String, String) onTimeSelected;

  PickTime({required this.onTimeSelected});

  @override
  _PickTimeState createState() => _PickTimeState();
}

class _PickTimeState extends State<PickTime> {
  TextEditingController timefrominput = TextEditingController();
  TextEditingController timetoinput = TextEditingController();

  void saveEventInfo(String fromTime, String toTime) async {
    try {
      widget.onTimeSelected(fromTime, toTime);
      print('Time saved successfully');
    } catch (e) {
      print('Error saving time: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        width: 100,
        padding: EdgeInsets.only(top: 10, left: 10),
        height: 40,
        child: Center(
          child: TextField(
            controller: timefrominput,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: "From",
              labelStyle: TextStyle(color: Colors.grey[300]),
            ),
            readOnly: true,
            onTap: () async {
              TimeOfDay? pickedTime = await showTimePicker(
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.light(
                        primary: Colors.blue,
                        onPrimary: Colors.white,
                        onSurface: Colors.blueAccent,
                      ),
                    ),
                    child: child!,
                  );
                },
                initialTime: TimeOfDay.now(),
                context: context,
              );

              if (pickedTime != null) {
                String formattedTime =
                    pickedTime.format(context).replaceAll(':', '');
                setState(() {
                  timefrominput.text = pickedTime.format(context);
                });
                saveEventInfo(formattedTime, timetoinput.text);
              } else {
                print("Time is not selected");
              }
            },
          ),
        ),
      ),
      SizedBox(width: 100),
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        width: 100,
        padding: EdgeInsets.only(top: 10, left: 10),
        height: 40,
        child: Center(
          child: TextField(
            controller: timetoinput,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: "To",
              labelStyle: TextStyle(color: Colors.grey[300]),
            ),
            readOnly: true,
            onTap: () async {
              TimeOfDay? pickedTime = await showTimePicker(
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.light(
                        primary: Colors.blue,
                        onPrimary: Colors.white,
                        onSurface: Colors.blueAccent,
                      ),
                    ),
                    child: child!,
                  );
                },
                initialTime: TimeOfDay.now(),
                context: context,
              );

              if (pickedTime != null) {
                String formattedTime =
                    pickedTime.format(context).replaceAll(':', '');
                setState(() {
                  timetoinput.text = pickedTime.format(context);
                });
                saveEventInfo(timefrominput.text, formattedTime);
              } else {
                print("Time is not selected");
              }
            },
          ),
        ),
      ),
    ]);
  }
}
