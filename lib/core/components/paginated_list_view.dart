import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';

class CustomPaginatedListView extends StatelessWidget {
  final Function childBuilder;
  final PagingController pagingController;
  final Widget emptyListWidget;
  final Widget errorWidget;

  const CustomPaginatedListView(
      {Key key,
      @required this.childBuilder,
      @required this.pagingController,
      @required this.emptyListWidget,
      @required this.errorWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PagedListView(
          padding: EdgeInsets.only(top: 20.0),
          primary: true,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          pagingController: pagingController,
          builderDelegate: PagedChildBuilderDelegate(
            noItemsFoundIndicatorBuilder: (context) => emptyListWidget,
            firstPageProgressIndicatorBuilder: (context) => Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Center(
                child: CircularProcessLoader(
                  color: Colors.blueGrey,
                ),
              ),
            ),
            firstPageErrorIndicatorBuilder: (context) => errorWidget,
            newPageProgressIndicatorBuilder: (context) => Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Center(
                child: CircularProcessLoader(
                  color: Colors.blueGrey,
                ),
              ),
            ),
            itemBuilder: childBuilder,
          )),
    );
  }
}
