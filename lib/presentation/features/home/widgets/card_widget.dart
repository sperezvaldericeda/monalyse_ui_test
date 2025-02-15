import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monalyse_ui_test/app/constants/app_colors.dart';
import 'package:monalyse_ui_test/app/extensions/context_extensions.dart';

Widget articleCard(
    BuildContext context, Map<String, String> article, bool isDarkMode) {
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
    color: isDarkMode ? Colors.grey[850] : AppColors.backgroundCard,
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
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
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
            style: TextStyle(
                color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                fontSize: 12),
          ),
          const SizedBox(height: 10),
          Text(
            article["content"]!,
            style: TextStyle(
                fontSize: 14,
                color: isDarkMode ? Colors.white70 : Colors.black87),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(Icons.share,
                  color: isDarkMode ? Colors.white70 : AppColors.black),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: shareLink));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(context.localizations.link_copied_text)),
                );
              },
              color: isDarkMode ? Colors.white70 : Color(0xFF404A66),
            ),
          ),
        ],
      ),
    ),
  );
}
