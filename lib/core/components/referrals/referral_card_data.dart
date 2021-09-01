import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/referral_event.dart';

class ReferralCardData extends StatelessWidget {
  const ReferralCardData({
    Key? key,
    required this.labelColor,
    required this.valueColor,
    required this.currentLanguage,
    required this.referralDataCard,
    required this.isIncommingReferral,
  }) : super(key: key);

  final Color labelColor;
  final Color valueColor;
  final String currentLanguage;
  final ReferralEvent referralDataCard;
  final bool isIncommingReferral;

  Container _getReferralCardDataWidget({
    required String key,
    required String value,
    bool isVisible = true,
  }) {
    return Container(
      child: Visibility(
        visible: isVisible,
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 2.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  key,
                  style: TextStyle().copyWith(
                    fontSize: 14.0,
                    color: labelColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  value != "" ? value : 'N/A',
                  style: TextStyle().copyWith(
                    fontSize: 14.0,
                    color: valueColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _getReferralCardDataWidget(
            key: currentLanguage == 'lesotho' ? 'Letsatsi' : 'Date',
            value: referralDataCard.date!,
          ),
          _getReferralCardDataWidget(
            key: currentLanguage == 'lesotho'
                ? 'Tsela ea tsebetso'
                : 'Service mode',
            value: referralDataCard.serviceMode!,
          ),
          _getReferralCardDataWidget(
            key: 'Category',
            value: referralDataCard.category!,
          ),
          _getReferralCardDataWidget(
            key: 'Referred to',
            value: referralDataCard.location!,
          ),
          _getReferralCardDataWidget(
            isVisible: referralDataCard.referredToIp!.isNotEmpty,
            key: isIncommingReferral
                ? 'Referred issued from '
                : 'Referred issued to ',
            value: isIncommingReferral
                ? referralDataCard.referredFromIp!
                : referralDataCard.referredToIp!,
          ),
          _getReferralCardDataWidget(
            key: currentLanguage == 'lesotho' ? 'Mofuta' : 'Type',
            value: referralDataCard.type!,
          ),
          _getReferralCardDataWidget(
            key: 'Status',
            value: referralDataCard.status!,
          ),
        ],
      ),
    );
  }
}
