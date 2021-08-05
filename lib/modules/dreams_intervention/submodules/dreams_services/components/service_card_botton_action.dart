import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:kb_mobile_app/app_state/current_user_state/current_user_state.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:provider/provider.dart';

class ServiceCardButtonAction extends StatelessWidget {
  const ServiceCardButtonAction({
    Key key,
    this.agywBeneficiary,
    this.onOpenPrepLongForm,
    this.onOpenPrepShortForm,
    this.onOpenHTSShortForm,
    this.onOpenHTSLongForm,
    this.onOpenCondomForm,
    this.onOpenContraceptivesForm,
    this.onOpenMSGHIVForm,
    this.onOpenANCForm,
    this.onOpenArtRefillForm,
    this.onOpenPEPForm,
    this.onOpenPostGBVForm,
    this.onOpenServiceForm,
  }) : super(key: key);

  final AgywDream agywBeneficiary;
  final VoidCallback onOpenPrepLongForm;
  final VoidCallback onOpenPrepShortForm;
  final VoidCallback onOpenHTSShortForm;
  final VoidCallback onOpenHTSLongForm;
  final VoidCallback onOpenMSGHIVForm;
  final VoidCallback onOpenCondomForm;
  final VoidCallback onOpenContraceptivesForm;
  final VoidCallback onOpenPostGBVForm;
  final VoidCallback onOpenPEPForm;
  final VoidCallback onOpenANCForm;
  final VoidCallback onOpenArtRefillForm;
  final VoidCallback onOpenServiceForm;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<CurrentUserState>(
        builder: (context, currentUserState, child) {
          return Column(
            children: [
              LineSeparator(
                color: Color(0xFFE9F4FA),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
                child: Container(
                  height: 50.0,
                  child: Center(
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Visibility(
                          visible: currentUserState.canManageHtsLongForm ||
                              currentUserState.canManageHtsShortForm,
                          child: Container(
                            child: InkWell(
                              onTap: currentUserState.canManageHtsShortForm
                                  ? onOpenHTSShortForm
                                  : onOpenHTSLongForm,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'HTS',
                                      style: TextStyle().copyWith(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFF1F8ECE),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: (currentUserState.canManagePrepLongForm ||
                                  currentUserState.canManagePrepShortForm) &&
                              int.parse(agywBeneficiary.age ?? '0') >= 15,
                          child: Container(
                            child: InkWell(
                              onTap: currentUserState.canManagePrepShortForm
                                  ? onOpenPrepShortForm
                                  : onOpenPrepLongForm,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      width: 1,
                                      color: Color(0xFF8EBAD3),
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'PREP',
                                      style: TextStyle().copyWith(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFF1F8ECE),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: currentUserState.canManageMSGHIV,
                          child: Container(
                            child: InkWell(
                              onTap: onOpenMSGHIVForm,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      width: 1,
                                      color: Color(0xFF8EBAD3),
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'HIV Messaging',
                                      style: TextStyle().copyWith(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFF1F8ECE),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: currentUserState.canManageCondom,
                          child: Container(
                            child: InkWell(
                              onTap: onOpenCondomForm,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      width: 1,
                                      color: Color(0xFF8EBAD3),
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'CONDOMS',
                                      style: TextStyle().copyWith(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFF1F8ECE),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: currentUserState.canManageContraceptives,
                          child: Container(
                            child: Container(
                              child: InkWell(
                                onTap: onOpenContraceptivesForm,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5.0,
                                  ),
                                  margin: EdgeInsets.symmetric(
                                    vertical: 5.0,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      left: BorderSide(
                                        width: 1,
                                        color: Color(0xFF8EBAD3),
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'CONTRACEPTIVES',
                                        style: TextStyle().copyWith(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xFF1F8ECE),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: currentUserState.canManageArtRefill,
                          child: Container(
                            child: Container(
                              child: InkWell(
                                onTap: onOpenArtRefillForm,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5.0,
                                  ),
                                  margin: EdgeInsets.symmetric(
                                    vertical: 5.0,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      left: BorderSide(
                                        width: 1,
                                        color: Color(0xFF8EBAD3),
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'ART RE-FILL',
                                        style: TextStyle().copyWith(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xFF1F8ECE),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: currentUserState.canManageAnc,
                          child: Container(
                            child: InkWell(
                              onTap: onOpenANCForm,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      width: 1,
                                      color: Color(0xFF8EBAD3),
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'ANC',
                                      style: TextStyle().copyWith(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFF1F8ECE),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: currentUserState.canManagePOSTGBV,
                          child: Container(
                            child: InkWell(
                              onTap: onOpenPostGBVForm,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      width: 1,
                                      color: Color(0xFF8EBAD3),
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'POST GBV',
                                      style: TextStyle().copyWith(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFF1F8ECE),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: currentUserState.canManagePEP,
                          child: Container(
                            child: InkWell(
                              onTap: onOpenPEPForm,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      width: 1,
                                      color: Color(0xFF8EBAD3),
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'PEP',
                                      style: TextStyle().copyWith(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFF1F8ECE),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: currentUserState.canManageServiceForm,
                          child: Container(
                            child: InkWell(
                              onTap: onOpenServiceForm,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      width: 1,
                                      color: Color(0xFF8EBAD3),
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'SERVICE FORM',
                                      style: TextStyle().copyWith(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFF1F8ECE),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
