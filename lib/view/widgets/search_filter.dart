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
                child: Text("Top"),
              ),
              const PopupMenuItem<SortKw>(
                value: SortKw.created,
                child: Text("Created"),
              ),
              const PopupMenuItem<SortKw>(
                value: SortKw.updated,
                child: Text("Updated"),
              ),
              const PopupMenuItem<SortKw>(
                value: SortKw.popularity,
                child: Text("Popularity"),
              ),
              const PopupMenuItem<SortKw>(
                value: SortKw.like,
                child: Text("Like"),
              ),
              const PopupMenuItem<SortKw>(
                value: SortKw.points,
                child: Text("Points"),
              ),
            ]);
  }
}
