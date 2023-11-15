import 'package:flutter/material.dart';

class TextButtonComponent extends StatelessWidget {
  const TextButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Política de privacidade',
        style: TextStyle(
          color: Colors.grey[50],
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
