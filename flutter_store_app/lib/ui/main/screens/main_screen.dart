import 'package:flutter/material.dart';
import 'package:flutter_store_app/core/gen/assets.gen.dart';

import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = '/mainScreen';

  final StatefulNavigationShell child;
  const MainScreen({Key? key, required this.child}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> bottomNavBarLabels = [
    "Home",
    "Favorite",
    "Stores",
    "Cart",
    "Account",
  ];

  List<Widget> bottomNavBarIcons = [
    Image.asset(
      Assets.icons.home.path,
      width: 25,
    ),
    Image.asset(
      Assets.icons.love.path,
      width: 25,
    ),
    Image.asset(
      Assets.icons.mart.path,
      width: 25,
    ),
    Image.asset(
      Assets.icons.cart.path,
      width: 25,
    ),
    Image.asset(
      Assets.icons.userPng.path,
      width: 25,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: widget.child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.child.currentIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          widget.child.goBranch(
            value,
            initialLocation: value == widget.child.currentIndex,
          );
        },
        items: List.generate(
          bottomNavBarLabels.length,
          (index) => BottomNavigationBarItem(
            icon: bottomNavBarIcons[index],
            label: bottomNavBarLabels[index],
          ),
        ),
      ),
    );
  }
}
