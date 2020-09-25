import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcCaseClosure {
  static List<String> getMandatoryField() {
    return [
      'D9boflKTCM4',
      'S6vcaNyPT5a',
      'Mgvli43II0y',
      'd1fuqooMhvZ',
      'HEqBwx1j03q',
      'P4jYGKdec2j',
      'P3UeZrhQ3n6',
      'UR6DHzGAh9V',
      'aVSqxKj3eUt',
      'z3oHGQMNcwr',
      'OXxcaFKJhaB',
      'F687EjSn2TW',
      'ZNeMsEdTA8s',
      'KR0HmxVQwnJ'
    ];
  }

  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'Case closure checklist',
          color: Color(0xFF0D3A16),
          inputFields: [
            InputField(
                id: 'iaVO2v6TsWa',
                name: 'What is a reason for case closure?',
                valueType: 'TEXT',
                inputColor: Color(0xFF07AD40),
                labelColor: Color(0xFF07AD40),
                options: [
                  InputFieldOption(code: 'CasePlanAchievement', name: 'Case Plan Achievement'),
                  InputFieldOption(code: 'Transfer', name: 'Transfer'),
                  InputFieldOption(code: 'Attrition', name: 'Attrition'),
                      ]
                ),
            InputField(
                id: 'S6vcaNyPT5a',
                name: 'Date of Household Exited from the OVC Program',
                valueType: 'DATE',
                inputColor: Color(0xFF07AD40),
                labelColor: Color(0xFF07AD40)),    
                
            InputField(
                id: 'Mgvli43II0y',
                name: 'Are case files completed per the protocol?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF07AD40),
                labelColor: Color(0xFF07AD40),
                ),  
            InputField(
                id: 'd1fuqooMhvZ',
                name: 'Social worker has given phone number to household (Provide office number)?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF07AD40),
                labelColor: Color(0xFF07AD40)),
            InputField(
                id: 'HEqBwx1j03q',
                name: 'Head of household linked to a family, which has already graduated?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF07AD40),
                labelColor: Color(0xFF07AD40)),   
            InputField(
                id: 'P4jYGKdec2j',
                name: 'Name of household head linked to',
                valueType: 'TEXT',
                inputColor: Color(0xFF07AD40),
                labelColor: Color(0xFF07AD40)), 
             InputField(
                id: 'P3UeZrhQ3n6',
                name: 'Inform necessary service providers of graduation?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF07AD40),
                labelColor: Color(0xFF07AD40),
                ),        
            InputField(
                id: 'UR6DHzGAh9V',
                name: 'Graduation recorded in database of partner?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF07AD40),
                labelColor: Color(0xFF07AD40),
                ),             
            InputField(
                id: 'aVSqxKj3eUt',
                name: 'Files for case plan achievement stored in a safe place (locked cabinet)?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF07AD40),
                labelColor: Color(0xFF07AD40),
                ),     
            InputField(
                id: 'z3oHGQMNcwr',
                name: 'Care Transfer Form completed per the protocol?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF07AD40),
                labelColor: Color(0xFF07AD40),
                ),         
            InputField(
                id: 'OXxcaFKJhaB',
                name: 'Referring Social Worker established time and frequency for follow up with receiving organization?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF07AD40),
                labelColor: Color(0xFF07AD40),
                ),           
             InputField(
                id: 'F687EjSn2TW',
                name: 'Inform necessary service providers of care transfer?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF07AD40),
                labelColor: Color(0xFF07AD40),
                ),        
            InputField(
                id: 'ZNeMsEdTA8s',
                name: 'Copy of family folder sent to receiving organization?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF07AD40),
                labelColor: Color(0xFF07AD40),
                ),     
            InputField(
                id: 'KR0HmxVQwnJ',
                name: 'Files for case transfer stored in a safe place (locked cabinet)?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF07AD40),
                labelColor: Color(0xFF07AD40),
                )
          ])
    ];
  }
}
