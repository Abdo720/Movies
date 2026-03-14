import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/constans_manager.dart';
import 'package:movies/core/resources/images_manager.dart';

class PhotosSlider extends StatefulWidget {
  final Function(String) onSelect;
  const PhotosSlider({super.key, required this.onSelect});

  @override
  State<PhotosSlider> createState() => _PhotosSliderState();
}

class _PhotosSliderState extends State<PhotosSlider> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: ConstansManager.photos.length,
      options: CarouselOptions(
        height: 177.h,
        enlargeCenterPage: true,
        viewportFraction: 0.4,
        onPageChanged: (index, reason) {
          setState(() {
            currentIndex = index;
          });
          widget.onSelect(ConstansManager.photos[index]);
        },
      ),
      itemBuilder: (context, index, realIndex) {
        bool isCenter = index == currentIndex;
        return Column(
          children: [
            SizedBox(height: 9.h),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: isCenter ? 158.w : 94.w,
              height: isCenter ? 161.h : 94.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ConstansManager.photos[index]),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
