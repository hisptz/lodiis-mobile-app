import 'package:flutter/material.dart';

class EducationRecordsPage extends StatefulWidget {
  const EducationRecordsPage({
    Key? key,
    required this.tabsController,
    this.tabsVieItems = const [],
  }) : super(key: key);

  final List<Widget> tabsVieItems;
  final TabController tabsController;

  @override
  State<EducationRecordsPage> createState() => _EducationRecordsPageState();
}

class _EducationRecordsPageState extends State<EducationRecordsPage> {
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
