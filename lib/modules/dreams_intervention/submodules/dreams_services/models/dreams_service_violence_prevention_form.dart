import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class DreamsServiceViolencePreventionForm {
  static List<FormSection> getFormSections({
    required String firstDate,
  }) {
    return [
      FormSection(
          name: 'Violence Prevention Education',
          color: const Color(0xFF1F8ECE),
          inputFields: [
            InputField(
              id: 'u91LWo6Lz5E',
              name: 'Violence Prevention Education',
              valueType: 'BOOLEAN',
              inputColor: const Color(0xFF1F8ECE),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'lvT9gfpHIlT',
              name: 'Date service was provided',
              valueType: 'DATE',
              firstDate: firstDate,
              inputColor: const Color(0xFF1F8ECE),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'gEjigBuBTmh',
              name: 'Reasons for rejecting/declining service(s) offered',
              valueType: 'TEXT',
              options: [
                InputFieldOption(
                  code: 'Religion/Culture',
                  name: 'Religion/Culture',
                ),
                InputFieldOption(
                  code: 'Service already provided',
                  name: 'Service already provided (by other provider)',
                ),
                InputFieldOption(
                  code: 'NotReady',
                  name: 'Not Ready',
                ),
                InputFieldOption(
                  code: 'HealthConcerns',
                  name: 'Health Concerns',
                ),
                InputFieldOption(
                  code: 'AccessIssues',
                  name: 'Access Issues (resources, time)',
                ),
                InputFieldOption(
                  code: 'NotInterested',
                  name: 'Not Interested',
                ),
                InputFieldOption(
                  code: 'Other(s)',
                  name: 'Other(s)',
                )
              ],
              inputColor: const Color(0xFF1F8ECE),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'oTTL6vEpKok',
              name: 'Specify other reasons for service declining',
              valueType: 'LONG_TEXT',
              firstDate: firstDate,
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
          ])
    ];
  }
}
