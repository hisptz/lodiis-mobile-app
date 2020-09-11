import 'package:flutter/material.dart';

class MaterialCard extends StatelessWidget {
  const MaterialCard({Key key, @required this.body}) : super(key: key);
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.card,
        elevation: 1.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: body);
  }
}
