import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/models/ovc_enrollement_basic_info.dart';

class OvcEnrollmentBasicInfoForm extends StatefulWidget {
  const OvcEnrollmentBasicInfoForm({Key key}) : super(key: key);

  @override
  _OvcEnrollmentBasicInfoFormState createState() =>
      _OvcEnrollmentBasicInfoFormState();
}

class _OvcEnrollmentBasicInfoFormState
    extends State<OvcEnrollmentBasicInfoForm> {
  final List<FormSection> formSections =
      OvcEnrollmentBasicInfo.getFormSections();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Basic info'),
    );
  }
}
