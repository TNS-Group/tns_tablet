import 'package:cool_app/teacher.dart';
import 'package:cool_app/teacher_button.dart';
import 'package:flutter/material.dart';

var teachers = [
  KeepAlive(keepAlive: true, child: TeacherButton(teacher: Teacher('DAZ001', 'Aidan Ocmer'))),
  KeepAlive(keepAlive: true, child: TeacherButton(teacher: Teacher('DAZ002', 'Bidan Ocmer'))),
  KeepAlive(keepAlive: true, child: TeacherButton(teacher: Teacher('DAZ003', 'Cidan Ocmer'))),
  KeepAlive(keepAlive: true, child: TeacherButton(teacher: Teacher('DAZ004', 'Didan Ocmer'))),
  KeepAlive(keepAlive: true, child: TeacherButton(teacher: Teacher('DAZ005', 'Eidan Ocmer'))),
  KeepAlive(keepAlive: true, child: TeacherButton(teacher: Teacher('DAZ006', 'Fidan Ocmer'))),
  KeepAlive(keepAlive: true, child: TeacherButton(teacher: Teacher('DAZ007', 'Gidan Ocmer'))),
  KeepAlive(keepAlive: true, child: TeacherButton(teacher: Teacher('DAZ010', 'Hidan Ocmer'))),
  KeepAlive(keepAlive: true, child: TeacherButton(teacher: Teacher('DAZ011', 'Iidan Ocmer'))),
  KeepAlive(keepAlive: true, child: TeacherButton(teacher: Teacher('DAZ012', 'Jidan Ocmer'))),
  KeepAlive(keepAlive: true, child: TeacherButton(teacher: Teacher('DAZ013', 'Kidan Ocmer'))),
  KeepAlive(keepAlive: true, child: TeacherButton(teacher: Teacher('DAZ014', 'Lidan Ocmer'))),
];

void main() {
  runApp(TabletNotifierApp());
}

class TabletNotifierApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Root widget
      title: 'TSNS',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: TeacherListPage()
    );
  }
}

class TeacherListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Column(children: [
            const Text('Hello World'),
            FilledButton(onPressed: () => print('hi'), child: const Text('Notify Teacher')),
          ],),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.75,
              children: teachers,
            )
          )
          // Expanded(
          //   child: ListView(
          //     children: teachers,
          //   )
          // )
        ]
      )
    );
  }
}