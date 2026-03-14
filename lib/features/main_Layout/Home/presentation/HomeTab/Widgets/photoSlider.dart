import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/icons_manager.dart';
import 'package:movies/core/resources/images_manager.dart';
import 'package:movies/core/resources/styles_manager.dart';
import 'package:movies/core/routes/approutes.dart';
import 'package:movies/features/main_Layout/Home/data/models/MoviesResponse.dart';
import '../../Bloc/getMoviesBloc.dart';
import '../../Bloc/getMoviesEvent.dart';
import '../../Bloc/getMoviesState.dart';

class PhotosliderHome extends StatefulWidget {
  final String genre;
  const PhotosliderHome({super.key, required this.genre});

  @override
  State<PhotosliderHome> createState() => _PhotosliderState();
}

class _PhotosliderState extends State<PhotosliderHome> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, BlocState>(
      builder: (context, state) {
        final genreState = state.genres[widget.genre];
        final movies = genreState?.movies ?? [];

        if (movies.isEmpty) {
          return SizedBox(
            height: 300,
            child: Center(
              child: CircularProgressIndicator(color: AppColors.myYellow),
            ),
          );
        }

        return SizedBox(
          width: double.infinity,
          height: 645.h,
          child: Stack(
            children: [
              Positioned.fill(
                child: CachedNetworkImage(
                  imageUrl: movies[currentIndex].largeCoverImage ?? "",
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(color: AppColors.myYellow),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey.shade900,
                    child: const Center(
                      child: Icon(Icons.movie, color: Colors.white, size: 40),
                    ),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(color: AppColors.myBlack.withOpacity(0.7)),
              ),
              Column(
                children: [
                  SizedBox(height: 7.h),
                  Image.asset(
                    ImagesManager.availableNow,
                    width: 267.w,
                    height: 93.h,
                  ),
                  SizedBox(height: 21.h),
                  CarouselSlider.builder(
                    itemCount: movies.length,
                    itemBuilder: (context, index, realIndex) {
                      final movie = movies[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.detailsScreen,
                            arguments: movie.id,
                          );
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: 180.w,
                              height: 450.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.r),
                                child: CachedNetworkImage(
                                  imageUrl: movie.largeCoverImage ?? "",
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    color: Colors.grey.shade900,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: AppColors.myYellow,
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                        color: Colors.grey.shade900,
                                        child: const Center(
                                          child: Icon(
                                            Icons.movie,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                        ),
                                      ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 8,
                              left: 8,
                              child: Container(
                                width: 58,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: AppColors.myBlack.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
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
                          ],
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: 300.h,
                      viewportFraction: 0.4,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });

                        if (index == movies.length - 1 &&
                            genreState != null &&
                            !genreState.isLastPage &&
                            !genreState.isLoading) {
                          context.read<HomeBloc>().add(
                            FetchMoviesPageEvent(
                              widget.genre,
                              page: genreState.currentPage + 1,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Image.asset(
                    ImagesManager.watchNow,
                    width: 354.w,
                    height: 146.h,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
