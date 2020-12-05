import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class DreamsSrhRegister {
  static List<FormSection> getFormSections() {
    return [
      FormSection(name: '', color: Color(0xFF737373), inputFields: [
        InputField(
          name: 'Family Planning Number',
          id: 'wewEGgNuqog',
          valueType: 'NUMBER',
          inputColor: Color(0xFF258DCC),
          labelColor: Color(0xFF737373),
        ),
        InputField(
          name: 'Point of Entry into Register',
          id: 'YobVqoVdFt5',
          valueType: 'TEXT',
          inputColor: Color(0xFF258DCC),
          labelColor: Color(0xFF737373),
        ),
        InputField(
          name: 'Date of Entry into Register',
          id: 'pJa1QZ36oRd',
          valueType: 'DATE',
          inputColor: Color(0xFF258DCC),
          labelColor: Color(0xFF737373),
        ),
        InputField(
          name: 'Date of Entry into Register',
          id: 'pJa1QZ36oRd',
          valueType: 'DATE',
          inputColor: Color(0xFF258DCC),
          labelColor: Color(0xFF737373),
        ),
        InputField(
          name: 'Type of visit',
          id: 'pqhGdUERXyw',
          valueType: 'TEXT',
          options: [
            InputFieldOption(code: 'New', name: 'New'),
            InputFieldOption(code: 'Revisit', name: 'Revisit'),
            InputFieldOption(code: 'Restart', name: 'Restart'),
          ],
          inputColor: Color(0xFF258DCC),
          labelColor: Color(0xFF737373),
        ),
        InputField(
          name: 'Parity/Live children',
          id: 'KiQwTmUK25h',
          valueType: 'NUMBER',
          inputColor: Color(0xFF258DCC),
          labelColor: Color(0xFF737373),
        ),
        InputField(
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            id: '',
            name: 'Initial FP Method(s)',
            valueType: 'CHECK_BOX',
            options: [
              InputFieldOption(code: 'n5SSrjeXHIs', name: 'Condoms'),
              InputFieldOption(code: 'fst260e7tpT', name: 'Implants'),
              InputFieldOption(code: 'dC9ueICZb6s', name: 'Injectable'),
              InputFieldOption(code: 'oJSBJSXnf6A', name: 'IUCD'),
              InputFieldOption(code: 'regIMsf6R1Y', name: 'Pills'),
              InputFieldOption(code: 'w5ldxJTQL2Y', name: 'Turbal ligation'),
              InputFieldOption(code: 'WrzFKRm8pvJ', name: 'Vasectomy'),
            ]),
        InputField(
            id: '',
            name: 'Counselling Services',
            valueType: 'CHECK_BOX',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'M1euyjJQsvj', name: 'FP'),
              InputFieldOption(code: 'LuxT1F6qoDT', name: 'Infertility'),
              InputFieldOption(code: 'bBssQQX8NGE', name: 'STI'),
            ]),
        InputField(
            id: '',
            name: 'Exam, Screens & Removals',
            valueType: 'CHECK_BOX',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'xDxVuZwKLst', name: 'Physical'),
              InputFieldOption(code: 'uzbkJF0t1Fr', name: 'IUCD Removed'),
              InputFieldOption(code: 've1jColsTjp', name: 'Implant Removed'),
              InputFieldOption(code: 'SoDGMPKklHL', name: 'PAP Smear'),
              InputFieldOption(code: 'hLECPWd313a', name: 'TB Screen'),
              InputFieldOption(code: 'aJyd9UHgTXt', name: 'STI Treated'),
              InputFieldOption(code: 'dRB883XlUaE', name: 'GBV Issues'),
            ]),
        InputField(
          name: 'HIV',
          id: 'IIo0Rmxa78w',
          valueType: 'TEXT',
          options: [
            InputFieldOption(code: 'Negative', name: 'Negative'),
            InputFieldOption(code: 'Positive', name: 'Positive'),
            InputFieldOption(code: 'Undetectable', name: 'Undetectable'),
          ],
          inputColor: Color(0xFF258DCC),
          labelColor: Color(0xFF737373),
        ),
        InputField(
          name: 'Referred HTS',
          id: 'uTbkCA8zZV3',
          valueType: 'TEXT',
          options: [
            InputFieldOption(code: 'Negative', name: 'Negative'),
            InputFieldOption(code: 'Positive', name: 'Positive'),
            InputFieldOption(code: 'Undetectable', name: 'Undetectable'),
          ],
          inputColor: Color(0xFF258DCC),
          labelColor: Color(0xFF737373),
        ),
        InputField(
            id: '',
            name: 'Switched FP Method',
            valueType: 'CHECK_BOX',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'zqB4F95Vlpm', name: 'Condoms'),
              InputFieldOption(code: 'RKi2OiQVKTi', name: 'Implants'),
              InputFieldOption(code: 'mLjOTqQOLYH', name: 'Injectable'),
              InputFieldOption(code: 'cBWL5LBobav', name: 'IUCD'),
              InputFieldOption(code: 'jurFXJUpoD2', name: 'Pills'),
              InputFieldOption(code: 'FqbxJwN5wrK', name: 'Turbal ligation'),
              InputFieldOption(code: 'vVo3YAYh9tU', name: 'Vasectomy'),
            ]),
        InputField(
          name: 'Reason for Method Switching',
          id: 'L31EGCultyl',
          valueType: 'TEXT',
          inputColor: Color(0xFF258DCC),
          labelColor: Color(0xFF737373),
        ),
        InputField(
          name: 'Method',
          id: 'aLplPbSL7RX',
          valueType: 'TEXT',
          inputColor: Color(0xFF258DCC),
          labelColor: Color(0xFF737373),
        ),
      ]),
    ];
  }
}
