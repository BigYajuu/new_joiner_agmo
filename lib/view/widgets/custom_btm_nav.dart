import 'package:flutter/material.dart';
import 'package:new_joiner/view/styles/colours.dart' as clr;

class CustomBtmNavBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int)? onTap;

  const CustomBtmNavBar({super.key, required this.selectedIndex, this.onTap});

  static const itemSearch =
      BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search");
  static const itemFavourites =
      BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favourites");
  static const itemSettings =
      BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings");

  static const List<BottomNavigationBarItem> items = [
    itemSearch,
    itemFavourites,
    itemSettings
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: CustomBtmNavBar.items,
      currentIndex: selectedIndex,
      selectedItemColor: clr.SecondaryColorDark,
      onTap: onTap,
    );
  }
}

enum ButtonStatus {
  disabled(clr.Disabled),
  ready(clr.SecondaryColor),
  selected(clr.PrimaryColor);

  final Color getColour;
  const ButtonStatus(this.getColour);
}
