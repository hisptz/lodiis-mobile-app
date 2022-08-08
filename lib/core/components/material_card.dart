import 'package:flutter/material.dart';

class MaterialCard extends StatelessWidget {
  const MaterialCard({
    Key? key,
    required this.body,
    this.elevation = 1.0,
    this.borderRadius = 12.0,
    this.borderColor = Colors.transparent,
  }) : super(key: key);
  final Widget body;
  final double elevation;
  final double borderRadius;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.card,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius * 0.2)),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: borderColor,
                width: borderColor == Colors.transparent ? 0.0 : 2.0),
          ),
          child: body,
        ),
      ),
    );
  }
}
