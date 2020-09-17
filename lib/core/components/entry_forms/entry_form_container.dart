import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_sub_form_container.dart';
import 'package:kb_mobile_app/core/components/input_fields/input_field_container.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class EntryFormContainer extends StatelessWidget {
  const EntryFormContainer(
      {Key key, @required this.formSections, this.onInputValueChange})
      : super(key: key);

  final List<FormSection> formSections;
  final Function onInputValueChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: formSections
          .map((FormSection formSection) => Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: MaterialCard(
                    body: Container(
                  decoration: BoxDecoration(color: formSection.backgroundColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              formSection.name,
                              style: TextStyle().copyWith(
                                  color: formSection.color,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold),
                            ))
                          ],
                        ),
                      ),
                      Container(
                          child: LineSeperator(
                              color: formSection.color.withOpacity(0.1))),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: formSection.inputFields
                              .map((InputField inputField) => Container(
                                    margin: EdgeInsets.only(top: 10.0),
                                    child: InputFieldContainer(
                                      inputField: inputField,
                                      onInputValueChange:
                                          (String id, dynamic value) =>
                                              onInputValueChange(id, value),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                      EntrySubFormContainer(
                        subSections: formSection.subSections,
                        onInputValueChange: onInputValueChange,
                      )
                    ],
                  ),
                )),
              ))
          .toList(),
    );
  }
}
