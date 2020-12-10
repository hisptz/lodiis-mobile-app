import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/current_user_state/current_user_state.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:provider/provider.dart';

class ServiceCardBottonAction extends StatelessWidget {
  const ServiceCardBottonAction({
    Key key,
    this.onOpenPrepForm,
    this.onOpenHTSForm,
    this.onOpenSRHForm,
    this.onOpenCondomForm,
    this.onOpenContraceptivesForm,
    this.onOpenMSGHIVForm,
    this.onOpenANCForm,
    this.onOpenArtRefillForm,
    this.onOpenPEPForm,
    this.onOpenPostGBVForm,
    this.onOpenServiceForm,
  }) : super(key: key);

  final VoidCallback onOpenPrepForm;
  final VoidCallback onOpenHTSForm;
  final VoidCallback onOpenSRHForm;
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
              LineSeperator(
                color: Color(0xFFE9F4FA),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
                child: Row(
                  children: [
                    Visibility(
                      visible: currentUserState.canManageHts,
                      child: Expanded(
                        child: InkWell(
                          onTap: onOpenHTSForm,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 5.0,
                            ),
                            margin: EdgeInsets.symmetric(
                              vertical: 5.0,
                            ),
                            child: Center(
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
                    Visibility(
                      visible: currentUserState.canManageSrh,
                      child: Expanded(
                        child: InkWell(
                          onTap: onOpenSRHForm,
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
                              child: Text(
                                'SRH',
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
                    Visibility(
                      visible: currentUserState.canManagePrep,
                      child: Expanded(
                        child: InkWell(
                          onTap: onOpenPrepForm,
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
                    Visibility(
                      visible: currentUserState.canManageMSGHIV,
                      child: Expanded(
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
                    Visibility(
                      visible: currentUserState.canManageCondom,
                      child: Expanded(
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
                    Visibility(
                      visible: currentUserState.canManageContraceptives,
                      child: Expanded(
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
                    Visibility(
                      visible: currentUserState.canManageArtRefill,
                      child: Expanded(
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
                    Visibility(
                      visible: currentUserState.canManageAnc,
                      child: Expanded(
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
                    Visibility(
                      visible: currentUserState.canManagePOSTGBV,
                      child: Expanded(
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
                    Visibility(
                      visible: currentUserState.canManagePEP,
                      child: Expanded(
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
                    Visibility(
                      visible: currentUserState.canManageServiceForm,
                      child: Expanded(
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
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
