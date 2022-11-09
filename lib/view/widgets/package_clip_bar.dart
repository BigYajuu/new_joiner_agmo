import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_joiner/view/widgets/favourite_button.dart';

class PackageClipBar extends StatelessWidget {
  final String package;
  final String version;
  const PackageClipBar(
      {super.key, required this.package, required this.version});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(package, style: Theme.of(context).textTheme.headline5),
        const SizedBox(width: 8),
        Text(version, style: Theme.of(context).textTheme.headline5),
        IconButton(
          icon: const Icon(Icons.copy),
          onPressed: () {
            Clipboard.setData(ClipboardData(text: "$package $version"));
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Copied to clipboard'),
              backgroundColor: Colors.green,
            ));
          },
        ),
        Expanded(
          child: Align(
              alignment: Alignment.centerRight,
              child: FavouriteButton(package: package)),
        )
      ],
    );
  }
}
