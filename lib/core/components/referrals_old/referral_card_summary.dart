import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';

class ReferralCardSummary extends StatelessWidget {
  const ReferralCardSummary({
    Key? key,
    required this.count,
    required this.cardBody,
    required this.borderColor,
    required this.buttonLabelColor,
    required this.titleColor,
    this.isOutgoingCLOReferral = false,
    this.isCLOReferral = false,
    this.onView,
    this.onManage,
  }) : super(key: key);
  final int count;
  final Color borderColor;
  final Color buttonLabelColor;
  final Color titleColor;
  final Widget cardBody;
  final Function? onView;
  final Function? onManage;
  final bool isCLOReferral;
  final bool isOutgoingCLOReferral;

  @override
  Widget build(BuildContext context) {
    return MaterialCard(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 15.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    isCLOReferral
                        ? 'CLO Referral ${count.toString()}'
                        : 'Referral ${count.toString()}',
                    style: const TextStyle().copyWith(
                      color: titleColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Visibility(
                  visible: isCLOReferral ? true : false,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 2.0,
                    ),
                    child: isOutgoingCLOReferral
                        ? Text(
                            'Outgoing',
                            style: const TextStyle().copyWith(
                              color: const Color(0XFF536852),
                              fontSize: 12.0,
                            ),
                          )
                        : Text(
                            'Incoming',
                            style: const TextStyle().copyWith(
                              color: const Color(0xFF4B9F46),
                              fontSize: 12.0,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
          LineSeparator(
            color: borderColor,
            height: 2,
          ),
          cardBody,
          LineSeparator(
            color: borderColor,
            height: 2,
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12.0),
              bottomRight: Radius.circular(12.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: borderColor.withOpacity(0.4),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: onView as void Function()?,
                      child: Text(
                        'VIEW',
                        style: const TextStyle().copyWith(
                          fontSize: 12.0,
                          color: buttonLabelColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 20.0,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: buttonLabelColor.withOpacity(0.3),
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: onManage as void Function()?,
                      child: Text(
                        'MANAGE',
                        style: const TextStyle().copyWith(
                          fontSize: 12.0,
                          color: buttonLabelColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}