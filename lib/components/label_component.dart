import 'package:flutter/material.dart';

class LabelComponent extends StatelessWidget {
  final String text;
  const LabelComponent({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .6,
      child: Chip(
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        label: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
