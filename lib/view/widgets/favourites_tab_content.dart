import 'package:flutter/widgets.dart';
import 'package:new_joiner/view/widgets/search_list_item.dart';
import 'package:new_joiner/viewmodels/local/sync_favourite_package.dart';
import 'package:provider/provider.dart';

class FavouritesTabProvider extends StatelessWidget {
  // Acts as provider
  const FavouritesTabProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SyncFavPackages(),
      child: const _FavouritesTabContent(),
    );
  }
}

class _FavouritesTabContent extends StatelessWidget {
  const _FavouritesTabContent();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: Builder(builder: (context) {
          final data = context.watch<SyncFavPackages>().favPacks;
          return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return SearchListItem(
                    title: data[index],
                    onPressed: () {
                      // TO PACKAGE PAGE
                    });
              });
        }),
      )
    ]);
  }
}
