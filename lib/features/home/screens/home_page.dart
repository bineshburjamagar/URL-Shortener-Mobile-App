import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_shortener/features/home/apis/apis.dart';

import '../../../components/components.dart';
import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool hasBrandShortLink = false;
  TextEditingController urlController = TextEditingController();
  TextEditingController brandedController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
        child: Form(
          key: _formKey,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0)),
            margin:
                const EdgeInsets.symmetric(horizontal: 23.0, vertical: 20.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
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
                CustomTextField(
                  controller: urlController,
                  hasValidator: true,
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
                  CustomTextField(
                    controller: brandedController,
                    hintText: 'favorite-link',
                    labelText: 'Enter a branded short link',
                  ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: FilledButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        log('message');

                        var res = await ApiBase.getRequest(data: {
                          if (hasBrandShortLink)
                            "slashtag": brandedController.text,
                          "destination": urlController.text,
                        });

                        if (!res.isError) {
                          log(res.toString());
                        }
                      }
                    },
                    child: const Text(
                      'Shorten URL',
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
