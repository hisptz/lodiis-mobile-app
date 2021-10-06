import 'package:flutter/material.dart';

class EducationBursarySchoolAttendance extends StatefulWidget {
  const EducationBursarySchoolAttendance({Key? key}) : super(key: key);

  @override
  _EducationBursarySchoolAttendanceState createState() =>
      _EducationBursarySchoolAttendanceState();
}

class _EducationBursarySchoolAttendanceState
    extends State<EducationBursarySchoolAttendance> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('School Attendance')),
    );
  }
}
