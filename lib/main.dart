import 'package:cool_app/teacher.dart';
import 'package:cool_app/teacher_button.dart';
import 'package:flutter/material.dart';

var teachers = [
  KeepAlive(keepAlive: true, child: TeacherButton(teacher: Teacher('DAZ001', 'Mr. Aidan Ocmer', subject: 'PR2', advisory: 'St. Augustine of Hippo'))),
  KeepAlive(keepAlive: true, child: TeacherButton(teacher: Teacher('DAZ002', 'Bidan Ocmer'))),
  KeepAlive(keepAlive: true, child: TeacherButton(teacher: Teacher('DAZ002', 'Cidan Ocmer'))),
  KeepAlive(keepAlive: true, child: TeacherButton(teacher: Teacher('DAZ002', 'Didan Ocmer'))),
  KeepAlive(keepAlive: true, child: TeacherButton(teacher: Teacher('DAZ002', 'Eidan Ocmer'))),
  KeepAlive(keepAlive: true, child: TeacherButton(teacher: Teacher('DAZ002', 'Fidan Ocmer'))),
  KeepAlive(keepAlive: true, child: TeacherButton(teacher: Teacher('DAZ002', 'Gidan Ocmer'))),
  KeepAlive(keepAlive: true, child: TeacherButton(teacher: Teacher('DAZ002', 'Hidan Ocmer'))),
  KeepAlive(keepAlive: true, child: TeacherButton(teacher: Teacher('DAZ002', 'Iidan Ocmer'))),
  KeepAlive(keepAlive: true, child: TeacherButton(teacher: Teacher('DAZ002', 'Jidan Ocmer'))),
  KeepAlive(keepAlive: true, child: TeacherButton(teacher: Teacher('DAZ002', 'Kidan Ocmer'))),
  KeepAlive(keepAlive: true, child: TeacherButton(teacher: Teacher('DAZ002', 'Lidan Ocmer'))),
];

void main() {
  runApp(TabletNotifierApp());
}

class TabletNotifierApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeacherListPage();
  }
}

class TeacherListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TSNS',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Select Teacher'),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.75,
              children: teachers,
            )
          )
        )
      )
    );
  }
}