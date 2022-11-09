import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:new_joiner/view/widgets/package_clip_bar.dart';
import 'package:new_joiner/viewmodels/query_package_detailed.dart';
import 'package:new_joiner/view/styles/colours.dart' as clr;
import 'package:provider/provider.dart';

class PackageDetailProvider extends StatelessWidget {
  final String package;

  const PackageDetailProvider({super.key, required this.package});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QueryPackageDetailed(),
      child: PackageDetailPage(package: package),
    );
  }
}

class PackageDetailPage extends StatelessWidget {
  final String package;
  const PackageDetailPage({super.key, required this.package});

  @override
  Widget build(BuildContext context) {
    context.read<QueryPackageDetailed>().query(package: package);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Package Details"),
        ),
        body: Builder(builder: (context) {
          final packageObj = context.watch<QueryPackageDetailed>().packageObj;
          // return const CircularProgressIndicator();
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: context.read<QueryPackageDetailed>().isLoading
                ? const CircularProgressIndicator()
                : Column(
                    children: [
                      // Top
                      PackageClipBar(
                          package: packageObj!.name,
                          version: packageObj.latest.version),
                      // Publisher label
                      Row(
                        children: [
                          Text(
                            "Published ${Jiffy(packageObj.latest.published).fromNow()}",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 24,
                              width: 2,
                              child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: clr.TextColorDefocused)),
                            ),
                          ),
                          Text(
                            context.read<QueryPackageDetailed>().publisherId!,
                            style: Theme.of(context).textTheme.labelLarge,
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Desc.
                      Text(packageObj.latest.pubspec.description)
                    ],
                  ),
          );
        }));
  }
}
