import 'package:flutter/material.dart';
import 'package:url_shortener/features/home/models/models.dart';

class ResultsWidget extends StatelessWidget {
  const ResultsWidget({
    super.key,
    required this.shortenModel,
  });
  final ShortenModel shortenModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20.0),
          Text('Long Link : ${shortenModel.destination}'),
          const SizedBox(height: 10.0),
          Text('Short Link : ${shortenModel.shortUrl}'),
          Image.network('${shortenModel.creator?.avatarUrl}')
        ],
      ),
    );
  }
}
