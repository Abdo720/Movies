import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/resources/constans_manager.dart';
import 'package:movies/di.dart';
import 'package:movies/features/main_Layout/Home/presentation/Bloc/getMoviesBloc.dart';
import 'package:movies/features/main_Layout/Home/presentation/HomeTab/Widgets/bottomCountanir.dart';
import 'package:movies/features/main_Layout/Home/presentation/HomeTab/Widgets/photoSlider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              PhotosliderHome(genre: "Action"),
              Column(
                children: ConstansManager.movieGenres.map((genre) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [MovieSection(genre: genre)],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
