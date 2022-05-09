import 'package:flutter/material.dart';

class EducationBursarySchoolTopBarSelection extends StatelessWidget {
  final VoidCallback selectSchoolPerformance;
  final VoidCallback selectSchoolAttendance;
  final bool isSchoolPerformanceSelected;

  const EducationBursarySchoolTopBarSelection({
    Key? key,
    required this.selectSchoolPerformance,
    required this.selectSchoolAttendance,
    required this.isSchoolPerformanceSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: const BorderRadius.only(),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        child: Container(
          decoration: const BoxDecoration(color: Colors.black12),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: !isSchoolPerformanceSelected
                        ? const Color(0xFF009688)
                        : Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 5.0,
                    ),
                  ),
                  onPressed: selectSchoolAttendance,
                  child: Text(
                    'Attendance',
                    style: const TextStyle().copyWith(
                      fontSize: 14.0,
                      color: !isSchoolPerformanceSelected
                          ? Colors.white
                          : const Color(0xFF737373),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: isSchoolPerformanceSelected
                        ? const Color(0xFF009688)
                        : Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 5.0,
                    ),
                  ),
                  onPressed: selectSchoolPerformance,
                  child: Text(
                    'Performance',
                    style: const TextStyle().copyWith(
                      fontSize: 14.0,
                      color: isSchoolPerformanceSelected
                          ? Colors.white
                          : const Color(0xFF737373),
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
