import 'package:flutter/material.dart';
import 'package:hoc_flutter/chapter2/card1.dart';
import 'package:hoc_flutter/chapter2/card2.dart';
import 'package:hoc_flutter/chapter2/card3.dart';
import 'package:hoc_flutter/chapter2/fooderlich_theme.dart';

class Fooderlich extends StatefulWidget {
  const Fooderlich({Key? key}) : super(key: key);

  @override
  State<Fooderlich> createState() => _FooderlichState();
}

class _FooderlichState extends State<Fooderlich> {
  int _selectedIndex = 1;
  static List<Widget> pages = [
    Card1(),
    Card2(),
    Card3()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: Create theme
    final theme = FooderlichTheme.dark();
    // TODO: Apply Home widget
    // 3
    return MaterialApp(
      // TODO: Add theme
      theme: theme,
      home: Scaffold(
        // TODO: Style the title
      appBar: AppBar(
        title: Text('Fooderlich', style: theme.textTheme.headline6,)),
        // TODO: Style the body text
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Card'),
            BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Card2'),
            BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Card3')
          ],
        ),
    ),
    );
    
  }
}