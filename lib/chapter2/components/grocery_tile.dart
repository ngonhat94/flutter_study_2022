import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoc_flutter/chapter2/models/grocery_item.dart';
import 'package:intl/intl.dart';

class GroceryTile extends StatelessWidget {
  final GroceryItem item;
  final Function(bool?)? onComplete;
  final TextDecoration textDecoration;
  GroceryTile({
    Key? key, required this.item, this.onComplete
  }) : textDecoration = item.isComplete ? TextDecoration.lineThrough : TextDecoration.none,
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(width: 5, color: item.color, height: 80,),
              const SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: GoogleFonts.lato(
                      decoration: textDecoration,
                      fontSize: 21, fontWeight: FontWeight.bold)
                  ),
                  const SizedBox(height: 4),
                  buildDate(),
                  const SizedBox(height: 4),
                  buildImportance()
                ],
              )
            ],
          ),
          Row(
            children: [
              Text(
                item.quantity.toString(),
                style: GoogleFonts.lato(decoration: textDecoration, fontSize: 21)),
              buildCheckBox()
            ],
          )
        ],
      ),
    );
  }

  Widget buildImportance(){
    if (item.importance == Importance.low) {
      return Text('Low', style: GoogleFonts.lato(decoration: textDecoration));
    } else if (item.importance == Importance.medium) {
      return Text('Medium', style: GoogleFonts.lato(fontWeight: FontWeight.w800, decoration: textDecoration));
    } else if (item.importance == Importance.high) {
      return Text('High', style: GoogleFonts.lato(fontWeight: FontWeight.w900, decoration: textDecoration));
    } else {
      throw Exception('This importance type does not exist');
    }
  }

  Widget buildDate(){
    final dateFormater = DateFormat('MMMM dd h:mm a');
    final dateString = dateFormater.format(item.date);
    return Text(dateString, style: TextStyle(decoration: textDecoration));
  }
  Widget buildCheckBox(){
    return Checkbox(value: item.isComplete, onChanged: onComplete);
  }

}