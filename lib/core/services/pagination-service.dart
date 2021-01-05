import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PaginationService {
  static void initializePagination(
      {@required bool mounted,
      @required PagingController pagingController,
      @required Function fetchPage}) {
    try {
      if (mounted) {
        pagingController.addPageRequestListener((pageKey) {
          fetchPage(pageKey);
        });
      } else {
        pagingController.removePageRequestListener((pageKey) {
          fetchPage(pageKey);
        });
        pagingController.dispose();
      }
    } catch (e) {
      print(e);
    }
  }
}
