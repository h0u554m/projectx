import 'package:flutter/material.dart';

import 'completed_page.dart';
import 'progress_page.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  int _currentIndex = 0;

  final List<Widget> _widgets = [
    const ProgressPage(),
    const CompletedPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
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
            padding: EdgeInsets.all(8.0),
            child: Text("Projects"),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: Color(0xFF282828),
                width: 1.0,
              ),
            )),
            height: MediaQuery.of(context).size.height / 12,
            child: BottomNavigationBar(
              backgroundColor: Colors.black,
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              unselectedLabelStyle: const TextStyle(
                fontFamily: 'Lexend',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
                fontSize: 14,
                height: 1.71,
                color: Colors.grey,
              ),
              selectedLabelStyle: const TextStyle(
                fontFamily: 'Lexend',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
                fontSize: 14,
                height: 1.71,
                color: Colors.white,
              ),
              items: const [
                BottomNavigationBarItem(
                    icon: SizedBox(), label: 'Progress', tooltip: "Progress"),
                BottomNavigationBarItem(
                  icon: SizedBox(),
                  label: 'Completed',
                ),
              ],
            ),
          ),
          Expanded(
            child: _widgets[_currentIndex],
          ),
        ],
      ),
    );
  }
}
