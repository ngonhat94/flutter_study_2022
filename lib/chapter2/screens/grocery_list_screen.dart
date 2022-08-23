import 'package:flutter/material.dart';
import 'package:hoc_flutter/chapter2/components/grocery_tile.dart';
import 'package:hoc_flutter/chapter2/models/grocery_manager.dart';
import 'package:hoc_flutter/chapter2/screens/grocery_item_screen.dart';

class GroceryListScreen extends StatelessWidget {
  final GroceryManager manager;
  const GroceryListScreen({Key? key, required this.manager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final groceryItems = manager.groceryItems;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        itemBuilder: (context, index) {
          final item = groceryItems[index];
          return Dismissible(
            key: Key(item.id),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: const Icon(Icons.delete_forever, size: 50, color: Colors.white),
            ),
            onDismissed: (direction){
              manager.deleteItems(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${item.name} is dismissed'))
              );
            },
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => GroceryItemScreen(
                    originalItem: item,
                    onCreate: (item){}, onUpdate: (item){
                      manager.updateItem(item, index);
                      Navigator.pop(context);
                    })));
              },
              child: GroceryTile(
                key: Key(item.id),
                item: item,
                onComplete: (change){
                  if(change != null) {
                    manager.completeItem(index, change);
                  }
                },
              ),
            ),
          );
        },
        separatorBuilder: (context, index){
          return const SizedBox(height: 16,);
        }, itemCount: groceryItems.length),
    );
  }
}