import 'package:ctfinfo/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourceCard extends StatelessWidget {
  final String title;
  final String description;
  final String url;

  const ResourceCard(
      {super.key,
      required this.title,
      required this.description,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  txtTitle: title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.clip,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () async {
              if (!await launchUrl(Uri.parse(url))) {
                throw Exception('Could not launch');
              }
            },
            child: const Icon(
              Icons.language,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
