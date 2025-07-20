import 'package:cool_app/constants.dart';
import 'package:cool_app/teacher.dart';
import 'package:cool_app/teacher_button.dart';
import 'package:flutter/material.dart';

class TeacherInfoMenu extends StatelessWidget {
  final Teacher? teacher;
  final Availability availability;

  TeacherInfoMenu(this.availability, {super.key, this.teacher}); 

  @override
  Widget build(BuildContext context) {
    final bool canNotify = availability == Availability.available;
    VoidCallback? onNotfiyButtonPressed = canNotify ? () {
      print('ping!');
    } : null;

    Widget notifyButton = FilledButton(
      onPressed: onNotfiyButtonPressed, 
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        child: Text("${canNotify ? 'Notify' : 'Cannot notify'} ${teacher?.name}")
      ,) 
    );

    List<Widget> columnList = [
      Text("${teacher?.name}", textScaler: TextScaler.linear(phi), style: TextStyle(fontWeight: FontWeight.bold),),
    ];

    if (teacher?.advisory != null) columnList.add(Text("Advisor of ${teacher?.advisory}"));
    if (teacher?.subject != null) columnList.add(Text("Teaches ${teacher?.subject}"));

    return Container(
      width: 600,
      // margin: EdgeInsets.symmetric(horizontal: 32),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image(
                    image: AssetImage("assets/${teacher?.id}.jpg"),
                    fit: BoxFit.cover,
                  )
                )
              ,),
              SizedBox(width: 16,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: columnList,
              )
            ],
          ),
          SizedBox(height: 16,),
          notifyButton
        ]
      )
    ); 
  }
}