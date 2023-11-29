import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/theme.dart';

class HomeTipsItem extends StatelessWidget {
  // final TipsModel tips;

  const HomeTipsItem({
    Key? key,
    // required this.tips,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse('https://flutter.dev');
    return GestureDetector(
      onTap: () async {
        if (!await launchUrl(url)) {
          throw Exception('Could not launch $url');
        }
      },
      child: Container(
        width: 155,
        height: 176,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: whiteColor,
        ),
        child: Column(
          children: [
            // ClipRRect(
            //   borderRadius: const BorderRadius.vertical(
            //     top: Radius.circular(20),
            //   ),
            //   child: Image.network(
            //     tips.thumbnail!,
            //     width: 155,
            //     height: 110,
            //     fit: BoxFit.cover,
            //   ),
            // ),
            // const SizedBox(
            //   height: 12,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Text(
                'tips.title!',
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
