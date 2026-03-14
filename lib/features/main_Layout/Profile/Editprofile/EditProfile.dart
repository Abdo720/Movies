import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/CachHelper/SharedPreferences.dart';
import 'package:movies/core/Widgets/TextFildWidgets.dart';
import 'package:movies/core/Widgets/bottoms.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/icons_manager.dart';
import 'package:movies/core/resources/styles_manager.dart';
import 'package:movies/core/routes/approutes.dart';
import 'package:movies/features/AuthenticationScreens/registerScreeen/firebaseFounctions/RegisterfirebaseFunctions.dart';
import 'package:movies/features/AuthenticationScreens/registerScreeen/model/usermodel.dart';
import 'package:movies/features/main_Layout/Profile/Editprofile/Widgets/changeAvtar.dart';

class Editprofile extends StatefulWidget {
  UserModel model;
  Editprofile({super.key, required this.model});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  late TextEditingController name;
  late TextEditingController phone;
  late String selectedAvatar;

  @override
  void initState() {
    super.initState();
    name = TextEditingController(text: widget.model.name);
    phone = TextEditingController(text: widget.model.phone);
    selectedAvatar = widget.model.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.myBlack,
      appBar: AppBar(
        backgroundColor: AppColors.myBlack,
        title: Text(
          'edit_profile'.tr(),
          style: StylesManager.yellow16W400Roboto,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.myYellow),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 37.h),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => PickAvatarSheet(
                    currentAvatar: selectedAvatar,
                    onSelect: (avatar) {
                      setState(() {
                        selectedAvatar = avatar;
                      });
                    },
                  ),
                );
              },
              child: Image.asset(selectedAvatar, width: 150.w, height: 150.h),
            ),
            SizedBox(height: 35.h),
            TextFieldWidget(
              controller: name,
              hintText: 'name'.tr(),
              preIcon: IconsManager.nameIcon,
            ),
            SizedBox(height: 20.h),
            TextFieldWidget(
              controller: phone,
              hintText: 'phone'.tr(),
              preIcon: IconsManager.phoneIcon,
            ),
            SizedBox(height: 30.h),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.forgotPassword);
              },
              child: Row(
                children: [
                  Text(
                    'forget_password'.tr(),
                    style: StylesManager.white20W400Roboto,
                  ),
                ],
              ),
            ),
            SizedBox(height: 260.h),
            BottomsRed(
              text: Text(
                'delete_account'.tr(),
                style: StylesManager.white20W400Roboto,
              ),
              onClick: () async {
                await RegisterFirebaseFunctions.signOut();
                await Sharedpreferences.Savebool2(false);
                await Sharedpreferences.Savebool3(false);
                Navigator.pushNamed(context, AppRoutes.loginScreen);
              },
            ),
            SizedBox(height: 19.h),
            Padding(
              padding: EdgeInsetsGeometry.only(bottom: 10.h),
              child: BottomsYellow(
                text: Text(
                  'update_data'.tr(),
                  style: StylesManager.black20W400Roboto,
                ),
                onClick: () {
                  RegisterFirebaseFunctions.updateUser(
                    UserModel(
                      id: widget.model.id,
                      name: name.text,
                      email: widget.model.email,
                      phone: phone.text,
                      image: selectedAvatar,
                    ),
                  );
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
