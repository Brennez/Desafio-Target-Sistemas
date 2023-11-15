import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TextButtonComponent extends StatelessWidget {
  const TextButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> _launchURL() async {
      Uri url = Uri.parse('https://www.google.com.br/?hl=pt-BR');

      if (!await launchUrl(url)) {
        throw Exception('Não foi possível acessar: $url');
      }
    }

    return TextButton(
      onPressed: () => _launchURL(),
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
