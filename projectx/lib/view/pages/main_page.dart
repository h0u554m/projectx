import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projectx/view/pages/projects/project_page.dart';

import '../widgets/gradient_tab_Indicator.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    //main tabs page
    return Scaffold(
      backgroundColor: Colors.black,
      //tab view
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(),
          Container(),
          const ProjectPage(),
        ],
      ),
      //bottom navigation bar
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height / 10,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              Color(0xFFC20EA1),
              Color(0xFFDD2D7F),
              Color(0xFFEE4C5E),
              Color(0xFFF46D41),
            ],
            stops: [0.0182, 0.348, 0.6908, 1.0],
          ),
        ),
        child: TabBar(
          unselectedLabelColor: Colors.grey,
          indicator: GradientTabIndicator(
            away: 15,
            colors: const [
              Color(0xFFC20EA1),
              Color(0xFFDD2D7F),
              Color(0xFFEE4C5E),
              Color(0xFFF46D41),
            ], // Specify the gradient colors
          ),
          controller: _tabController,
          onTap: (index) {
            setState(() {
              _tabController.index = index;
            });
          },
          tabs: [
            //all image in svg
            Tab(
              icon: Container(
                decoration: BoxDecoration(
                  border: _tabController.index == 0
                      ? const Border(
                          bottom: BorderSide(
                            width: 2,
                            color: Color(0xFFDD2D7F),
                          ),
                        )
                      : null,
                ),
                child: SvgPicture.asset(
                  "assets/icons/airline_stops.svg",
                  semanticsLabel: '',
                  // ignore: deprecated_member_use
                  color: _tabController.index == 0 ? Colors.white : Colors.grey,
                ),
              ),
            ),
            Tab(
              icon: Container(
                decoration: BoxDecoration(
                  border: _tabController.index == 1
                      ? const Border(
                          bottom: BorderSide(
                            width: 2,
                            color: Color(0xFFDD2D7F),
                          ),
                        )
                      : null,
                ),
                child: SvgPicture.asset(
                  "assets/icons/calendar_month.svg",
                  semanticsLabel: '',
                  // ignore: deprecated_member_use
                  color: _tabController.index == 1 ? Colors.white : Colors.grey,
                ),
              ),
            ),
            Tab(
              icon: Container(
                decoration: BoxDecoration(
                  border: _tabController.index == 2
                      ? const Border(
                          bottom: BorderSide(
                            width: 2,
                            color: Color(0xFFDD2D7F),
                          ),
                        )
                      : null,
                ),
                child: SvgPicture.asset(
                  "assets/icons/fact_check.svg",
                  semanticsLabel: '',
                  // ignore: deprecated_member_use
                  color: _tabController.index == 2 ? Colors.white : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
