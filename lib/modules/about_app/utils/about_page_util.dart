import 'package:flutter/material.dart';

class AboutPageUtil {
  static TableRow getTableRowContent(String tableRowKey, String tableRowValue) {
    return TableRow(
      children: [
        TableCell(
          child: Container(
            padding: const EdgeInsets.only(
              top: 5.0,
            ),
            child: Text(
              tableRowKey,
              style: const TextStyle().copyWith(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        TableCell(
          child: Container(
            padding: const EdgeInsets.only(
              top: 5.0,
            ),
            child: Text(
              tableRowValue,
              style: const TextStyle().copyWith(
                fontSize: 12.0,
              ),
            ),
          ),
        )
      ],
    );
  }
}
