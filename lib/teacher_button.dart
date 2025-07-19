import 'package:cool_app/constants.dart';
import 'package:cool_app/teacher.dart';
import 'package:flutter/material.dart';

enum Availability {
  available,
  doNotDisturb,
  notAvailable,
  absent
}

extension AvailabilityExtension on Availability {
  String get label {
    switch (this) {
      case Availability.available:
        return 'Available';
      case Availability.doNotDisturb:
        return 'Do Not Disturb';
      case Availability.notAvailable:
        return 'Not Available';
      case Availability.absent:
        return 'Absent';
    }
  }
}

class TeacherButton extends StatefulWidget {
  final Teacher? teacher;

  TeacherButton({this.teacher});

  @override
  TeacherButtonState createState() => TeacherButtonState();
}

class TeacherButtonState extends State<TeacherButton> with AutomaticKeepAliveClientMixin {
  Availability availability = Availability.notAvailable;

  @override
  bool get wantKeepAlive => true;

  void changeAvailability(Availability availability) {
    this.availability = availability;
  }

  @override 
  Widget build(BuildContext context) {
    super.build(context);

    final teacher = widget.teacher;
    Color widgetColor = availableBGColor;
    Color textColor = availableTextColor;
    double opacity = 1;

    if (availability == Availability.absent || 
        availability == Availability.doNotDisturb || 
        availability == Availability.notAvailable
    ) {
      widgetColor = unavailableBGColor;
      textColor = unavailableTextColor;
      opacity = opacityUnavailable;
    }

    Widget thing = Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child:Image(
            image: AssetImage('assets/ProfilePlaceholder.jpg'),
            fit: BoxFit.cover
          )
        ),
        Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: <Color>[
                Colors.black.withAlpha(128), 
                Colors.black.withAlpha(0), 
                Colors.black.withAlpha(0), 
              ]
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Text('${teacher?.name}', textScaler: TextScaler.linear(phi), style: TextStyle(color: textColor),),
              Text(availability.label, style: TextStyle(color: textColor)),
            ],
          )
        )
      ],
    );

    return Opacity(
      opacity: opacity,
      // margin: EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          setState(() {
            availability = (availability == Availability.notAvailable) ? Availability.available : Availability.notAvailable;
          });
        },
        borderRadius: BorderRadius.circular(16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            decoration: BoxDecoration(
              color: widgetColor,
              borderRadius: BorderRadius.circular(16)
            ),
            child: thing,
          )
        )
      )
    );

    // return Container(
    //   margin: EdgeInsets.symmetric(vertical: 8),
    //   child: InkWell(
    //     onTap: () {
    //       setState(() {
    //         availability = (availability == Availability.notAvailable) ? Availability.available : Availability.notAvailable;
    //       });
    //     },
    //     borderRadius: BorderRadius.circular(16),
    //     child: ClipRRect(
    //       borderRadius: BorderRadius.circular(16),
    //       child: Container(
    //         decoration: BoxDecoration(
    //           color: widgetColor,
    //           borderRadius: BorderRadius.circular(16)
    //         ),
    //         child: Row(
    //           children: [
    //             Image(
    //               image: AssetImage('assets/ProfilePlaceholder.jpg'),
    //               width: 128,
    //               height: 128,
    //             ),
    //             SizedBox(width: 16,),
    //             Text('${teacher?.name}', textScaler: TextScaler.linear(phi)),
    //             Spacer(),
    //             Text(availability.label),
    //             SizedBox(width: 16,),
    //           ],
    //         ),
    //       )
    //     )
    //   )
    // );
  }
}