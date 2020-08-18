import 'package:flutter/material.dart';

class InterventionSelectionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InterventionSelectionState();
  }
}

class _InterventionSelectionState extends State<InterventionSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text('Intervention selection'),
      ],
    ));
  }
}
