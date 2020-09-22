import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/input_fields/input_field_container.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class EntrySubFormContainer extends StatelessWidget {
  const EntrySubFormContainer(
      {Key key, @required this.subSections, this.onInputValueChange})
      : super(key: key);

  final List<FormSection> subSections;
  final Function onInputValueChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: subSections
            .map(
              (FormSection subSection) => Container(
                  margin: EdgeInsets.symmetric(
                      vertical: subSection.name != '' ? 5.0 : 0.0),
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(
                              color: subSection.borderColor, width: 8.0)),
                      color: subSection.backgroundColor),
                  child: Column(
                    children: [
                      Visibility(
                        visible: subSection.name != '',
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10.0),
                          child: Row(
                            children: [
                              Text(
                                subSection.name,
                                style: TextStyle().copyWith(
                                    color: subSection.color,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: subSection.inputFields
                              .map((InputField inputField) => Container(
                                    margin: EdgeInsets.only(top: 10.0),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: inputField.background ==
                                                Colors.transparent
                                            ? 10.0
                                            : 0.0),
                                    child: InputFieldContainer(
                                        inputField: inputField,
                                        onInputValueChange:
                                            (String id, dynamic value) =>
                                                onInputValueChange(id, value)),
                                  ))
                              .toList(),
                        ),
                      ),
                      Container(
                        child: EntrySubFormContainer(
                          subSections: subSection.subSections,
                          onInputValueChange: onInputValueChange,
                        ),
                      )
                    ],
                  )),
            )
            .toList(),
      ),
    );
  }
}
