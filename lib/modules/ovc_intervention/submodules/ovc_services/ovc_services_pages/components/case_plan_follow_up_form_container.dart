import 'package:flutter/material.dart';

class CasePlanFollowUpFormContainer extends StatelessWidget {
  const CasePlanFollowUpFormContainer({
    Key key,
    @required this.dataObject,
  }) : super(key: key);

  final Map dataObject;

  @override
  Widget build(BuildContext context) {
    print(dataObject);
    return Container(
      child: Text('Modal for follow up for case plan $dataObject'),
    );
  }
}
