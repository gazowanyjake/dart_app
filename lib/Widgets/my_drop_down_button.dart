// ignore_for_file: public_member_api_docs

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wyniki/Providers/game.dart';

class MyDropDownButton extends StatefulWidget {
  const MyDropDownButton({
    required this.title,
    required this.list,
    this.onTap,
    this.width = 65,
    this.color = Colors.blue,
    super.key,
  });

  final String title;
  final List<String> list;
  final double width;
  final Color color;
  final Function? onTap;

  @override
  State<MyDropDownButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyDropDownButton> {
  late String _dropDownValue;

  @override
  void initState() {
    super.initState();
    _dropDownValue = widget.list.first;
  }


  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<Game>(context, listen: false);
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(2),
              height: 50,
              width: widget.width,
              decoration: BoxDecoration(color: widget.color),
              child: Text(
                _dropDownValue,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        items: widget.list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            alignment: Alignment.center,
            value: value,
            child: Text(
              value,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }).toList(),
        onChanged:(value) {
          widget.title == 'Punkty' ?
          setState(() {
            _dropDownValue = value!;
            gameProvider.scoreSetter(int.parse(value));
          }) : null;
        },
        dropdownStyleData: DropdownStyleData(
          maxHeight: 150,
          width: widget.width,
          offset: const Offset(2, 0),
          decoration: BoxDecoration(color: widget.color),
        ),
      ),
    );
  }
}
