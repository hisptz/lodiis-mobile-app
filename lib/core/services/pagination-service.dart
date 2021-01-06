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
  static void assignPagesToController(PagingController pagingController,
      List ovcList, int pageKey, int numberOfPages) {
    if (pageKey == (numberOfPages - 1)) {
      pagingController.appendLastPage(ovcList);
    } else {
      pagingController.appendPage(ovcList, (pageKey + 1));
    }
  }


}
