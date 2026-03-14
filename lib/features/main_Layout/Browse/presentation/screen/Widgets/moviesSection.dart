import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/icons_manager.dart';
import 'package:movies/core/resources/images_manager.dart';
import 'package:movies/core/resources/styles_manager.dart';
import 'package:movies/core/routes/approutes.dart';
import 'package:movies/features/main_Layout/Browse/presentation/Bloc/getMoviesBrawserBloc.dart';
import 'package:movies/features/main_Layout/Browse/presentation/Bloc/getMoviesBrawserEvents.dart';
import 'package:movies/features/main_Layout/Browse/presentation/Bloc/getMoviesBrawserState.dart';
import 'package:movies/features/main_Layout/Home/data/models/MoviesResponse.dart';

class MoviesGridSection extends StatefulWidget {
  final String genre;

  const MoviesGridSection({super.key, required this.genre});

  @override
  State<MoviesGridSection> createState() => _MoviesGridSectionState();
}

class _MoviesGridSectionState extends State<MoviesGridSection> {
  late PagingController<int, Movies> _pagingController;

  @override
  void initState() {
    super.initState();
    _pagingController = PagingController(firstPageKey: 1);
    _pagingController.addPageRequestListener((pageKey) {
      context.read<BrawserBloc>().add(
        FetchMoviesBrawserPageEvent(widget.genre, page: pageKey),
      );
    });
  }

  @override
  void didUpdateWidget(covariant MoviesGridSection oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.genre != widget.genre) {
      _pagingController.refresh();
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BrawserBloc, BlocBrawserState>(
      listener: (context, state) {
        final genreState = state.genres[widget.genre];
        if (genreState == null) return;

        if (genreState.error != null) {
          _pagingController.error = genreState.error;
        } else {
          final currentLength = _pagingController.itemList?.length ?? 0;
          final newItems = genreState.movies.skip(currentLength).toList();

          if (newItems.isNotEmpty) {
            if (genreState.isLastPage) {
              _pagingController.appendLastPage(newItems);
            } else {
              _pagingController.appendPage(
                newItems,
                genreState.currentPage + 1,
              );
            }
          }
        }
      },
      child: PagedGridView<int, Movies>(
        pagingController: _pagingController,
        padding: EdgeInsets.only(top: 25.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12.h,
          crossAxisSpacing: 12.w,
          childAspectRatio: 0.65,
        ),
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
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: CachedNetworkImage(
                      imageUrl: movie.mediumCoverImage ?? "",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(
                          color: AppColors.myYellow,
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.grey.shade900,
                        child: const Icon(
                          Icons.movie,
                          color: AppColors.myYellow,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8.h,
                    left: 8.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "${movie.rating ?? 0}",
                            style: StylesManager.white14W400Roboto,
                          ),
                          SizedBox(width: 4.w),
                          ImageIcon(
                            AssetImage(IconsManager.ratingIcon),
                            color: AppColors.myYellow,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          firstPageProgressIndicatorBuilder: (_) => Center(
            child: CircularProgressIndicator(color: AppColors.myYellow),
          ),
          newPageProgressIndicatorBuilder: (_) => Center(
            child: CircularProgressIndicator(color: AppColors.myYellow),
          ),
          // ),
          noItemsFoundIndicatorBuilder: (context) {
            final genreState = context
                .read<BrawserBloc>()
                .state
                .genres[widget.genre];
            if (genreState != null && genreState.isLoading) {
              return Center(
                child: CircularProgressIndicator(color: AppColors.myYellow),
              );
            }
            return Center(
              child: Image.asset(
                ImagesManager.notFound,
                height: 124.h,
                width: 124.w,
              ),
            );
          },
        ),
      ),
    );
  }
}
