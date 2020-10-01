import 'package:flutter/material.dart';

class MaterialCard extends StatelessWidget {
  const MaterialCard({
    Key key,
    @required this.body,
    this.elevation = 1.0,
  }) : super(key: key);
  final Widget body;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.card,
        elevation: elevation,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: body);
  }
}
