import 'package:flutter/material.dart';

class DreamsRecordsPage extends StatefulWidget {
  const DreamsRecordsPage({
    Key? key,
    required this.tabsController,
    this.tabsVieItems = const [],
  }) : super(key: key);

  final List<Widget> tabsVieItems;
  final TabController tabsController;

  @override
  State<DreamsRecordsPage> createState() => _DreamsRecordsPageState();
}

class _DreamsRecordsPageState extends State<DreamsRecordsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: widget.tabsController,
        children: widget.tabsVieItems.map((Widget tab) => tab).toList(),
      ),
    );
  }
}
