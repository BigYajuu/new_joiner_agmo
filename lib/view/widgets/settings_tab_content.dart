import 'package:flutter/material.dart';
import 'package:new_joiner/nagivations/uris.dart';
import 'package:new_joiner/view/widgets/generic_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsTabContent extends StatelessWidget {
  const SettingsTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Center(child: Image.asset('assets/flutter_logo.png', height: 200)),
          const SizedBox(height: 15),
          Text("pub.dev Package Searcher",
              style: Theme.of(context).textTheme.headline5),
          const SizedBox(height: 15),
          const Text(
              "A simple pub.dev package searcher primarily to showcase how a generic app in Flutter can be done. This also serves as a test run on the usage of Providers. Credits goes to the pub.dev team for allowing public consumption of their APIs."),
          const SizedBox(
            height: 10,
          ),
          // Buttons at the bottom
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GenericButton(
                  onPressed: () async {
                    await launchUrl(toFlutterDev);
                  },
                  buttonContent: const Text('Visit flutter.dev')),
              const SizedBox(
                width: 20,
              ),
              GenericButton(
                  onPressed: () async {
                    await launchUrl(toPubDev);
                  },
                  buttonContent: const Text('Visit pub.dev'))
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          GenericButton(
              onPressed: () async {
                await launchUrl(toRiverpodDev);
              },
              buttonContent: const Text('Visit riverpod.dev')),
          const SizedBox(height: 15),
          // App version and build number
          FutureBuilder(
            future: PackageInfo.fromPlatform(),
            builder: (context, AsyncSnapshot<PackageInfo> snapshot) {
              if (snapshot.hasData) {
                return Text(
                    "${snapshot.data!.version} (${snapshot.data!.buildNumber})");
              }
              return const Text("");
            },
          )
        ],
      ),
    ));
  }
}
