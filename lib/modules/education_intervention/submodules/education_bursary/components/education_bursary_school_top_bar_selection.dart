import 'package:flutter/material.dart';

class EducationBursarySchoolTopBarSelection extends StatelessWidget {
  final VoidCallback selectSchoolPerformance;
  final VoidCallback selectSchoolAttendance;
  final bool isSchoolPerformanceSelected;

  EducationBursarySchoolTopBarSelection(
      {required this.selectSchoolPerformance,
      required this.selectSchoolAttendance,
      required this.isSchoolPerformanceSelected});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.only(),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        child: Container(
          decoration: BoxDecoration(color: Colors.black12),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: !isSchoolPerformanceSelected
                        ? Color(0xFF009688)
                        : Colors.transparent,
                    padding: EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 5.0,
                    ),
                  ),
                  onPressed: selectSchoolAttendance,
                  child: Text(
                    'Attendance',
                    style: TextStyle().copyWith(
                      fontSize: 14.0,
                      color: !isSchoolPerformanceSelected
                          ? Colors.white
                          : Color(0xFF737373),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: isSchoolPerformanceSelected
                        ? Color(0xFF009688)
                        : Colors.transparent,
                    padding: EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 5.0,
                    ),
                  ),
                  onPressed: selectSchoolPerformance,
                  child: Text(
                    'Performance',
                    style: TextStyle().copyWith(
                      fontSize: 14.0,
                      color: isSchoolPerformanceSelected
                          ? Colors.white
                          : Color(0xFF737373),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
