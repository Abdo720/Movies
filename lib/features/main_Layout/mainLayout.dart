import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/icons_manager.dart';
import 'package:movies/features/main_Layout/Browse/presentation/screen/Ui/Brawser.dart';
import 'package:movies/features/main_Layout/Home/presentation/HomeTab/Ui/HomeTab.dart';
import 'package:movies/features/main_Layout/Profile/screen/Ui/Profile.dart';
import 'package:movies/features/main_Layout/Search/presentation/screen/Ui/Search.dart';

class Mainlayout extends StatefulWidget {
  const Mainlayout({super.key});

  @override
  State<Mainlayout> createState() => _MainlayoutState();
}

class _MainlayoutState extends State<Mainlayout> {
  final List<Widget> pages = [HomeTab(), Search(), Brawser(), Profile()];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[index],
      bottomNavigationBar: Container(
        height: 61.h,
        margin: EdgeInsets.only(left: 9.w, right: 9.w, bottom: 9.h),
        decoration: BoxDecoration(
          color: AppColors.myGray,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.myGray,
            currentIndex: index,
            onTap: (val) {
              setState(() {
                index = val;
              });
            },
            selectedItemColor: AppColors.myYellow,
            unselectedItemColor: AppColors.myWhite,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            items: [
              _buildNavItem(
                iconPath: IconsManager.homeIcon,
                isSelected: index == 0,
              ),
              _buildNavItem(
                iconPath: IconsManager.searchIcon,
                isSelected: index == 1,
              ),
              _buildNavItem(
                iconPath: IconsManager.exploreIcon,
                isSelected: index == 2,
              ),
              _buildNavItem(
                iconPath: IconsManager.profileIcon,
                isSelected: index == 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required String iconPath,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.symmetric(vertical: 19.h),
        child: ImageIcon(
          AssetImage(iconPath),
          size: 20.r,
          color: isSelected ? AppColors.myYellow : AppColors.myWhite,
        ),
      ),
      label: '',
    );
  }
}
