import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';

class EducationLbseRefferalOutcomeModal extends StatelessWidget {
  const EducationLbseRefferalOutcomeModal({
    Key? key,
    required this.formSections,
  }) : super(key: key);

  final List<FormSection> formSections;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(" outcome modal forms"),
    );
  }
}
