import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monalyse_ui_test/app/constants/app_colors.dart';

Widget articleCard(BuildContext context, Map<String, String> article) {
  final String content = article["content"]!.toLowerCase();
  String? imagePath;
  String shareLink = "https://www.google.com";

  if (content.contains("netflix")) {
    imagePath = 'assets/images/netflix.jpeg';
    shareLink = "https://www.netflix.com";
  } else if (content.contains("hbo")) {
    imagePath = 'assets/images/hbo.jpeg';
    shareLink = "https://www.hbomax.com";
  } else if (content.contains("disney")) {
    imagePath = 'assets/images/disney.jpeg';
    shareLink = "https://www.disneyplus.com";
  }

  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  article["title"]!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (imagePath != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Image.asset(
                    imagePath,
                    height: 40,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            "${article["source"]} · ${article["date"]}",
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),
          const SizedBox(height: 10),
          Text(
            article["content"]!,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(Icons.share, color: AppColors.loginBackground),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: shareLink));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Link copied to clipboard!")),
                );
              },
              color: const Color(0xFF404A66),
            ),
          ),
        ],
      ),
    ),
  );
}
