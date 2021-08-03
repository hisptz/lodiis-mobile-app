import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/models/index_contact_followup_model.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/pages/agyw_dreams_index_contact_followup.dart';
import 'package:provider/provider.dart';

class DreamsHTSIndexContactFollowUpListCard extends StatelessWidget {
  final IndexContactFollowUpModel indexContactFollowUpModel;
  final int followUpNo;
  final bool isEditable;

  const DreamsHTSIndexContactFollowUpListCard({
    Key key,
    @required this.indexContactFollowUpModel,
    this.followUpNo,
    this.isEditable,
  }) : super(key: key);

  void updateFormState(
    BuildContext context,
    bool isEditableMode,
  ) {
    Events eventData = indexContactFollowUpModel.eventData;
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    if (eventData != null) {
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventDate', eventData.eventDate);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventId', eventData.event);
      for (Map dataValue in eventData.dataValues) {
        if (dataValue['value'] != '') {
          Provider.of<ServiceFormState>(context, listen: false)
              .setFormFieldState(dataValue['dataElement'], dataValue['value']);
        }
      }
    }
  }

  onViewFollowUp(BuildContext context) {
    updateFormState(context, false);
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => AgywDreamsIndexFollowUp()));
  }

  onEditFollowUp(BuildContext context) {
    updateFormState(context, true);
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => AgywDreamsIndexFollowUp()));
  }

  @override
  Widget build(BuildContext context) {
    double iconHeight = 20;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 17.0,
      ),
      child: MaterialCard(
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: RichText(
                    text: TextSpan(
                      text: "Follow Up " + followUpNo.toString(),
                      style: TextStyle().copyWith(
                        color: Color(0xFF05131B),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )),
                  Container(
                    child: RichText(
                        text: TextSpan(
                      text: indexContactFollowUpModel.date,
                      style: TextStyle().copyWith(
                        color: Color(0xFF82898D),
                        fontSize: 12.0,
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                  ),
                  Row(
                    children: [
                      Visibility(
                        visible: isEditable ?? false,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 5.0,
                          ),
                          child: InkWell(
                              onTap: () => onEditFollowUp(context),
                              child: Container(
                                height: iconHeight,
                                width: iconHeight,
                                margin: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                child: SvgPicture.asset(
                                  'assets/icons/edit_icon.svg',
                                  color: Color(0xFF1F8ECE),
                                ),
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 5.0,
                        ),
                        child: InkWell(
                            onTap: () => onViewFollowUp(context),
                            child: Container(
                              height: iconHeight,
                              width: iconHeight,
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              child: SvgPicture.asset(
                                'assets/icons/expand_icon.svg',
                                color: Color(0xFF1F8ECE),
                              ),
                            )),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
