import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/Widgets/TextFildWidgets.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/icons_manager.dart';
import 'package:movies/di.dart';
import 'package:movies/features/main_Layout/Search/presentation/Bloc/SearchBloc.dart';
import 'package:movies/features/main_Layout/Search/presentation/screen/Widgets/noSearch.dart';
import 'package:movies/features/main_Layout/Search/presentation/screen/Widgets/searchList.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController search = TextEditingController();
  final ValueNotifier<bool> hasTextNotifier = ValueNotifier(false);
  Timer? _debounce;

  final GlobalKey<SearchlistState> _searchListKey =
      GlobalKey<SearchlistState>();

  @override
  void dispose() {
    search.dispose();
    hasTextNotifier.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<Searchbloc>(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            extendBody: true,
            backgroundColor: AppColors.myBlack,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 50.h),
              child: Column(
                children: [
                  TextFieldWidget(
                    controller: search,
                    hintText: "search".tr(),
                    isSearch: true,
                    hasTextNotifier: hasTextNotifier,
                    preIcon: IconsManager.searchIcon,
                    onChanged: (value) {
                      if (_debounce?.isActive ?? false) _debounce!.cancel();
                      _debounce = Timer(const Duration(milliseconds: 500), () {
                        if (value.isNotEmpty) {
                          _searchListKey.currentState?.updateSearch(value);
                        }
                      });
                    },
                  ),
                  Expanded(
                    child: ValueListenableBuilder<bool>(
                      valueListenable: hasTextNotifier,
                      builder: (context, hasText, _) {
                        if (!hasText) return const Nosearch();
                        return Searchlist(
                          key: _searchListKey,
                          word: search.text,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
