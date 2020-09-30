import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class DreamsServiceHivRegisterInfo {
  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'HIV Services/Interventions Offered',
          color: Color(0xFF1F8ECE),
          inputFields: [
            InputField(
                id: "OQUOlPdsxKX",
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF05131B),
                name: "Name of Youth Ambassador",
                valueType: "TEXT"),
            InputField(
                id: "qB7wTuSGooW",
                name: "ART",
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF05131B),
                valueType: "TRUE_ONLY"),
            InputField(
              id: "xiK9SXY4KIm",
              name: "Linkage to ART",
              valueType: "TRUE_ONLY",
              inputColor: Color(0xFF1F8ECE),
              labelColor: Color(0xFF05131B),
            ),
            InputField(
                id: "Eg2WRoWLNA3",
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF05131B),
                name: "Condom Promotion and Provision",
                valueType: "TRUE_ONLY"),
            InputField(
                id: "DIBUwSyCurs",
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF05131B),
                name: "HIV Testing and Counselling",
                valueType: "TRUE_ONLY"),
            InputField(
                id: "vHAWEdM8mfw",
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF05131B),
                name: "HIV Prevention Messaging",
                valueType: "TRUE_ONLY"),
            InputField(
                id: "dKnvpmShwOf",
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF05131B),
                name: "Contraceptive Provision",
                valueType: "TRUE_ONLY"),
            InputField(
                id: "rVWBQxTICA8",
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF05131B),
                name: "Post Violence Care",
                valueType: "TRUE_ONLY"),
            InputField(
                id: "MDojgMBm8cD",
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF05131B),
                name: "PrEP",
                valueType: "TRUE_ONLY"),
          ])
    ];
  }
}
