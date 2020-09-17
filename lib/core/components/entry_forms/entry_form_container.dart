import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/models/form_section.dart';

class EntryFormContainer extends StatelessWidget {
  const EntryFormContainer({Key key, @required this.formSections})
      : super(key: key);

  final List<FormSection> formSections;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: formSections
          .map((FormSection formSection) => Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: MaterialCard(
                    body: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [Expanded(child: Text(formSection.name))],
                      )
                    ],
                  ),
                )),
              ))
          .toList(),
    );
  }
}
