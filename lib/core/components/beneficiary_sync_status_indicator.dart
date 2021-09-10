import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BeneficiarySyncStatusIndicator extends StatelessWidget {
  const BeneficiarySyncStatusIndicator({
    Key? key,
    this.iconHeight = 20.0,
    required this.isSynced,
    this.onTap,
  }) : super(key: key);

  final double iconHeight;
  final bool isSynced;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () => {},
        child: Container(
          height: iconHeight,
          width: iconHeight,
          margin: EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 5.0,
          ),
          child: SvgPicture.asset(
            'assets/icons/sync.svg',
            color: isSynced == true ? Colors.green : Colors.amber,
          ),
        ),
      ),
    );
  }
}
