import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/input_fields/input_field_container.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class EntrySubFormContainer extends StatelessWidget {
  const EntrySubFormContainer({Key key, @required this.subSections})
      : super(key: key);

  final List<FormSection> subSections;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: subSections
            .map(
              (FormSection subSection) => Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(
                              color: subSection.borderColor, width: 10.0)),
                      color: subSection.backgroundColor),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text(
                              subSection.name,
                              style: TextStyle().copyWith(
                                  color: subSection.color,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: subSection.inputFields
                              .map((InputField inputField) =>
                                  InputFieldContainer(
                                    inputField: inputField,
                                    onInputValueChange:
                                        (String id, dynamic value) =>
                                            print('id : $id - value : $value'),
                                  ))
                              .toList(),
                        ),
                      ),
                      Container(
                        child: EntrySubFormContainer(
                            subSections: subSection.subSections),
                      )
                    ],
                  )),
            )
            .toList(),
      ),
    );
  }
}
