import 'package:flutter/material.dart';
import '../widgets/shorten_form_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'URL SHORTENER',
          style: TextStyle(fontFamily: 'Kalam'),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/links.png',
                  alignment: Alignment.center,
                  height: 200.0,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Rapidly transform lengthy URLs, easily share, with QR and elevate your online presence.',
                style: TextStyle(
                  fontFamily: 'Kalam',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20.0),
              const ShortenFormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
