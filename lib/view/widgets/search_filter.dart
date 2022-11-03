import 'package:flutter/material.dart';
import 'package:new_joiner/api/routers/top.dart';

class SearchFilter extends StatelessWidget {
  final SortKw initialValue;
  final void Function(SortKw) onSelected;

  const SearchFilter(
      {super.key, required this.onSelected, required this.initialValue});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SortKw>(
        initialValue: initialValue,
        onSelected: onSelected,
        icon: const Icon(Icons.filter_list),
        itemBuilder: (BuildContext context) => <PopupMenuEntry<SortKw>>[
              const PopupMenuItem<SortKw>(
                value: SortKw.top,
                child: Text('Item 1'),
              ),
              const PopupMenuItem<SortKw>(
                value: SortKw.created,
                child: Text('Item 2'),
              ),
              const PopupMenuItem<SortKw>(
                value: SortKw.updated,
                child: Text('Item 3'),
              ),
            ]);
  }
}
