import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/beneficiary_filter_state/beneficiary_filter_state.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/education_intervention_state/education_bursary_state.dart';
import 'package:kb_mobile_app/app_state/education_intervention_state/education_lbse_state.dart';
import 'package:kb_mobile_app/app_state/intervention_bottom_navigation_state/intervention_bottom_navigation_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/ogac_intervention_list_state/ogac_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/pp_prev_intervention_state/pp_prev_intervention_state.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/models/Intervention_bottom_navigation.dart';
import 'package:kb_mobile_app/models/beneficiary_filter.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:provider/provider.dart';

class BeneficiaryListFilter extends StatefulWidget {
  const BeneficiaryListFilter({Key? key}) : super(key: key);

  @override
  _BeneficiaryListFilterState createState() => _BeneficiaryListFilterState();
}

class _BeneficiaryListFilterState extends State<BeneficiaryListFilter> {
  Widget makeFilterDismissible({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );

  List<BeneficiaryFilter> getFilterMetadata(
      InterventionCard currentIntervention) {
    final List<BeneficiaryFilter> filters =
        BeneficiaryFilter.getBeneficiaryFilters(currentIntervention);

    return filters
        .where((BeneficiaryFilter filter) =>
            filter.interventions!.isEmpty ||
            filter.interventions!.contains(currentIntervention.id))
        .toList();
  }

  void onApplyFilters(InterventionCard currentIntervention) {
    String intervention = currentIntervention.id ?? '';
    List<Map<String, dynamic>> filters =
        BeneficiaryFilter.getBeneficiaryFilterByIntervention(
            context, intervention);
    if (intervention == 'ovc') {
      Provider.of<OvcInterventionListState>(context, listen: false)
          .setOvcFilters(filters);
    } else if (intervention == 'dreams') {
      Provider.of<DreamsInterventionListState>(context, listen: false)
          .setAgywFilters(filters);
    } else if (intervention == 'ogac') {
      Provider.of<OgacInterventionListState>(context, listen: false)
          .setOgacFilter(filters);
    } else if (intervention == 'education') {
      InterventionBottomNavigation currentTab =
          Provider.of<InterventionBottomNavigationState>(context, listen: false)
              .getCurrentInterventionBottomNavigation(currentIntervention);
      if (currentTab.id == 'lbse') {
        Provider.of<EducationLbseInterventionState>(context, listen: false)
            .setLbseFilters(filters);
      } else if (currentTab.id == 'bursary') {
        Provider.of<EducationBursaryInterventionState>(context, listen: false)
            .setBursaryFilters(filters);
      }
    } else if (intervention == 'pp_prev') {
      Provider.of<PpPrevInterventionState>(context, listen: false)
          .setPpPrevFilters(filters);
    } else {
      print('filtering $intervention');
    }

    Navigator.of(context).pop();
  }

  Widget _buildFilterWidget(
      BeneficiaryFilter filter, InterventionCard currentIntervention) {
    Color filterColor = currentIntervention.primaryColor ?? Colors.blue;
    return Container(
        padding: EdgeInsets.only(bottom: 8.0),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            childrenPadding:
                EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
            title: Text(
              filter.name,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            children: [filter.filterInput],
            iconColor: filterColor,
            textColor: filterColor,
          ),
        ));
  }

  void onClearFilters(BuildContext context) {
    Provider.of<BeneficiaryFilterState>(context, listen: false).clearFilters();
    Provider.of<DreamsInterventionListState>(context, listen: false)
        .clearAllDreamsFilters();
    Provider.of<OgacInterventionListState>(context, listen: false)
        .clearOgacFilter();
    Provider.of<PpPrevInterventionState>(context, listen: false)
        .clearPpPrevFilters();
    Provider.of<EducationLbseInterventionState>(context, listen: false)
        .clearLbseFilters();
    Provider.of<EducationBursaryInterventionState>(context, listen: false)
        .clearBursaryFilters();
    Provider.of<OvcInterventionListState>(context, listen: false)
        .clearOvcFilters();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return makeFilterDismissible(
        child: DraggableScrollableSheet(
      initialChildSize: 0.8,
      minChildSize: 0.5,
      maxChildSize: 0.8,
      builder: (BuildContext context, ScrollController scrollController) {
        return Consumer<InterventionCardState>(
            builder: (context, interventionCardState, child) {
          List<BeneficiaryFilter> filters = getFilterMetadata(
              interventionCardState.currentInterventionProgram);
          return Container(
            padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: Colors.white),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Filters',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16.0),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: InkWell(
                          onTap: () => onClearFilters(context),
                          child: Text(
                            'Clear All',
                            style: TextStyle(
                                color: interventionCardState
                                    .currentInterventionProgram.primaryColor),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                LineSeparator(
                    color: interventionCardState
                        .currentInterventionProgram.countLabelColor!),
                Flexible(
                    child: ListView(
                  padding: EdgeInsets.all(8.0),
                  children: filters
                      .map((BeneficiaryFilter filter) => _buildFilterWidget(
                          filter,
                          interventionCardState.currentInterventionProgram))
                      .toList(),
                )),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    color: interventionCardState
                        .currentInterventionProgram.primaryColor,
                  ),
                  padding: EdgeInsets.only(
                    right: 5.0,
                  ),
                  child: TextButton(
                    onPressed: () => onApplyFilters(
                        interventionCardState.currentInterventionProgram),
                    // onPressed: () => onClearFilters(context),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                        "Apply filters",
                        style: TextStyle(
                          color: Color(0xFFFAFAFA),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom))
              ],
            ),
          );
        });
      },
    ));
  }
}
