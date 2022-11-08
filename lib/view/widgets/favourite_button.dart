import 'package:flutter/material.dart';
import 'package:new_joiner/local_storage/setItems.dart';
import 'package:new_joiner/viewmodels/local/sync_favourite_package.dart';
import 'package:provider/provider.dart';

class FavouriteButton extends StatelessWidget {
  final String package;
  const FavouriteButton({super.key, required this.package});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final isFavourited =
            context.watch<SyncFavPackages>().favPacks.contains(package);
        return IconButton(
          icon: isFavourited
              ? const Icon(
                  Icons.favorite,
                  color: Colors.pink,
                )
              : const Icon(Icons.favorite_outline),
          onPressed: () async {
            if (isFavourited) {
              // means to unfavourite
              removeFavourite(package);
            } else {
              // means to add to favourites
              addFavourite(package);
            }
            // context.read<SyncFavPackages>().refresh(); //
            await Provider.of<SyncFavPackages>(context, listen: false)
                .refresh();
          },
        );
      },
    );
  }
}
