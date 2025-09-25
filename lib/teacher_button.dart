import 'package:tns_tablet/constants.dart';
import 'package:tns_tablet/teacher.dart';
import 'package:tns_tablet/teacher_info.dart';
import 'package:flutter/material.dart';

class TeacherButton extends StatefulWidget {
  final Teacher? teacher;
  final Availability initialAvailability;

  TeacherButton({this.teacher, this.initialAvailability = Availability.absent});

  @override
  TeacherButtonState createState() => TeacherButtonState();
}

class TeacherButtonState extends State<TeacherButton> with AutomaticKeepAliveClientMixin {
  Availability availability = Availability.inClass;

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

    final bool isAvailable = availability == Availability.available;

    final teacher = widget.teacher;
    final Color textColor             = isAvailable ? availableTextColor : unavailableTextColor;
    final Color availabilityTextColor = isAvailable ? availableAvailabilityTextColor : unavailableAvailabilityTextColor;
    final double opacity              = isAvailable ? 1 : opacityUnavailable;

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
          child: AnimatedContainer(
            duration: Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            child:thing
          ),
        )
      )
    );
  }
}
