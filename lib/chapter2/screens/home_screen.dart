import 'package:flutter/material.dart';
import 'package:hoc_flutter/chapter2/models/models.dart';
import 'package:hoc_flutter/chapter2/screens/explore_screen.dart';
import 'package:hoc_flutter/chapter2/screens/grocery_screen.dart';
import 'package:hoc_flutter/chapter2/screens/recipes_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int _selectedIndex = 0;
  static List<Widget> pages = [
    ExploreScreen(),RecipeScreen(),GroceryScreen()
  ];
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(builder: (context, tabManager, child){
      return Scaffold(
        appBar: AppBar(title: const Text('Fooderlich')),
        body: IndexedStack(children: pages, index: tabManager.selectedTab),
        // pages[tabManager.selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
          currentIndex: tabManager.selectedTab,
          onTap: (index){
            tabManager.goToTab(index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Recipes'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'To Buy')
          ],
        ),
      );
    });
    
  }
}