import 'package:flutter/material.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/images_manager.dart';

class PickAvatarSheet extends StatefulWidget {
  final String currentAvatar;
  final Function(String) onSelect;

  const PickAvatarSheet({
    super.key,
    required this.currentAvatar,
    required this.onSelect,
  });

  @override
  State<PickAvatarSheet> createState() => _PickAvatarSheetState();
}

class _PickAvatarSheetState extends State<PickAvatarSheet> {
  late String selectedAvatar;

  final List<String> avatars = [
    ImagesManager.avtar1,
    ImagesManager.avtar2,
    ImagesManager.avtar3,
    ImagesManager.avtar4,
    ImagesManager.avtar5,
    ImagesManager.avtar6,
    ImagesManager.avtar7,
    ImagesManager.avtar8,
    ImagesManager.avtar9,
  ];

  @override
  void initState() {
    super.initState();
    selectedAvatar = widget.currentAvatar;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.myBlack,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Text("Pick Avatar", style: StylesManager.yellow16W400Roboto),
          SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            itemCount: avatars.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              final avatar = avatars[index];
              final isSelected = avatar == selectedAvatar;

              return GestureDetector(
                onTap: () {
                  if (avatar == selectedAvatar) return;

                  setState(() {
                    selectedAvatar = avatar;
                  });
                  widget.onSelect(avatar);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: isSelected
                        ? AppColors.myYellow.withOpacity(0.5)
                        : Colors.transparent,
                    border: Border.all(color: AppColors.myYellow, width: 3),
                  ),
                  child: Image.asset(avatar),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
