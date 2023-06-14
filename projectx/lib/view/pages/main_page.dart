import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Container(), // Replace with your home widget
    Container(), // Replace with your settings widget
    Container(), // Replace with your notifications widget
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height / 10,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFC20EA1),
              Color(0xFFDD2D7F),
              Color(0xFFEE4C5E),
              Color(0xFFF46D41),
            ],
            stops: [0.0182, 0.348, 0.6908, 1.0],
          ),
        ),
        child: BottomNavigationBar(
          elevation: 2,
          backgroundColor: Colors.transparent,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                  border: _currentIndex == 0
                      ? const Border(
                          bottom: BorderSide(
                            width: 2,
                            color: Color(0xFFDD2D7F),
                          ),
                        )
                      : null,
                ),
                child: Image.asset(
                  'assets/icons/maps.png',
                  width: 24,
                  height: 24,
                  color: Colors.white,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                  border: _currentIndex == 1
                      ? const Border(
                          bottom: BorderSide(
                            width: 2,
                            color: Color(0xFFDD2D7F),
                          ),
                        )
                      : null,
                ),
                child: Image.asset(
                  'assets/icons/calendar_month.png',
                  width: 24,
                  height: 24,
                  color: Colors.white,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                  border: _currentIndex == 2
                      ? const Border(
                          bottom: BorderSide(
                            width: 2,
                            color: Color(0xFFDD2D7F),
                          ),
                        )
                      : null,
                ),
                child: Image.asset(
                  'assets/icons/projects.png',
                  width: 24,
                  height: 24,
                  color: Colors.white,
                ),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
