import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/Widgets/bottoms.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/styles_manager.dart';
import 'package:movies/di.dart';
import 'package:movies/features/moviesDetails/presentation/Bloc/MoviesDetailsBloc.dart';
import 'package:movies/features/moviesDetails/presentation/Bloc/MoviesDetailsEvents.dart';
import 'package:movies/features/moviesDetails/presentation/Bloc/MoviesDetailsState.dart';
import 'package:movies/features/moviesDetails/presentation/Screen/Widgets/ScreenShotsWidget.dart';
import 'package:movies/features/moviesDetails/presentation/Screen/Widgets/SimilarWidget.dart';
import 'package:movies/features/moviesDetails/presentation/Screen/Widgets/castWidget.dart';
import 'package:movies/features/moviesDetails/presentation/Screen/Widgets/descWidget.dart';
import 'package:movies/features/moviesDetails/presentation/Screen/Widgets/genersWidge.dart';
import 'package:movies/features/moviesDetails/presentation/Screen/Widgets/infoWidget.dart';
import 'package:movies/features/moviesDetails/presentation/Screen/Widgets/topWidget.dart';
import 'package:url_launcher/url_launcher.dart';

class MoviesDetails extends StatelessWidget {
  final int id;

  const MoviesDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<Moviesdetailsbloc>()..add(GetMovieDetailsEvent(id)),
      child: BlocConsumer<Moviesdetailsbloc, BlocDetailsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          Future<void> launchURL() async {
            final Uri uri = Uri.parse(
              state.moviesDetailesResponse?.data?.movie?.url ?? "",
            );
            if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
              debugPrint(
                'Could not launch ${state.moviesDetailesResponse?.data?.movie?.url ?? ""}',
              );
            }
          }

          return Scaffold(
            backgroundColor: AppColors.myBlack,
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: AppColors.myBlack,
                  floating: false,
                  actions: [
                    IconButton(
                      icon: Icon(
                        state.isSaved ? Icons.bookmark : Icons.bookmark_border,
                        color: AppColors.myWhite,
                        size: 35,
                      ),
                      onPressed: () {
                        context.read<Moviesdetailsbloc>().add(
                          ToggleSaveMovieEvent(),
                        );
                      },
                    ),
                  ],
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.myWhite,
                      size: 29,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  expandedHeight: 645,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.only(left: 16.w, bottom: 16.h),
                    title: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            state.moviesDetailesResponse?.data?.movie?.title ??
                                "",
                            style: StylesManager.white24BoldRoboto,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "${state.moviesDetailesResponse?.data?.movie?.year ?? 0}",
                            style: StylesManager.gray20BoldRoboto,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    background: Topwidget(
                      url: state.moviesDetailesResponse?.data?.movie?.url ?? "",
                      image:
                          state
                              .moviesDetailesResponse
                              ?.data
                              ?.movie
                              ?.largeCoverImage ??
                          "",
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: BottomsRed(
                      text: Text(
                        'watch'.tr(),
                        style: StylesManager.white20BoldRoboto,
                      ),
                      onClick: launchURL,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Infowidget(
                      rating:
                          state.moviesDetailesResponse?.data?.movie?.rating ??
                          0,
                      time:
                          state.moviesDetailesResponse?.data?.movie?.runtime ??
                          0,
                      likes:
                          state
                              .moviesDetailesResponse
                              ?.data
                              ?.movie
                              ?.likeCount ??
                          0,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'screenshots'.tr(),
                          style: StylesManager.white24BoldRoboto,
                        ),
                        SizedBox(height: 9.h),
                        Screenshotswidget(
                          screenShot1:
                              state
                                  .moviesDetailesResponse
                                  ?.data
                                  ?.movie
                                  ?.largeScreenshotImage1 ??
                              "",
                          screenShot2:
                              state
                                  .moviesDetailesResponse
                                  ?.data
                                  ?.movie
                                  ?.largeScreenshotImage2 ??
                              "",
                          screenShot3:
                              state
                                  .moviesDetailesResponse
                                  ?.data
                                  ?.movie
                                  ?.largeScreenshotImage3 ??
                              "",
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'similar'.tr(),
                          style: StylesManager.white24BoldRoboto,
                        ),
                        SizedBox(height: 16.h),
                        Similarwidget(
                          movies: state.movieSimilar?.data?.movies ?? [],
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'summary'.tr(),
                          style: StylesManager.white24BoldRoboto,
                        ),
                        SizedBox(height: 16.h),
                        Descwidget(
                          desc:
                              state
                                  .moviesDetailesResponse
                                  ?.data
                                  ?.movie
                                  ?.descriptionFull ??
                              "",
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'cast'.tr(),
                          style: StylesManager.white24BoldRoboto,
                        ),
                        SizedBox(height: 16.h),
                        Castwidget(
                          cast:
                              state.moviesDetailesResponse?.data?.movie?.cast ??
                              [],
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'genres'.tr(),
                          style: StylesManager.white24BoldRoboto,
                        ),
                        Generswidget(
                          genres:
                              state
                                  .moviesDetailesResponse
                                  ?.data
                                  ?.movie
                                  ?.genres ??
                              [],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
