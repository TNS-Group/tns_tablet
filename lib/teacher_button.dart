import 'package:cool_app/constants.dart';
import 'package:cool_app/teacher.dart';
import 'package:cool_app/teacher_info.dart';
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
  final Availability initialAvailability;

  TeacherButton({this.teacher, this.initialAvailability = Availability.absent});

  @override
  TeacherButtonState createState() => TeacherButtonState();
}

class TeacherButtonState extends State<TeacherButton> with AutomaticKeepAliveClientMixin {
  Availability availability = Availability.notAvailable;

  @override
  void initState() {
    super.initState();
    availability = widget.initialAvailability;
  }

  @override
  bool get wantKeepAlive => true;

  void changeAvailability(Availability availability) {
    this.availability = availability;
  }

  void _onButtonTap(BuildContext context) {
    // Debug Purposes
    // setState(() {
    //   availability = (availability == Availability.notAvailable) ? Availability.available : Availability.notAvailable;
    // });

    showModalBottomSheet(
      context: context, 
      isScrollControlled: false,
      constraints: BoxConstraints(
        maxWidth: double.infinity
      ),
      builder: (ctx) => TeacherInfoMenu(availability, teacher: widget.teacher,)
    );
  }

  @override 
  Widget build(BuildContext context) {
    super.build(context);

    final teacher = widget.teacher;
    // Color widgetColor = availableBGColor;
    Color textColor = availableTextColor;
    Color availabilityTextColor = availableAvailabilityTextColor;
    double opacity = 1;

    final bool isAvailable = availability == Availability.available;

    if (!isAvailable) {
      // widgetColor = unavailableBGColor;
      textColor = unavailableTextColor;
      availabilityTextColor = unavailableAvailabilityTextColor;
      opacity = opacityUnavailable;
    }

    Widget thing = Stack(
      fit: StackFit.expand,
      children: [
        Container(
          color: Colors.white
        ),
        Opacity(
          opacity: opacity,
          child: Positioned.fill(
            child: Image(
              image: AssetImage('assets/${widget.teacher?.id}.jpg'),
              fit: BoxFit.cover
            )
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: (isAvailable) ? imageGradientAvailable : imageGradientUnavailable
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Spacer(),
              Text('${teacher?.name}', textScaler: TextScaler.linear(phi), style: TextStyle(color: textColor),),
              Text(availability.label, style: TextStyle(color: availabilityTextColor, fontWeight: FontWeight.bold)),
            ],
          )
        )
      ],
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(64), blurRadius: 8, )
        ] 
      ),
      child: InkWell(
        onTap: () => _onButtonTap(context),
        borderRadius: BorderRadius.circular(16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: thing,
        )
      )
    );

    // Keeping old code for documentation purposes lol
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