import 'package:flutter/material.dart';

class OvcMonitoringTopBarSelection extends StatelessWidget {
  final VoidCallback onSelectSchoolMonitoring;
  final VoidCallback onSelectServiceMonitoring;
  final bool isClicked;

  OvcMonitoringTopBarSelection(
      {required this.onSelectSchoolMonitoring,
      required this.onSelectServiceMonitoring,
      this.isClicked = false});

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
                    backgroundColor:
                        !isClicked ? Color(0xFF4B9F46) : Colors.transparent,
                    padding: EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 5.0,
                    ),
                  ),
                  onPressed: onSelectServiceMonitoring,
                  child: Text(
                    'Service',
                    style: TextStyle().copyWith(
                      fontSize: 14.0,
                      color: !isClicked ? Colors.white : Color(0xFF1A3518),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isClicked ? Color(0xFF4B9F46) : Colors.transparent,
                    padding: EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 5.0,
                    ),
                  ),
                  onPressed: onSelectSchoolMonitoring,
                  child: Text(
                    'School',
                    style: TextStyle().copyWith(
                      fontSize: 14.0,
                      color: isClicked ? Colors.white : Color(0xFF1A3518),
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
