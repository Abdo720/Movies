import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/icons_manager.dart';
import 'package:movies/core/resources/styles_manager.dart';
import 'package:movies/features/main_Layout/Profile/screen/Widgets/HistoryList.dart';
import 'package:movies/features/main_Layout/Profile/screen/Widgets/WishList.dart';
import 'package:movies/features/main_Layout/Profile/screen/Widgets/topContanir.dart';
import 'package:movies/features/moviesDetails/data/FireBaseFouctions/FireBaseFounctions.dart';
import 'package:movies/features/moviesDetails/data/models/MovieModel.dart';
import 'package:movies/features/AuthenticationScreens/registerScreeen/firebaseFounctions/RegisterfirebaseFunctions.dart';
import 'package:movies/features/AuthenticationScreens/registerScreeen/model/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserModel?>(
      stream: RegisterFirebaseFunctions.getUserStream(),
      builder: (context, userSnapshot) {
        final user = userSnapshot.data;

        return StreamBuilder<QuerySnapshot<MovieModel>>(
          stream: FirebaseFunctions.getFavMovies(),
          builder: (context, favSnapshot) {
            final favMovies =
                favSnapshot.data?.docs.map((doc) => doc.data()).toList() ?? [];

            return StreamBuilder<QuerySnapshot<MovieModel>>(
              stream: FirebaseFunctions.getHistoryMovies(),
              builder: (context, historySnapshot) {
                final historyMovies =
                    historySnapshot.data?.docs
                        .map((doc) => doc.data())
                        .toList() ??
                    [];

                return DefaultTabController(
                  length: 2,
                  child: Scaffold(
                    backgroundColor: AppColors.myBlack,
                    body: CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          backgroundColor: AppColors.myBlack,
                          automaticallyImplyLeading: false,
                          expandedHeight: 389.h,
                          // pinned: true,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Topcontanir(
                              model: user,
                              favCount: favMovies.length,
                              historyCount: historyMovies.length,
                            ),
                          ),
                          bottom: TabBar(
                            indicatorColor: AppColors.myYellow,
                            labelStyle: StylesManager.white20W400Roboto,
                            unselectedLabelStyle:
                                StylesManager.white20W400Roboto,
                            tabs: [
                              Tab(
                                icon: const ImageIcon(
                                  AssetImage(IconsManager.listIcon),
                                  color: AppColors.myYellow,
                                ),
                                text: 'wishlist'.tr(),
                              ),
                              Tab(
                                icon: ImageIcon(
                                  AssetImage(IconsManager.historyIcon),
                                  color: AppColors.myYellow,
                                ),
                                text: 'history'.tr(),
                              ),
                            ],
                          ),
                        ),
                        SliverFillRemaining(
                          child: TabBarView(
                            children: [
                              WishlistWithData(movies: favMovies),
                              Historylist(movies: historyMovies),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
