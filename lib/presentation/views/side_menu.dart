import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:album/core/constants/env_assets.dart';
import 'package:album/core/constants/env_colors.dart';
import 'package:album/core/extensions/widget_extension.dart';

import 'dashboard/widgets/dashboard_widgets.dart';
import 'dashboard/widgets/image_switcher.dart';

class SideBarDesktop extends StatefulWidget {
  final Function(int)
      onItemSelected; // Callback to notify when an item is selected

  const SideBarDesktop({required this.onItemSelected, super.key});

  @override
  State<SideBarDesktop> createState() => _SideBarDesktopState();
}

class _SideBarDesktopState extends State<SideBarDesktop> {
  String _activeImage = ''; // To highlight the active menu icon
  int _selectedMenuIndex = 0; // Track selected menu item

  @override
  void initState() {
    _activeImage = 'menu';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AlbumsColors.greyColor,
        border: Border(
          right: BorderSide(
            width: 1.sp,
            color: AlbumsColors.darkGreyColor,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Image.asset(
              EnvAssets.getIconPath('thumbnail'),
            ).afmPadding(
              EdgeInsets.all(15.sp),
            ),
          ),
          menuIcon(iconName: 'menu', index: 0),
          menuIcon(
            iconName: 'analysis',
            index: 1,
          ),
          // menuIcon('user'),
          menuIcon(
            iconName: 'box',
            index: 2,
          ),
          menuIcon(
            iconName: 'percentages',
            index: 3,
          ),
          menuIcon(
            iconName: 'notification',
            index: 4,
          ),
          const ImageSwitcher(),
          const Spacer(),
          // menuIcon('arrow-right'),
          menuIcon(
            iconName: 'settings',
            index: 5,
          ),
          menuIcon(
            iconName: 'logout',
            index: 6,
          ),
        ],
      ),
    );
  }

  Flexible menuIcon({required String iconName, required int index}) {
    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedMenuIndex = index;
                widget.onItemSelected(
                    index); // Notify parent (AlbumDashBoard) about the selected index
                _activeImage = iconName;
              });
            },
            child: SizedBox(
              width: 50.sp,
              height: 50.sp,
              child: Image.asset(
                EnvAssets.getIconPath(iconName),
                color: _activeImage == iconName
                    ? AlbumsColors.darkColor
                    : AlbumsColors.darkGreyColor,
                fit: BoxFit.cover,
              ),
            ),
          ),
          _activeImage == iconName ? const TabIndicator() : const SizedBox()
        ],
      ),
    );
  }
}
