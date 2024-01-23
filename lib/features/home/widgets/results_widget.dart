import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:url_shortener/features/home/models/models.dart';

class ResultsWidget extends StatelessWidget {
  const ResultsWidget({
    super.key,
    required this.shortenModel,
  });
  final ShortenModel shortenModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20.0),
              _buildLinks(
                  title: 'Long Link', subtitle: shortenModel.destination ?? ''),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildLinks(
                      title: 'Short Link',
                      subtitle: shortenModel.shortUrl ?? ''),
                  InkWell(
                    onTap: () async {
                      await Clipboard.setData(
                              ClipboardData(text: shortenModel.shortUrl ?? ""))
                          .then((value) =>
                              BotToast.showText(text: 'Text Copied'));
                    },
                    child: const Icon(
                      Icons.copy,
                      size: 20.0,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10.0),
              if (shortenModel.shortUrl != null)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      height: 200.0,
                      width: 200.0,
                      child: PrettyQrView.data(
                        data: '${shortenModel.shortUrl}',
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          child: IconButton(
            icon: const Icon(Icons.cancel_outlined),
            onPressed: () => Navigator.pop(context),
          ),
        )
      ],
    );
  }

  RichText _buildLinks({required String title, required String subtitle}) {
    return RichText(
      text: TextSpan(
        text: '$title : \n',
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: subtitle,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
