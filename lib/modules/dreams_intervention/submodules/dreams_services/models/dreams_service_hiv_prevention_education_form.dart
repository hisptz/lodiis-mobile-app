import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class DreamsServiceHIVPreventionEducationForm {
  static List<FormSection> getFormSections({
    required String firstDate,
  }) {
    return [
      FormSection(
        name: 'HIV Prevention Education',
        color: const Color(0xFF1F8ECE),
        inputFields: [
          InputField(
            id: 'ytVTXe4RVUJ',
            name: 'HIV Prevention Education',
            inputColor: const Color(0xFF1F8ECE),
            labelColor: const Color(0xFF737373),
            valueType: 'BOOLEAN',
          ),
          InputField(
            id: 'lvT9gfpHIlT',
            name: 'Date service was provided',
            inputColor: const Color(0xFF1F8ECE),
            labelColor: const Color(0xFF737373),
            valueType: 'DATE',
          ),
          InputField(
              id: 'gEjigBuBTmh',
              name: 'Reasons for rejecting/declining service(s) offered',
              inputColor: const Color(0xFF1F8ECE),
              labelColor: const Color(0xFF737373),
              valueType: 'BOOLEAN',
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
                ),
              ]),
          InputField(
            id: 'oTTL6vEpKok',
            name: 'Specify other reasons for service declining',
            inputColor: const Color(0xFF1F8ECE),
            labelColor: const Color(0xFF737373),
            firstDate: firstDate,
            valueType: 'LONG_TEXT',
          ),
        ],
      ),
    ];
  }
}
