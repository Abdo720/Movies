import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/constans_manager.dart';
import 'package:movies/core/resources/styles_manager.dart';

class Genresview extends StatefulWidget {
  final Function(String genre) onGenreSelected;

  const Genresview({super.key, required this.onGenreSelected});

  @override
  State<Genresview> createState() => _GenresviewState();
}

class _GenresviewState extends State<Genresview> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: ConstansManager.movieGenres.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final genre = ConstansManager.movieGenres[index];
          final selected = index == selectedIndex;

          return GestureDetector(
            onTap: () {
              setState(() => selectedIndex = index);
              widget.onGenreSelected(genre);
            },
            child: Chip(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              side: BorderSide(color: AppColors.myYellow),
              backgroundColor: selected
                  ? AppColors.myYellow
                  : AppColors.myBlack,
              label: Text(
                ConstansManager.genreLocalizationKey[genre]?.tr() ?? genre,
                style: selected
                    ? StylesManager.black20BoldInter
                    : StylesManager.yellow20BoldInter,
              ),
            ),
          );
        },
      ),
    );
  }
}
