import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/core/components/referrals/beneficiary_referral_card_body.dart';
import 'package:kb_mobile_app/core/components/referrals/beneficiary_referral_card_button.dart';
import 'package:kb_mobile_app/core/components/referrals/beneficiary_referral_outcome_container.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/referral_event.dart';

class BeneficiaryRefereralCardContainer extends StatefulWidget {
  const BeneficiaryRefereralCardContainer({
    Key? key,
    required this.referralIndex,
    required this.themeColor,
    required this.titleColor,
    required this.labelColor,
    required this.valueColor,
    required this.isIncomingReferral,
    required this.referralEventData,
    this.isOvcIntervention = false,
    this.isHouseHoldReferral = false,
    this.isOnViewOrManage = false,
    this.prefixReferralTitle = 'Referral',
    required this.onManage,
    required this.onView,
  }) : super(key: key);

  final Events referralEventData;
  final bool isIncomingReferral;
  final String prefixReferralTitle;
  final Color themeColor;
  final Color titleColor;
  final Color labelColor;
  final Color valueColor;
  final int referralIndex;
  final bool isOnViewOrManage;
  final bool isHouseHoldReferral;
  final bool isOvcIntervention;

  final VoidCallback onView;
  final VoidCallback onManage;

  @override
  State<BeneficiaryRefereralCardContainer> createState() =>
      _BeneficiaryRefereralCardContainerState();
}

class _BeneficiaryRefereralCardContainerState
    extends State<BeneficiaryRefereralCardContainer> {
  bool _isLoading = true;
  late ReferralEvent referralEvent;

  @override
  void initState() {
    super.initState();
    setReferralEventDataModel();
  }

  void setReferralEventDataModel() async {
    referralEvent =
        await ReferralEvent().fromTeiModel(widget.referralEventData);
    _isLoading = false;
    Timer(const Duration(milliseconds: 100), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 15.0,
      ),
      child: _isLoading
          ? Container(
              margin: const EdgeInsets.symmetric(
                vertical: 15.0,
              ),
              child: const CircularProgressIndicator(
                color: Colors.blueGrey,
              ),
            )
          : MaterialCard(
              body: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 15.0,
                          ),
                          child: Text(
                            '${widget.prefixReferralTitle} ${widget.referralIndex}-',
                            style: const TextStyle().copyWith(
                              color: widget.titleColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                      BeneficiaryReferralCardEditIcon(
                        referralEvent: referralEvent,
                        isOnEditMode:
                            referralEvent.eventData!.enrollmentOuAccessible! &&
                                widget.isOnViewOrManage,
                        color: widget.themeColor,
                      )
                    ],
                  ),
                  LineSeparator(
                    color: widget.themeColor.withOpacity(0.2),
                    height: 2.0,
                  ),
                  BeneficiaryRefereralCardBody(
                    referralEvent: referralEvent,
                    labelColor: widget.labelColor,
                    valueColor: widget.valueColor,
                    isIncomingReferral: widget.isIncomingReferral,
                  ),
                  Visibility(
                    visible: widget.isOnViewOrManage,
                    child: BeneficiaryRefereralOutcomeContainer(
                      referralEvent: referralEvent,
                      labelColor: widget.themeColor,
                      valueColor: widget.valueColor,
                    ),
                  ),
                  Visibility(
                    visible: !widget.isOnViewOrManage,
                    child: BeneficiaryRefereralCardButton(
                      themeColor: widget.themeColor,
                      onManage: widget.onManage,
                      onView: widget.onView,
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

class BeneficiaryReferralCardEditIcon extends StatelessWidget {
  const BeneficiaryReferralCardEditIcon({
    Key? key,
    required this.referralEvent,
    required this.isOnEditMode,
    required this.color,
  }) : super(key: key);

  final ReferralEvent referralEvent;
  final bool isOnEditMode;
  final Color color;

  final double editIconHeight = 20.0;

  //TODO checking if has outcomes of a given referral to control edit functionality;

  // bool shouldEditReferral(List dataValues) {
  //   CurrentUser? user =
  //       Provider.of<CurrentUserState>(context, listen: false).currentUser;
  //   var referralImplementingPartner = dataValues.firstWhere(
  //       (dataValue) =>
  //           dataValue['dataElement'] ==
  //           DreamsAgywReferralConstant.referralImplementingPartner,
  //       orElse: () => null);
  //   return referralImplementingPartner != null
  //       ? referralImplementingPartner['value'] != user!.implementingPartner
  //       : true;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Visibility(
        visible: isOnEditMode,
        child: InkWell(
          onTap: () => {},
          child: Container(
            height: editIconHeight,
            width: editIconHeight,
            margin: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            child: SvgPicture.asset(
              'assets/icons/edit-icon.svg',
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
