import 'package:flutter/material.dart';
import 'package:mr_shop/screen/cartscreen.dart';

import 'package:mr_shop/screen/favoritescreen.dart';
import 'package:mr_shop/screen/homescreen.dart';
import 'package:mr_shop/screen/profilescreen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selected = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const CartScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selected],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 43, 68, 80),
                spreadRadius: 0,
                blurRadius: 8),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: BottomNavigationBar(
            selectedItemColor: const Color.fromARGB(255, 10, 219, 122),
            unselectedItemColor: const Color.fromARGB(255, 43, 68, 80),
            showUnselectedLabels: true,
            currentIndex: selected,
            onTap: (index) {
              setState(() {
                selected = index;
              });
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.card_travel_outlined), label: "Cart"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline), label: "Favorite"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "my account")
            ],
          ),
        ),
      ),
    );
  }
}
