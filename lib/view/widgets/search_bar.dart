import 'package:flutter/material.dart';
import 'package:new_joiner/view/widgets/search_filter.dart';
import 'package:new_joiner/api/routers/top.dart';

class SearchBar extends StatelessWidget {
  final void Function(String) kwOnChanged;

  const SearchBar({super.key, required this.kwOnChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: kwOnChanged,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Search for a package...',
      ),
    );
  }
}
