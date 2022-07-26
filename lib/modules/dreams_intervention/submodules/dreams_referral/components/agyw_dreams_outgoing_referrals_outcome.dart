import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/core/components/input_fields/search_input.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/pages/dream_referral_page_home.dart';
import 'package:provider/provider.dart';

class AgywDreamsOutgoingReferralsOutcome extends StatefulWidget {
  const AgywDreamsOutgoingReferralsOutcome({
    Key? key,
    required this.agywList,
    required this.isIncomingReferral,
  }) : super(key: key);
  final List<AgywDream> agywList;
  final bool isIncomingReferral;

  @override
  _AgywDreamsOutgoingReferralsOutcomeState createState() =>
      _AgywDreamsOutgoingReferralsOutcomeState();
}

class _AgywDreamsOutgoingReferralsOutcomeState
    extends State<AgywDreamsOutgoingReferralsOutcome> {
  final String svgIcon = 'assets/icons/dreams-header-icon.svg';
  String searchedValue = '';

  onView(AgywDream agywBeneficiary) {
    Provider.of<DreamsBeneficiarySelectionState>(context, listen: false)
        .setCurrentAgywDream(agywBeneficiary);
    Provider.of<ServiceEventDataState>(context, listen: false)
        .resetServiceEventDataState(agywBeneficiary.id);
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DreamsAgywReferralPage(
          isIncomingReferral: widget.isIncomingReferral,
        ),
      ),
    );
  }

  onSearchBeneficiary(String value) {
    setState(() {
      searchedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        SearchInput(
          onSearch: (value) => onSearchBeneficiary(value),
        ),
        const LineSeparator(
          color: Color(0xFFE9F4FA),
        ),
        const SizedBox(
          height: 10,
        ),
        Visibility(
          child: const Text('Searched Beneficiary not found!'),
          visible: searchedValue != '' &&
              widget.agywList
                  .where((agyw) => '${agyw.toString()} ${agyw.primaryUIC}'
                      .toLowerCase()
                      .contains(searchedValue))
                  .isEmpty,
        ),
        ...(widget.agywList.where((agyw) =>
                '${agyw.toString()} ${agyw.primaryUIC}'
                    .toLowerCase()
                    .contains(searchedValue)))
            .map((agyw) => Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 10.0),
                  child: MaterialCard(
                    body: GestureDetector(
                      onTap: () => onView(agyw),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding:
                                          const EdgeInsets.only(right: 5.0),
                                      height: 20.0,
                                      width: 20.0,
                                      child: SvgPicture.asset(
                                        svgIcon,
                                      )),
                                ),
                                Expanded(
                                    flex: 10,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Wrap(children: [
                                          Text(agyw.toString(),
                                              style: const TextStyle().copyWith(
                                                  color:
                                                      const Color(0xFF05131B),
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        Wrap(children: [Text(agyw.primaryUIC!)])
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    ),
                  ),
                ))
            .toList()
      ]),
    );
  }
}
