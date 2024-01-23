import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../components/components.dart';
import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool hasBrandShortLink = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'URL SHORTENER',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0)),
          margin: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 20.0),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Shorten a long link',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20.0),
              const CustomTextField(
                labelText: 'Paste a long URL',
                hintText: 'https://bineshburjamagar.com.np',
              ),
              const SizedBox(height: 20.0),
              CustomSwitch(
                value: hasBrandShortLink,
                onChanged: (p0) {
                  log(p0.toString());
                  setState(() {
                    hasBrandShortLink = p0;
                  });
                },
              ),
              if (hasBrandShortLink)
                const CustomTextField(
                  hintText: 'favorite-link',
                  labelText: 'Enter a branded short link',
                ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: FilledButton(
                  onPressed: () {},
                  child: const Text(
                    'Shorten URL',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
