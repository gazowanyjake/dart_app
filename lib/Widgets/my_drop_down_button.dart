// ignore_for_file: public_member_api_docs

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wyniki/Providers/newgame_provider.dart';

class MyDropDownButton extends StatefulWidget {
  const MyDropDownButton({
    required this.title,
    required this.list,
    this.onTap,
    this.width = 68,
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
    final gameProvider = Provider.of<GameProvider>(context, listen: false);
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: Column(
          children: [
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(2),
              height: 48,
              width: widget.width,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                _dropDownValue,
                style: Theme.of(context).textTheme.titleMedium,
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
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
        }).toList(),
        onChanged: (value) {
          widget.title == 'Points'
              ? setState(() {
                  _dropDownValue = value!;
                  gameProvider.scoreSetterBeforeGame(int.parse(value));
                })
              : null;
        },
        dropdownStyleData: DropdownStyleData(
          maxHeight: 152,
          width: widget.width,
          offset: const Offset(2, 0),
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
