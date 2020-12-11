import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class OvcServicesCasePlan {
  static List<FormSection> getFormSections() {
    return [
      FormSection(
        name: 'DOMAIN HEALTH',
        translatedName: 'BOPHELO BO BOTLE',
        id: 'Health',
        color: Color(0xFF4D9E49),
        borderColor: Color(0xFF4D9E49),
        inputFields: [
          InputField(
              id: 'ADc3clrQRl4',
              name: 'Goal 1',
              translatedName: 'Sepheo 1',
              valueType: 'LONG_TEXT',
              inputColor: Color(0xFF4A9F46),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'efNgDIqhlNs',
              name: 'Goal 2',
              translatedName: 'Sepheo 2',
              valueType: 'LONG_TEXT',
              inputColor: Color(0xFF4A9F46),
              labelColor: Color(0xFF737373)),
        ],
      ),
      FormSection(
        id: 'Stable',
        name: 'DOMAIN STABLE',
        translatedName: 'BOTSITSO',
        color: Color(0xFF0000FF),
        borderColor: Color(0xFF0000FF),
        inputFields: [
          InputField(
              id: 'ADc3clrQRl4',
              name: 'Goal 1',
              translatedName: 'Sepheo 1',
              valueType: 'LONG_TEXT',
              inputColor: Color(0xFF0000FF),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'efNgDIqhlNs',
              name: 'Goal 2',
              translatedName: 'Sepheo 2',
              valueType: 'LONG_TEXT',
              inputColor: Color(0xFF0000FF),
              labelColor: Color(0xFF737373)),
        ],
      ),
      FormSection(
        id: 'Safe',
        name: 'DOMAIN SAFE',
        translatedName: 'TSIRELETSO',
        color: Color(0xFF0F9587),
        borderColor: Color(0xFF0F9587),
        inputFields: [
          InputField(
              id: 'ADc3clrQRl4',
              name: 'Goal 1',
              translatedName: 'Sepheo 1',
              valueType: 'LONG_TEXT',
              inputColor: Color(0xFF0F9587),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'efNgDIqhlNs',
              name: 'Goal 2',
              translatedName: 'Sepheo 2',
              valueType: 'LONG_TEXT',
              inputColor: Color(0xFF0F9587),
              labelColor: Color(0xFF737373)),
        ],
      ),
      FormSection(
        id: 'Schooled',
        name: 'DOMAIN SCHOOLED',
        translatedName:'TSA SEKOLO',
        color: Color(0xFF9B2BAE),
        borderColor: Color(0xFF9B2BAE),
        inputFields: [
          InputField(
              id: 'ADc3clrQRl4',
              name: 'Goal 1',
              translatedName: 'Sepheo 1',
              valueType: 'LONG_TEXT',
              inputColor: Color(0xFF9B2BAE),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'efNgDIqhlNs',
              name: 'Goal 2',
              translatedName: 'Sepheo 2',
              valueType: 'LONG_TEXT',
              inputColor: Color(0xFF9B2BAE),
              labelColor: Color(0xFF737373)),
        ],
      ),
    ];
  }
}
