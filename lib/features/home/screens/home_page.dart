// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:url_shortener/features/home/models/models.dart';

import '../../../components/components.dart';
import '../apis/apis.dart';
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
  ShortenModel? model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'LinkSwift',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'LinkSwift: 🚀 Unleash Your URL Power! Shorten, Share, and Spark Connections. 🔗✨"',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Caveat',
                ),
              ),
              const SizedBox(height: 50.0),
              Form(
                key: _formKey,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0)),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
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
                              FocusScope.of(context).unfocus();
                              log('message');
                              BotToast.showLoading();
                              var res = await ApiBase.getRequest(data: {
                                if (hasBrandShortLink)
                                  "slashtag": brandedController.text,
                                "destination": urlController.text,
                              });
                              BotToast.closeAllLoading();

                              if (!res.isError) {
                                BotToast.showText(text: res.message);
                                setState(() {
                                  model = res.data;
                                });
                                log(res.toString());
                              } else {
                                BotToast.showText(
                                    text: res.message,
                                    contentColor: Colors.red);
                              }
                            }
                          },
                          child: const Text(
                            'CREATE',
                          ),
                        ),
                      ),
                      if (model != null) ResultsWidget(shortenModel: model!),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
