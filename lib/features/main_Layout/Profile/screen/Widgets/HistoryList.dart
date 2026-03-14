import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/images_manager.dart';
import 'package:movies/core/resources/styles_manager.dart';
import 'package:movies/core/routes/approutes.dart';
import 'package:movies/features/moviesDetails/data/FireBaseFouctions/FireBaseFounctions.dart';
import 'package:movies/features/moviesDetails/data/models/MovieModel.dart';

class Historylist extends StatelessWidget {
  final List<MovieModel> movies;
  const Historylist({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) {
      return Center(
        child: Image.asset(ImagesManager.notFound, width: 124, height: 124),
      );
    }

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.8,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.detailsScreen,
              arguments: movie.id,
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: movie.mediumCoverImage ?? "",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(color: AppColors.myYellow),
                  ),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error, color: AppColors.myYellow),
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
                              "${movie.rating ?? 0.0}",
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
