import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:album/core/constants/env_assets.dart';
import 'package:album/core/constants/env_colors.dart';
import 'package:album/core/extensions/widget_extension.dart';
import 'package:album/presentation/views/dashboard/widgets/dash_search_widget.dart';
import 'package:album/presentation/views/dashboard/widgets/dashboard_widgets.dart';


LayoutBuilder topWidget(
    bool removeSpan, Size size, List<Widget> menuItems,  scrollTo) {
  return LayoutBuilder(
    builder: (context, constraints) {
      if (removeSpan) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Dashboard',
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w600,
                fontSize: 50.sp,
              ),
            ),
            const Spacer(),
            const Spacer(),
            const Spacer(),
            const Flexible(
              child: SearchBox(),
            ),
            PopupMenuButton(
              icon: Icon(
                Icons.menu_sharp,
                size: 32,
                color: AlbumsColors.primaryColor,
              ),
              color: AlbumsColors.appBackgroundColor,
              position: PopupMenuPosition.under,
              constraints: BoxConstraints.tightFor(width: size.width * 0.9),
              itemBuilder: (BuildContext context) => menuItems
                  .asMap()
                  .entries
                  .map(
                    (e) => PopupMenuItem(
                      textStyle: const TextStyle(),
                      onTap: () => scrollTo(index: e.key),
                      child: e.value,
                    ),
                  )
                  .toList(),
            ),
          ],
        );
      } else {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Dashboard',
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
              ),
            ),
            const Spacer(),
            const SearchBox(),
            SizedBox(
              width: 25.w,
            ),
            const DashboardDate(),
            SizedBox(
              width: 25.w,
            ),
            SizedBox(
              width: 40.w,
              child: Image.asset(
                EnvAssets.getIconPath('bell'),
              ),
            ),
            SizedBox(
              width: 25.w,
            ),
            const DashboardSignout(),
            SizedBox(width: 10.sp),
          ],
        ).afmPadding(
          EdgeInsets.only(
            top: 30.h,
          ),
        );
      }
    },
  );
}
