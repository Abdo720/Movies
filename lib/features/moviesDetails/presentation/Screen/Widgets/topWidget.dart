import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/images_manager.dart';
import 'package:movies/core/resources/styles_manager.dart';
import 'package:url_launcher/url_launcher.dart'; // ← استيراد url_launcher

class Topwidget extends StatelessWidget {
  final String image;
  final String url;
  Topwidget({super.key, required this.image, required this.url});

  // دالة لفتح اللينك
  Future<void> _launchURL() async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 645.h,
      child: Stack(
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, url) =>
                  CircularProgressIndicator(color: AppColors.myYellow),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error, color: AppColors.myYellow),
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(color: AppColors.myBlack.withOpacity(0.7)),
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: _launchURL, // ← استدعاء دالة فتح اللينك
              child: Image.asset(ImagesManager.watch),
            ),
          ),
        ],
      ),
    );
  }
}
