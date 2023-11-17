import 'package:flutter/material.dart';

class LabelComponent extends StatelessWidget {
  final String text;
  const LabelComponent({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Theme.of(context).primaryColor,
      labelPadding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .3, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      label: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
