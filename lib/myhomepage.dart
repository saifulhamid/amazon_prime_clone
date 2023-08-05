import 'package:amazon_clone/pages/downloads.dart';
import 'package:amazon_clone/pages/home.dart';
import 'package:amazon_clone/pages/search.dart';
import 'package:amazon_clone/pages/store.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final pages = [
    HomePage(),
    StorePage(),
    const DownloadsPage(),
    SearchPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: pages[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            currentIndex: _currentIndex,
            backgroundColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: _currentIndex == 0
                      ? const Icon(Icons.home)
                      : const Icon(
                          Icons.home_outlined,
                          color: Colors.grey,
                        ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: _currentIndex == 1
                      ? const Icon(Icons.storefront_rounded)
                      : const Icon(
                          Icons.storefront_outlined,
                          color: Colors.grey,
                        ),
                  label: 'Store'),
              BottomNavigationBarItem(
                  icon: _currentIndex == 2
                      ? const Icon(Icons.download_rounded)
                      : const Icon(
                          Icons.download_outlined,
                          color: Colors.grey,
                        ),
                  label: 'Downloads'),
              BottomNavigationBarItem(
                  icon: _currentIndex == 3
                      ? const Icon(Icons.search)
                      : const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                  label: 'Find'),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
