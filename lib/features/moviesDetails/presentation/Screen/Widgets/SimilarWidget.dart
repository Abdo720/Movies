import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/styles_manager.dart';
import 'package:movies/features/moviesDetails/data/models/movieSimilar.dart';

class Similarwidget extends StatelessWidget {
  List<Movies> movies;
  Similarwidget({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: movies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: 14,
      ),

      itemBuilder: (context, index) {
        return Container(
          width: 150,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Positioned.fill(
                  child: CachedNetworkImage(
                    imageUrl: movies[index].mediumCoverImage ?? "",
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.myYellow,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error, color: AppColors.myYellow),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 58,
                      height: 38,
                      decoration: BoxDecoration(
                        color: AppColors.myBlack.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "${movies[index].rating ?? 0.0}",
                              style: StylesManager.white14W400Roboto,
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.yellow,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
