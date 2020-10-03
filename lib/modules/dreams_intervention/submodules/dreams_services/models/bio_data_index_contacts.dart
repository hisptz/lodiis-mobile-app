import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class BioDataIndexContacts {
  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'BIO DATA: Index contacts',
          color: Color(0xFF05131B),
          inputFields: [
            InputField(
                id: 'CEKq8l9b8DG',
                name: 'Type of partner',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF05131B),
                options: [
                  InputFieldOption(
                      code:
                          'Girlfriend/boyfriend/cohabiting partner/Wife/ Husband',
                      name:
                          'Girlfriend/boyfriend/cohabiting partner/Wife/ Husb'),
                  InputFieldOption(
                      code: 'Biological children below 15 yrs',
                      name: 'Biological children below 15 yrs'),
                  InputFieldOption(code: 'Associates', name: 'Associates'),
                  InputFieldOption(
                      code: 'Family members', name: 'Family members')
                ]),
            InputField(
                id: 'p9AA21uFn2n',
                name: "Partner's name",
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF05131B)),
            InputField(
                id: 'Y0QGNDBCEbz',
                name: "Partner's date of birth",
                valueType: 'DATE',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF05131B)),
            InputField(
                id: 'cYoXGqzLXLr',
                name: "Partner's age",
                valueType: 'AGE',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF05131B)),
            InputField(
                id: 'mUN2hEf7R57',
                name: "Partner's sex",
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF05131B),
                options: [
                  InputFieldOption(code: 'Male', name: 'Male'),
                  InputFieldOption(code: 'Female', name: 'Female')
                ]),
            InputField(
              id: 'mkyHnxwr6QL',
              name: "Partner's contact",
              valueType: 'PHONE_NUMBER',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF05131B),
            ),
            InputField(
                id: 'xTD6pePFLIW',
                name: "Partner's Status",
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF05131B),
                options: [
                  InputFieldOption(code: 'Positive', name: 'Positive'),
                  InputFieldOption(code: 'Negative', name: 'Negative'),
                  InputFieldOption(code: 'Unknown', name: 'Unknown'),
                  InputFieldOption(code: 'No Response', name: 'No Response')
                ]),
            InputField(
                id: 'Vw2UuN7qN8P',
                name: 'Index to Index Contact linkage',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF05131B)),
            InputField(
                id: 'ZeXr3gvDhCW',
                name: 'Index Contact to elicited sexual partner linkage',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF05131B))
          ]),
    ];
  }
}
