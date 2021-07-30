import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/intervention_bottom_navigation_state/intervention_bottom_navigation_state.dart';
import 'package:kb_mobile_app/app_state/ogac_intervention_list_state/ogac_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_intervention_list_state.dart';
import 'package:kb_mobile_app/core/components/data_download_message.dart';
import 'package:kb_mobile_app/core/components/input_fields/text_input_field_container.dart';
import 'package:kb_mobile_app/models/Intervention_bottom_navigation.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class InterventionAppBar extends StatefulWidget {
  const InterventionAppBar(
      {Key key,
      @required this.activeInterventionProgram,
      this.onClickHome,
      this.onAddHouseHold,
      this.onOpenMoreMenu,
      this.onAddAgywBeneficiary,
      this.onAddNoneAgywBeneficiary,
      this.onAddOgacBeneficiary})
      : super(key: key);

  final InterventionCard activeInterventionProgram;
  final VoidCallback onAddHouseHold;
  final VoidCallback onAddAgywBeneficiary;
  final VoidCallback onAddNoneAgywBeneficiary;
  final VoidCallback onAddOgacBeneficiary;
  final VoidCallback onClickHome;
  final VoidCallback onOpenMoreMenu;

  @override
  _InterventionAppBarState createState() => _InterventionAppBarState();
}

class _InterventionAppBarState extends State<InterventionAppBar> {
  bool isSearchActive = false;
  final PublishSubject<String> _searchedValued = PublishSubject<String>();
  InputField inputField = InputField(
    id: 'search',
    name: '',
    valueType: 'TEXT',
    inputColor: Colors.white,
  );

  void onActivateOrDeactivateSearch(
    BuildContext context,
  ) {
    String value = '';
    _searchedValued.add(value);
    isSearchActive = !isSearchActive;
    setState(() {});
    if (isSearchActive) {
      onSearchBeneficiary(context, value);
    } else {
      refreshBeneficiaryList(context);
    }
  }

  void refreshBeneficiaryList(BuildContext context) {
    if (widget.activeInterventionProgram.id == 'ogac') {
      Provider.of<OgacInterventionListState>(context, listen: false)
          .refreshOgacNumber();
    } else if (widget.activeInterventionProgram.id == 'dreams') {
      Provider.of<DreamsInterventionListState>(context, listen: false)
          .refreshBeneficiariesNumber();
    } else if (widget.activeInterventionProgram.id == 'ovc') {
      Provider.of<OvcInterventionListState>(context, listen: false)
          .refreshOvcNumber();
    }
  }

  void onSearchInputValueChange(BuildContext context, String value) {
    value = value.toLowerCase();
    _searchedValued.add(value);
    onSearchBeneficiary(context, value);
  }

  void onSearchBeneficiary(BuildContext context, String value) {
    _searchedValued
        .debounce((_) => TimerStream(true, Duration(milliseconds: 500)))
        .listen((searchedValue) async {
      if (widget.activeInterventionProgram.id == 'ogac') {
        Provider.of<OgacInterventionListState>(context, listen: false)
            .searchOgacList(searchedValue);
      } else if (widget.activeInterventionProgram.id == 'dreams') {
        Provider.of<DreamsInterventionListState>(context, listen: false)
            .searchAgywDreams(searchedValue);
      } else if (widget.activeInterventionProgram.id == 'ovc') {
        Provider.of<OvcInterventionListState>(context, listen: false)
            .searchHouseHold(searchedValue);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.activeInterventionProgram.primmaryColor,
      title: Row(
        children: [
          Container(
            child: GestureDetector(
              onTap: this.widget.onClickHome,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 9.0, horizontal: 13.5),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                                color: widget
                                    .activeInterventionProgram.svgIconColor)),
                        child: Row(
                          children: [
                            Container(
                              child: SvgPicture.asset(
                                widget.activeInterventionProgram.svgIcon,
                                color: widget
                                    .activeInterventionProgram.svgIconColor,
                                height: 19.2,
                                width: 19.2,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 20,
                              padding: EdgeInsets.only(top: 2),
                              child: Text(
                                widget.activeInterventionProgram.shortName,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Visibility(
              visible: isSearchActive,
              child: Container(
                margin: EdgeInsets.only(left: 5),
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                      color: widget.activeInterventionProgram.svgIconColor),
                ),
                child: TextInputFieldContainer(
                  inputField: inputField,
                  inputValue: '',
                  showInputCheckedIcon: false,
                  onInputValueChange: (dynamic value) =>
                      onSearchInputValueChange(context, value),
                ),
              ),
            ),
          )
        ],
      ),
      actions: [
        Container(
          child: IconButton(
            icon: Icon(isSearchActive ? Icons.search_off : Icons.search),
            onPressed: () => onActivateOrDeactivateSearch(context),
          ),
        ),
        Container(
          child: Visibility(
            visible: !isSearchActive,
            child: Consumer<InterventionBottomNavigationState>(
              builder: (context, interventionBottomNavigationState, child) {
                InterventionBottomNavigation
                    currentInterventionBottomNavigation =
                    interventionBottomNavigationState
                        .getCurrentInterventionBottomNavigation(
                  widget.activeInterventionProgram,
                );
                return Visibility(
                  visible: widget.activeInterventionProgram.id == 'ogac' ||
                      currentInterventionBottomNavigation != null &&
                          (currentInterventionBottomNavigation.id ==
                                  'enrollment' ||
                              currentInterventionBottomNavigation.id ==
                                  'noneAgyw'),
                  child: Container(
                    child: IconButton(
                      icon: SvgPicture.asset(
                        widget.activeInterventionProgram.id == 'dreams' ||
                                widget.activeInterventionProgram.id == 'ogac'
                            ? 'assets/icons/add-beneficiary.svg'
                            : 'assets/icons/add-house-hold.svg',
                      ),
                      onPressed: currentInterventionBottomNavigation.id ==
                              'noneAgyw'
                          ? widget.onAddNoneAgywBeneficiary
                          : widget.activeInterventionProgram.id == 'dreams'
                              ? widget.onAddAgywBeneficiary
                              : widget.activeInterventionProgram.id == 'ogac'
                                  ? widget.onAddOgacBeneficiary
                                  : widget.onAddHouseHold,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Container(
          child: Visibility(
            visible: !isSearchActive,
            child: IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: widget.onOpenMoreMenu,
            ),
          ),
        )
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: DataDownloadMessage(),
      ),
    );
  }
}
