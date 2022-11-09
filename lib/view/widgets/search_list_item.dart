import 'package:flutter/material.dart';
import 'package:new_joiner/view/styles/colours.dart' as clr;
import 'package:new_joiner/view/widgets/favourite_button.dart';

import '../pages/package_detail_page.dart';

class SearchListItem extends StatelessWidget {
  final String title;
  const SearchListItem({super.key, required this.title});

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
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PackageDetailProvider(package: title)));
          },
          icon: const Icon(Icons.arrow_forward_ios_rounded),
          iconSize: 12,
          color: clr.TextColorDefocused,
        )
      ]),
    );
  }
}
