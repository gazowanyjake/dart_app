import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import '../Providers/game.dart';

class MyDropDownButton extends StatefulWidget {
  MyDropDownButton({
    required this.title,
    required this.text,
    this.width = 65,
    this.color = Colors.blue,
  });

  final String title;
  final List<String> text;
  final double width;
  final Color color;

  @override
  State<MyDropDownButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyDropDownButton> {
  String? _dropDownValue;

  @override
  void initState() {
    super.initState();
    _dropDownValue = widget.text.first;
  }
  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<Game>(context, listen: false);
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              widget.title,
              style: TextStyle(color: Theme.of(context).accentColor,),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(2),
              height: 50,
              width: widget.width,
              decoration: BoxDecoration(color: widget.color),
              child: Text(
                _dropDownValue!,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        items: widget.text.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            alignment: Alignment.center,
            value: value,
            child: Text(
              value,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            _dropDownValue = value!;
            gameProvider.scoreSetter(int.parse(value));
          });
        },
        menuItemStyleData: MenuItemStyleData(
          padding: EdgeInsets.only(left: 0),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 150,
          width: widget.width,
          offset: Offset(2, 0),
          decoration: BoxDecoration(color: widget.color),
        ),
      ),
    );
  }
}