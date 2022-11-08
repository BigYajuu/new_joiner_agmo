import 'package:flutter/material.dart';
import 'package:new_joiner/view/styles/colours.dart' as clr;
import 'package:new_joiner/view/widgets/favourite_button.dart';

class SearchListItem extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  const SearchListItem(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(children: [
        Builder(builder: (context) {
          return FavouriteButton(package: title);
        }),
        Expanded(child: Text(title)),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.arrow_forward_ios_rounded),
          iconSize: 12,
          color: clr.TextColorDefocused,
        )
      ]),
    );
  }
}
