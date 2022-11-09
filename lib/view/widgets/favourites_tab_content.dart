import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_joiner/view/pages/package_detail_page.dart';
import 'package:new_joiner/view/widgets/search_list_item.dart';
import 'package:new_joiner/viewmodels/local/sync_favourite_package.dart';
import 'package:new_joiner/viewmodels/query_package_detailed.dart';
import 'package:provider/provider.dart';

// DEPRICATED
class FavouritesTabProvider extends StatelessWidget {
  // Acts as provider
  const FavouritesTabProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SyncFavPackages(),
      child: const FavouritesTabContent(),
    );
  }
}

class FavouritesTabContent extends StatelessWidget {
  const FavouritesTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.watch<SyncFavPackages>().favPacks;
    return Column(children: [
      Expanded(
        child: Builder(builder: (context) {
          return data.isNotEmpty
              ? ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SearchListItem(title: data[index]);
                  })
              : const Center(child: Text('No Favourites... :('));
          // return SizedBox();
        }),
      )
    ]);
  }
}
