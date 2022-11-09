import 'package:flutter/material.dart';
import 'package:new_joiner/view/widgets/search_bar.dart';
import 'package:new_joiner/view/widgets/search_filter.dart';
import 'package:new_joiner/view/widgets/search_list_item.dart';
import 'package:new_joiner/viewmodels/local/sync_favourite_package.dart';
import 'package:new_joiner/viewmodels/query_packages.dart';
import 'package:provider/provider.dart';

//DEPRICATED
class SearchTabProvider extends StatelessWidget {
  // Acts as a provider that wraps the actual widget
  const SearchTabProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => QueryPackages(),
      ),
      ChangeNotifierProvider(create: (_) => SyncFavPackages())
    ], child: const SearchTabContent());
  }
}

class SearchTabContent extends StatelessWidget {
  final void Function(String)? onChanged;

  const SearchTabContent({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Row(
            children: [
              Expanded(
                child: SearchBar(
                  kwOnChanged: (searchText) {
                    context.read<QueryPackages>().query(kw: searchText);
                  },
                ),
              ),
              SearchFilter(
                onSelected: (selectedSort) {
                  context.read<QueryPackages>().query(sortKw: selectedSort);
                },
                initialValue: context.watch<QueryPackages>().currSortKw,
              )
            ],
          ),
        ),
        Expanded(
          child: Builder(
            builder: (context) {
              final data = context.watch<QueryPackages>().packagePool;
              return ListView.builder(
                itemCount: data.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return SearchListItem(
                    title: data[index].package,
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}
