import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/app_state/synchronization_state/synchronization_status_state.dart';
import 'package:kb_mobile_app/core/components/beneficiary_sync_status_indicator.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/none_participation_beneficiary.dart';
import 'package:provider/provider.dart';

class NoneParticipantBeneficiaryCard extends StatelessWidget {
  const NoneParticipantBeneficiaryCard(
      {Key? key,
      required this.beneficiary,
      this.onViewBeneficiary,
      this.onEditBeneficiary,
      this.canEdit = false,
      this.canView = true})
      : super(key: key);

  final NoneParticipationBeneficiary beneficiary;
  final bool canView;
  final bool canEdit;
  final Function? onViewBeneficiary;
  final Function? onEditBeneficiary;

  final String svgIcon = 'assets/icons/dreams-header-icon.svg';

  @override
  Widget build(BuildContext context) {
    double iconHeight = 25;
    return Container(
      margin: EdgeInsets.only(
        bottom: 16.0,
        right: 13.0,
        left: 13.0,
      ),
      child: MaterialCard(body: Consumer<InterventionCardState>(
        builder: (context, interventionState, child) {
          InterventionCard currentIntervention =
              interventionState.currentInterventionProgram;

          final Color labelColor = currentIntervention.countColor!;
          final Color lineSeparatorColor = currentIntervention.countLabelColor!;
          final Color valueColor = const Color(0xFF444E54);

          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: true,
                        child: Expanded(
                          flex: 1,
                          child: Container(
                            child: Container(
                              height: 20.0,
                              width: 20.0,
                              child: SvgPicture.asset(
                                svgIcon,
                                color: currentIntervention.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: true,
                        child: Expanded(
                          flex: 10,
                          child: Container(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text(
                              '${beneficiary.firstname} ${beneficiary.surname}',
                              style: TextStyle().copyWith(
                                  color: Color(0xFF05131B),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Consumer<SynchronizationStatusState>(builder:
                          (context, synchronizationStatusState, child) {
                        List<String> unsyncedTeiReferences =
                            synchronizationStatusState.unsyncedTeiReferences;
                        bool isUnsynced =
                            unsyncedTeiReferences.contains(beneficiary.event);
                        return BeneficiarySyncStatusIndicator(
                          isSynced: !isUnsynced,
                        );
                      }),
                      Visibility(
                        visible: canView,
                        child: Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () => onViewBeneficiary?.call(),
                            child: Container(
                              height: iconHeight,
                              width: iconHeight,
                              margin: EdgeInsets.symmetric(
                                vertical: 5.0,
                                horizontal: 5.0,
                              ),
                              child: SvgPicture.asset(
                                'assets/icons/expand_icon.svg',
                                color: currentIntervention.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: canEdit,
                        child: Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () => onEditBeneficiary?.call(),
                            child: Container(
                              height: iconHeight,
                              width: iconHeight,
                              margin: EdgeInsets.symmetric(
                                vertical: 5.0,
                                horizontal: 5.0,
                              ),
                              child: SvgPicture.asset(
                                'assets/icons/edit-icon.svg',
                                color: currentIntervention.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                LineSeparator(
                  color: lineSeparatorColor,
                ),
                Consumer<LanguageTranslationState>(
                  builder: (context, languageTranslationState, child) {
                    String? currentLanguage =
                        languageTranslationState.currentLanguage;
                    return Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 13.0,
                        vertical: 20.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Table(
                                      children: [
                                        TableRow(
                                          children: [
                                            TableCell(
                                              child: Row(
                                                children: [
                                                  _getRowCardData(
                                                    labelColor: labelColor,
                                                    valueColor: valueColor,
                                                    label: currentLanguage ==
                                                            'lesotho'
                                                        ? 'Lilemo'
                                                        : 'Age',
                                                    value: beneficiary.age
                                                        .toString(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            TableCell(
                                              child: Row(
                                                children: [
                                                  _getRowCardData(
                                                    labelColor: labelColor,
                                                    valueColor: valueColor,
                                                    label: currentLanguage ==
                                                            'lesotho'
                                                        ? 'Boleng'
                                                        : 'Sex',
                                                    value: beneficiary.sex,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            TableCell(
                                              child: Row(
                                                children: [
                                                  _getRowCardData(
                                                    labelColor: labelColor,
                                                    valueColor: valueColor,
                                                    label: 'Phone #',
                                                    value:
                                                        beneficiary.phoneNumber,
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          );
        },
      )),
    );
  }

  Expanded _getRowCardData({
    required Color labelColor,
    required Color valueColor,
    required String label,
    required String? value,
  }) {
    return Expanded(
      child: Container(
        child: RichText(
          text: TextSpan(
            text: '$label: ',
            style: TextStyle().copyWith(
              color: labelColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
            children: [
              TextSpan(
                text: value,
                style: TextStyle().copyWith(
                  color: valueColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
