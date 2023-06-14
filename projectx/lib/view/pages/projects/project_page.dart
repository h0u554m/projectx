import 'package:flutter/material.dart';
import '../../widgets/gradient_tab_Indicator.dart';
import 'completed_page.dart';
import 'progress_page.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Widget> _widgets = [
    const ProgressPage(),
    const CompletedPage(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _widgets.length,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.black,
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(left: 18.0),
            child: Text("Projects"),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicator: GradientTabIndicator(
            colors: const [
              Color(0xFFC20EA1),
              Color(0xFFDD2D7F),
              Color(0xFFEE4C5E),
              Color(0xFFF46D41),
            ], // Specify the gradient colors
          ),
          tabs: const [
            Tab(text: 'Progress'),
            Tab(text: 'Completed'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _widgets,
      ),
    );
  }
}
