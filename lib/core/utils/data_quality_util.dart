import 'package:kb_mobile_app/core/constants/pagination.dart';

class DataQualityUtil {
  List<int> getPagination(int total) {
    int pageSize = PaginationConstants.searchingPaginationLimit;
    List<int> pagination = [];
    for (int page = 0; page <= (total / pageSize).ceil(); page++) {
      pagination.add(page);
    }
    return pagination;
  }
}
