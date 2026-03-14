import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/styles_manager.dart';
import 'package:movies/features/moviesDetails/data/models/MoviesDetailesResponse.dart';

class Castwidget extends StatelessWidget {
  List<Cast> cast;
  Castwidget({super.key, required this.cast});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 3),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: cast.length,
      separatorBuilder: (context, index) {
        return SizedBox(height: 8.h);
      },
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.myGray,
          ),
          child: ListTile(
            minVerticalPadding: 8,
            contentPadding: EdgeInsets.all(8),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: cast[index].urlSmallImage ?? "",
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(color: AppColors.myYellow),
                ),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, color: AppColors.myYellow),
                fit: BoxFit.cover,
                width: 60.w,
                height: 60.h,
              ),
            ),
            title: Text(
              "Name: ${cast[index].name ?? ""}",
              style: StylesManager.white20W400Roboto,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              "Character: ${cast[index].characterName ?? ""}",
              style: StylesManager.white16W400Roboto,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }
}
