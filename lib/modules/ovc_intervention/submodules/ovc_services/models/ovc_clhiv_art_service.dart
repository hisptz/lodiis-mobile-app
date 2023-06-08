import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/constants/app_hierarchy_reference.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcClhivArtService {
  static List<String> getMandatoryFields() {
    return [
      'Yu00G1uhiYN',
      'RIpmBgYc0ZN',
    ];
  }

  static List<FormSection> getFormSections() {
    return [
      FormSection(
        name: 'CLHIV ART CARD Service Form',
        color: const Color(0xFF4B9F46),
        borderColor: const Color(0xFF4B9F46),
        inputFields: [
          InputField(
            id: 'Yu00G1uhiYN',
            name: 'Name of FBSW"',
            isReadOnly: true,
            valueType: 'TEXT',
            inputColor: const Color(0xFF4B9F46),
            labelColor: const Color(0xFF1A3518),
          ),
          InputField(
            id: 'RIpmBgYc0ZN',
            name: 'CLHIV ART CARD Service Provided',
            valueType: 'BOOLEAN',
            inputColor: const Color(0xFF4B9F46),
            labelColor: const Color(0xFF1A3518),
          ),
          InputField(
            id: 'uVmlqLmHYpD',
            name: 'CLHIV ART CARD Service Provision Date',
            valueType: 'DATE',
            inputColor: const Color(0xFF4B9F46),
            labelColor: const Color(0xFF1A3518),
          ),
          InputField(
            id: 'JgNSiXuArwl',
            name: 'CLHIV ART CARD ART Number',
            valueType: 'TEXT',
            inputColor: const Color(0xFF4B9F46),
            labelColor: const Color(0xFF1A3518),
          ),
          InputField(
            id: 'wEKBn2SdrmA',
            name: 'CLHIV ART CARD Facility Obtaining ART',
            valueType: 'ORGANISATION_UNIT',
            allowedSelectedLevels: [AppHierarchyReference.facilityLevel],
            inputColor: const Color(0xFF4B9F46),
            labelColor: const Color(0xFF1A3518),
          ),
          InputField(
            id: 'FLI5NLYCqH9',
            name: 'CLHIV ART CARD Eligible for VL?',
            valueType: 'BOOLEAN',
            inputColor: const Color(0xFF4B9F46),
            labelColor: const Color(0xFF1A3518),
          ),
          InputField(
            id: 'QkoJ1afnMMK',
            name: 'CLHIV ART CARD: Reason for VL Non-Eligibility',
            valueType: 'BOOLEAN',
            inputColor: const Color(0xFF4B9F46),
            labelColor: const Color(0xFF1A3518),
          ),
          InputField(
            id: 'IwM9O0a78QD',
            name: 'CLHIV ART CARD: VL Results',
            valueType: 'NUMBER',
            inputColor: const Color(0xFF4B9F46),
            labelColor: const Color(0xFF1A3518),
          ),
          InputField(
            id: 'WKdeD28Oyn7',
            name: 'CLHIV ART CARD: Date of VL',
            valueType: 'DATE',
            inputColor: const Color(0xFF4B9F46),
            labelColor: const Color(0xFF1A3518),
          ),
          InputField(
            id: 'LaeDyUWYcoN',
            name: 'CLHIV ART CARD: MMD',
            valueType: 'TEXT',
            inputColor: const Color(0xFF4B9F46),
            labelColor: const Color(0xFF1A3518),
            options: [
              InputFieldOption(
                code: 'No',
                name: 'No',
              ),
              InputFieldOption(
                code: '3 Months',
                name: '3 Months',
              ),
              InputFieldOption(
                code: '6 Months',
                name: '6 Months',
              ),
            ],
          ),
          InputField(
            id: 'YxJQ58njlLM',
            name: 'Specify Other',
            valueType: 'TEXT',
            inputColor: const Color(0xFF4B9F46),
            labelColor: const Color(0xFF1A3518),
          ),
        ],
      )
    ];
  }
}
