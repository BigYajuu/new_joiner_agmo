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
    ], child: SearchTabContent());
  }
}

class SearchTabContent extends StatelessWidget {
  final void Function(String)? onChanged;

  const SearchTabContent({super.key, this.onChanged});

  // @override
  // void initState() {
  //   _sc.addListener(() {
  //     if (_sc.position.atEdge) {
  //       bool isTop = _sc.position.pixels == 0;
  //       if (!isTop) {
  //         // Meaning reached bottom
  //       }
  //     }
  //   });
  // }

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
              return NotificationListener<ScrollNotification>(
                onNotification: (scrollEnd) {
                  final metrics = scrollEnd.metrics;
                  if (metrics.atEdge) {
                    bool isTop = metrics.pixels == 0;
                    if (!isTop) {
                      // Meaning reaching bottom
                      context.read<QueryPackages>().query();
                    }
                  }
                  return true;
                },
                // When no packages exist in the pool
                child: data.isEmpty
                    ? const Center(
                        child: Text("No data :("),
                      )
                    : ListView.builder(
                        itemCount: data.length + 1,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          if (index < data.length) {
                            return SearchListItem(
                              title: data[index].package,
                            );
                          } else {
                            // Footer of the list
                            return Center(
                                child: context.read<QueryPackages>().isLoading
                                    // When loading - circular animation
                                    ? const CircularProgressIndicator()
                                    // When not loading - reached to the end
                                    : const Text("End of the Page"));
                          }
                        },
                      ),
              );
            },
          ),
        )
      ],
    );
  }
}
