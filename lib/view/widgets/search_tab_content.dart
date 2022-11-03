import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_joiner/api/routers/top.dart';
import 'package:new_joiner/view/widgets/search_bar.dart';
import 'package:new_joiner/models/pub_package.dart';
import 'package:new_joiner/view/widgets/search_filter.dart';
import 'package:new_joiner/view/widgets/search_list_item.dart';
import 'package:new_joiner/viewmodels/query_pub_packages.dart';
import 'package:provider/provider.dart';

class SearchContainer extends StatelessWidget {
  // Acts as a provider that wraps the actual widget
  const SearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QueryPubPackages(),
      child: const _SearchContainer(),
    );
  }
}

class _SearchContainer extends StatelessWidget {
  final void Function(String)? onChanged;

  const _SearchContainer({this.onChanged});

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
                    context.read<QueryPubPackages>().query(kw: searchText);
                  },
                ),
              ),
              SearchFilter(
                onSelected: (selectedSort) {
                  context.read<QueryPubPackages>().query(sortKw: selectedSort);
                },
                initialValue: context.watch<QueryPubPackages>().currSortKw,
              )
            ],
          ),
        ),
        Expanded(
          child: Builder(
            builder: (context) {
              final data = context.watch<QueryPubPackages>().pubPackagePool;

              return ListView.builder(
                itemCount: data.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return SearchListItem(
                    title: data[index].package,
                    onPressed: () {
                      // TO PACKAGE PAGE
                    },
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
