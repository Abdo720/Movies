import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/constans_manager.dart';
import 'package:movies/core/resources/styles_manager.dart';
import 'package:movies/core/routes/approutes.dart';
import 'package:movies/features/main_Layout/Home/data/models/MoviesResponse.dart';
import 'package:movies/features/main_Layout/Search/presentation/Bloc/SearchBloc.dart';
import 'package:movies/features/main_Layout/Search/presentation/Bloc/SearchEvents.dart';
import 'package:movies/features/main_Layout/Search/presentation/Bloc/SearchStates.dart';

class Searchlist extends StatefulWidget {
  final String word;

  const Searchlist({super.key, required this.word});

  @override
  State<Searchlist> createState() => SearchlistState();
}

class SearchlistState extends State<Searchlist> {
  final PagingController<int, Movies> _pagingController = PagingController(
    firstPageKey: 1,
  );

  late String _currentWord;

  @override
  void initState() {
    super.initState();
    _currentWord = widget.word;

    _pagingController.addPageRequestListener((pageKey) {
      context.read<Searchbloc>().add(
        Searchevents(word: _currentWord, page: pageKey),
      );
    });
  }

  void updateSearch(String newWord) {
    if (_currentWord == newWord) return;
    _currentWord = newWord;

    context.read<Searchbloc>().add(Searchevents(word: _currentWord, page: 1));

    _pagingController.refresh();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<Searchbloc, BlocSearchStates>(
      listener: (context, state) {
        if (state.searchRequstState != RequstState.succes) return;

        if (state.currentPage != _pagingController.nextPageKey) return;

        final movies = state.moviesResponse?.data?.movies ?? [];

        if (state.isLastPage) {
          _pagingController.appendLastPage(movies);
        } else {
          _pagingController.appendPage(movies, state.currentPage + 1);
        }
      },
      child: PagedGridView<int, Movies>(
        pagingController: _pagingController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 12,
          childAspectRatio: 0.6,
        ),
        builderDelegate: PagedChildBuilderDelegate<Movies>(
          firstPageProgressIndicatorBuilder: (_) => const Center(
            child: CircularProgressIndicator(color: AppColors.myYellow),
          ),
          newPageProgressIndicatorBuilder: (_) => const Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: CircularProgressIndicator(color: AppColors.myYellow),
            ),
          ),
          firstPageErrorIndicatorBuilder: (_) => const Center(
            child: Text(
              'Something went wrong.',
              style: TextStyle(color: Colors.white),
            ),
          ),
          newPageErrorIndicatorBuilder: (_) => Center(
            child: TextButton(
              onPressed: () => _pagingController.retryLastFailedRequest(),
              child: const Text(
                'Retry',
                style: TextStyle(color: AppColors.myYellow),
              ),
            ),
          ),
          itemBuilder: (context, movie, index) {
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
                        child: CircularProgressIndicator(
                          color: AppColors.myYellow,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.myBlack.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "${movie.rating ?? 0}",
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
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
