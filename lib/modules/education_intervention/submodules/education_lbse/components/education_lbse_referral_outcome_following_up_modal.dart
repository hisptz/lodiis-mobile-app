import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';

class EducationLbseRefferalOutcomeFollowingUpModal extends StatelessWidget {
  const EducationLbseRefferalOutcomeFollowingUpModal({
    Key? key,
    required this.formSections,
  }) : super(key: key);

  final List<FormSection> formSections;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(" following up modal forms"),
    );
  }
}
