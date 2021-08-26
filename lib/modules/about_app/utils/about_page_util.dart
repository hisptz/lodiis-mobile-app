import 'package:flutter/material.dart';

class AboutPageUtil {
  static TableRow getTableRowContent(String tableRowKey, String tableRowValue) {
    return TableRow(
      children: [
        TableCell(
          child: Container(
            padding: EdgeInsets.only(
              top: 5.0,
            ),
            child: Text(
              tableRowKey,
              style: TextStyle().copyWith(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        TableCell(
          child: Container(
            padding: EdgeInsets.only(
              top: 5.0,
            ),
            child: Text(
              tableRowValue,
              style: TextStyle().copyWith(
                fontSize: 12.0,
              ),
            ),
          ),
        )
      ],
    );
  }
}
