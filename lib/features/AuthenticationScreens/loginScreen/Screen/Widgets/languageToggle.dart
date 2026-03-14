import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/styles_manager.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LanguageToggle extends StatefulWidget {
  const LanguageToggle({super.key});

  @override
  State<LanguageToggle> createState() => _LanguageToggleState();
}

class _LanguageToggleState extends State<LanguageToggle> {
  int getSelectedIndex(BuildContext context) {
    return context.locale.languageCode == 'en' ? 0 : 1;
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = context.locale.languageCode == 'en' ? 0 : 1;


    return ToggleSwitch(
      minWidth: 92,
      minHeight: 38,
      totalSwitches: 2,
      initialLabelIndex: selectedIndex,
      cornerRadius: 50,
      activeBgColor: const [AppColors.myYellow],
      inactiveBgColor: AppColors.myBlack,
      activeFgColor: AppColors.myBlack,
      inactiveFgColor: AppColors.myYellow,
      borderColor: const [AppColors.myYellow],
      borderWidth: 2,
      labels: ['en'.tr(), 'ar'.tr()],
      customTextStyles: [
        StylesManager.roboto14Bold,
        StylesManager.roboto14Bold,
      ],
      animate: true,
      animationDuration: 300,
      onToggle: (index) {
        if (index == null) return;

        if (index == 0) {
          context.setLocale(const Locale('en'));
        } else {
          context.setLocale(const Locale('ar'));
        }
      },
    );
  }
}
