import 'package:cool_app/teacher.dart';
import 'package:cool_app/teacher_button.dart';
import 'package:flutter/material.dart';

var teachers = [
  // KeepAlive(keepAlive: true, child: TeacherButton(initialAvailability: Availability.available, teacher: Teacher('DAZ001', 'Mr. Aidan Ocmer', subject: 'PR2', advisory: 'St. Augustine of Hippo'))),
  KeepAlive(keepAlive: false, child: TeacherButton(initialAvailability: Availability.absent, teacher: Teacher('DAZ003', 'Ms. Sakuya Izayoi', advisory: 'Scarlet Devil Mansion'))),
  KeepAlive(keepAlive: false, child: TeacherButton(initialAvailability: Availability.available, teacher: Teacher('DAZ004', 'Ms. Reimu Hakurei', subject: 'Religion', advisory: 'Hakurei Shrine'))),
  KeepAlive(keepAlive: false, child: TeacherButton(initialAvailability: Availability.doNotDisturb, teacher: Teacher('DAZ005', 'Ms. Marisa Kirisame', subject: 'Magic Arts'))),
  KeepAlive(keepAlive: false, child: TeacherButton(initialAvailability: Availability.inClass, teacher: Teacher('DAZ006', 'Ms. Cirno', subject: 'Perfect Math'))),
  KeepAlive(keepAlive: false, child: TeacherButton(teacher: Teacher('DAZ007', 'Ms. Keine Kamishirasawa', advisory: 'Human Village', subject: 'History'))),
  KeepAlive(keepAlive: false, child: TeacherButton(initialAvailability: Availability.available, teacher: Teacher('DAZ008', 'Fumo Sanae Koyicha', subject: 'Religion', advisory: 'Moriya Shrone'))),
  KeepAlive(keepAlive: false, child: TeacherButton(teacher: Teacher('DAZ009', 'Ms. Reisen Inaba', subject: 'Arms 101', advisory: 'Eintei'))),
  KeepAlive(keepAlive: false, child: TeacherButton(teacher: Teacher('DAZ010', 'Yukkuri Reimu Hakurei'))),
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
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 0, 4, 255))
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Select Teacher'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary
        ),
        body: Expanded(
          child: GridView.count(
            padding: EdgeInsets.all(16),
            crossAxisCount: 4,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.618033989,
            children: teachers,
          )
        )
      )
    );
  }
}