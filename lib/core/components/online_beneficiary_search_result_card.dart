import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/models/online_beneficiary_search_result.dart';

class OnlineBeneficiarySearchResultCard extends StatelessWidget {
  final OnlineBeneficiarySearchResult searchResult;
  final Color? primaryColor;
  final Color? lineColor;

  const OnlineBeneficiarySearchResultCard(
      {Key? key, required this.searchResult, this.lineColor, this.primaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 15.0,
      ),
      child: MaterialCard(
          body: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 15.0,
                ),
                child: Row(
                  children: [
                    Text(
                      searchResult.toString(),
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 15.0,
              ),
              child: Column(
                children: [
                  Visibility(
                      visible: searchResult.primaryUIC != '',
                      child: SearchResultDetails(
                        label: 'Primary UIC',
                        value: searchResult.primaryUIC!,
                        primaryColor: primaryColor ?? Colors.blueGrey,
                      )),
                  Visibility(
                      visible: searchResult.location != '',
                      child: SearchResultDetails(
                        label: 'Location',
                        value: searchResult.location!,
                        primaryColor: primaryColor ?? Colors.blueGrey,
                      )),
                  Visibility(
                      visible: searchResult.sex != '',
                      child: SearchResultDetails(
                        label: 'Sex',
                        value: searchResult.sex!,
                        primaryColor: primaryColor ?? Colors.blueGrey,
                      )),
                  Visibility(
                      visible: searchResult.dateOfBirth != '',
                      child: SearchResultDetails(
                        label: 'Date of Birth',
                        value: searchResult.dateOfBirth!,
                        primaryColor: primaryColor ?? Colors.blueGrey,
                      )),
                  Visibility(
                      visible: searchResult.program != '',
                      child: SearchResultDetails(
                        label: 'Program',
                        value: searchResult.program!,
                        primaryColor: primaryColor ?? Colors.blueGrey,
                      )),
                ],
              ))
        ],
      )),
    );
  }
}

class SearchResultDetails extends StatelessWidget {
  final String label;
  final String value;
  final Color primaryColor;
  const SearchResultDetails(
      {Key? key,
      required this.label,
      required this.value,
      required this.primaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle().copyWith(
                color: primaryColor.withOpacity(0.6),
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value,
              style: TextStyle().copyWith(
                color: primaryColor.withOpacity(0.9),
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
