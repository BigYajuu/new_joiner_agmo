import 'package:flutter/material.dart';
import 'package:new_joiner/view/widgets/custom_btm_nav.dart';
import 'package:new_joiner/view/widgets/favourites_tab_content.dart';
import 'package:new_joiner/view/widgets/search_tab_content.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currIndex = 0;

  // All windows by tabs
  List<Widget> allWindows = [
    const SearchTabProvider(),
    const FavouritesTabProvider(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: IndexedStack(
          index: _currIndex,
          children: allWindows,
        ),
      ),
      bottomNavigationBar: CustomBtmNavBar(
        selectedIndex: _currIndex,
        onTap: (index) {
          setState(() {
            _currIndex = index;
          });
        },
      ),
    );
  }
}
