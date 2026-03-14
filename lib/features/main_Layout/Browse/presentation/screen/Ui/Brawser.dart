import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/constans_manager.dart';
import 'package:movies/di.dart';
import 'package:movies/features/main_Layout/Browse/presentation/Bloc/getMoviesBrawserBloc.dart';
import 'package:movies/features/main_Layout/Browse/presentation/Bloc/getMoviesBrawserEvents.dart';
import 'package:movies/features/main_Layout/Browse/presentation/screen/Widgets/genresView.dart';
import 'package:movies/features/main_Layout/Browse/presentation/screen/Widgets/moviesSection.dart';

class Brawser extends StatefulWidget {
  const Brawser({super.key});

  @override
  State<Brawser> createState() => _BrawserState();
}

class _BrawserState extends State<Brawser> {
  late String currentGenre;

  @override
  void initState() {
    super.initState();
    currentGenre = ConstansManager.movieGenres.first;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<BrawserBloc>()
            ..add(FetchMoviesBrawserPageEvent(currentGenre, page: 1)),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: AppColors.myBlack,
            body: Column(
              children: [
                SizedBox(height: 16.h),
                Genresview(
                  onGenreSelected: (genre) {
                    setState(() {
                      currentGenre = genre;
                    });
                    context.read<BrawserBloc>().add(ResetGenreEvent(genre));
                    context.read<BrawserBloc>().add(
                      FetchMoviesBrawserPageEvent(genre, page: 1),
                    );
                  },
                ),
                Expanded(
                  child: MoviesGridSection(
                    key: ValueKey(currentGenre),
                    genre: currentGenre,
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
