import 'package:flutter/material.dart';

class EducationBeneficiaryButton extends StatelessWidget {
  const EducationBeneficiaryButton({
    Key? key,
    required this.label,
    required this.isVisible,
    required this.hasSplitBorder,
    this.onTap,
  }) : super(key: key);

  final String label;
  final bool isVisible;
  final bool hasSplitBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 5.0,
        ),
        child: Row(
          children: [
            InkWell(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 20.0,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '$label',
                      style: TextStyle().copyWith(
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF009688),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Visibility(
                visible: hasSplitBorder,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        width: 1.0,
                        color: Color(0xFF009688),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
