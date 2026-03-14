import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movies/core/Widgets/bottoms.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/constans_manager.dart';
import 'package:movies/core/resources/images_manager.dart';
import 'package:movies/core/resources/styles_manager.dart';
import 'package:movies/core/routes/approutes.dart';
import 'package:movies/features/main_Layout/Home/data/models/MoviesResponse.dart';
import 'package:movies/features/main_Layout/Home/presentation/Bloc/getMoviesBloc.dart';
import 'package:movies/features/main_Layout/Home/presentation/Bloc/getMoviesEvent.dart';
import 'package:movies/features/main_Layout/Home/presentation/Bloc/getMoviesState.dart';

class MovieSection extends StatefulWidget {
  final String genre;

  const MovieSection({super.key, required this.genre});

  @override
  State<MovieSection> createState() => _MovieSectionState();
}

class _MovieSectionState extends State<MovieSection> {
  static const _pageSize = 50;
  static const int scrollItems = 3;
  static const double itemWidth = 150 + 16;

  final PagingController<int, Movies> _pagingController = PagingController(
    firstPageKey: 1,
  );

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _pagingController.addPageRequestListener((pageKey) {
      context.read<HomeBloc>().add(
        FetchMoviesPageEvent(widget.genre, page: pageKey),
      );
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollSeeMore() {
    final double maxScroll = _scrollController.position.maxScrollExtent;
    final double offset = _scrollController.offset + (itemWidth * scrollItems);

    _scrollController.animateTo(
      offset > maxScroll ? maxScroll : offset,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizedGenre =
        ConstansManager.genreLocalizationKey[widget.genre]?.tr() ??
        widget.genre;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(localizedGenre, style: StylesManager.white18BoldRoboto),
              TextButton(
                onPressed: _scrollSeeMore,
                child: Text(
                  "see_more".tr(),
                  style: StylesManager.yellow16W400Roboto,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 220,
          child: BlocListener<HomeBloc, BlocState>(
            listener: (context, state) {
              final genreState = state.genres[widget.genre];

              if (genreState != null) {
                if (genreState.error != null) {
                  _pagingController.error = genreState.error;
                } else {
                  final currentLength = _pagingController.itemList?.length ?? 0;

                  final newItems = genreState.movies
                      .skip(currentLength)
                      .toList();

                  if (newItems.isNotEmpty) {
                    _pagingController.appendPage(
                      newItems,
                      genreState.isLastPage ? null : genreState.currentPage + 1,
                    );
                  }
                }
              }
            },
            child: PagedListView<int, Movies>(
              scrollDirection: Axis.horizontal,
              pagingController: _pagingController,
              physics: const BouncingScrollPhysics(),
              scrollController: _scrollController,
              builderDelegate: PagedChildBuilderDelegate<Movies>(
                itemBuilder: (context, movie, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.detailsScreen,
                        arguments: movie.id,
                      );
                    },
                    child: Container(
                      width: 150,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: CachedNetworkImage(
                                imageUrl: movie.mediumCoverImage ?? "",
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.myYellow,
                                  ),
                                ),
                                errorWidget: (context, url, error) => Icon(
                                  Icons.error,
                                  color: AppColors.myYellow,
                                ),
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
                                          "${movie.rating ?? 0.0}",
                                          style:
                                              StylesManager.white14W400Roboto,
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
                    ),
                  );
                },
                firstPageProgressIndicatorBuilder: (_) => const Center(
                  child: CircularProgressIndicator(color: AppColors.myYellow),
                ),
                newPageProgressIndicatorBuilder: (_) => const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: AppColors.myYellow,
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                ),
                firstPageErrorIndicatorBuilder: (_) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "error_loading".tr(),
                        style: StylesManager.white20BoldRoboto,
                      ),
                      const SizedBox(height: 8),
                      BottomsRed(
                        text: Text(
                          "retry".tr(),
                          style: StylesManager.white20BoldRoboto,
                        ),
                        onClick: () => _pagingController.refresh(),
                      ),
                    ],
                  ),
                ),
                newPageErrorIndicatorBuilder: (_) => Center(
                  child: BottomsRed(
                    text: Text(
                      "retry".tr(),
                      style: StylesManager.white20BoldRoboto,
                    ),
                    onClick: () => _pagingController.retryLastFailedRequest(),
                  ),
                ),
                noItemsFoundIndicatorBuilder: (_) => Center(
                  child: Image.asset(
                    ImagesManager.notFound,
                    height: 124.h,
                    width: 124.w,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
