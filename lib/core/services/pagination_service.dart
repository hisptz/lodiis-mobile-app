import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PaginationService {
  static void initializePagination(
      {required bool mounted,
      required PagingController? pagingController,
      required Function fetchPage}) {
    try {
      if (mounted) {
        pagingController!.addPageRequestListener((pageKey) {
          fetchPage(pageKey);
        });
      } else {
        pagingController!.removePageRequestListener((pageKey) {
          fetchPage(pageKey);
        });
        pagingController.dispose();
      }
    } catch (e) {
      print(e);
    }
  }

  static void assignPagesToController(PagingController? pagingController,
      List beneficiaryList, int pageKey, int numberOfPages) {
    if (numberOfPages <= 0) {
      pagingController!.appendLastPage(beneficiaryList);
    } else {
      if (pageKey >= (numberOfPages - 1)) {
        pagingController!.appendLastPage(beneficiaryList);
      } else {
        pagingController!.appendPage(beneficiaryList, (pageKey + 1));
      }
    }
  }
}
