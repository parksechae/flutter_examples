import 'package:flutter/material.dart';

getBottomNavigationBar(BuildContext context) {
  return BottomNavigationBar(
    onTap: (index) {
      if (index == 0) {
        Navigator.pushNamed(context, '/home');
      } else if (index == 1) {
        Navigator.pushNamed(context, '/js');
      } else if (index == 2) {
        Navigator.pushNamed(context, '/wmc');
      } else if (index == 3) {
        Navigator.pushNamed(context, '/iframe');
      }
    },
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        activeIcon: Icon(Icons.home_filled),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.radio_button_checked_outlined),
        activeIcon: Icon(Icons.radio_button_checked),
        label: 'JS Handler',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.check_box_outlined),
        activeIcon: Icon(Icons.check_box),
        label: 'Web Message Channel',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.list_alt_outlined),
        activeIcon: Icon(Icons.list_alt),
        label: 'Iframe',
      ),
    ],
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
  );
}
