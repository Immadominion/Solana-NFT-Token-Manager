import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:album/core/constants/env_colors.dart';
import 'package:album/core/constants/env_strings.dart';
import 'package:album/core/extensions/time_extension.dart';
import 'package:album/core/extensions/widget_extension.dart';

import '../../../../core/constants/env_assets.dart';

class DashboardDate extends StatefulWidget {
  const DashboardDate({super.key});

  @override
  State<DashboardDate> createState() => _DashboardDateState();
}

class _DashboardDateState extends State<DashboardDate> {
  late TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          height: 30.h,
          width: 30.w,
          child: Image.asset(
            EnvAssets.getIconPath('calendar'),
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          DateTime.now().toCustomFormat(),
          style: TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
        )
      ],
    );
  }
}

class DashboardSignout extends StatefulWidget {
  const DashboardSignout({super.key});

  @override
  State<DashboardSignout> createState() => _DashboardSignoutState();
}

class _DashboardSignoutState extends State<DashboardSignout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 200.w,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.sp),
        color: AlbumsColors.whiteColor,
        border: Border.all(
          width: 1,
          color: AlbumsColors.greyColor,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            EnvAssets.getImagePath('justin'),
            width: 32.w,
          ).afmPadding(EdgeInsets.all(5.sp)),
          // SizedBox(width: 10.sp),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AlbumString.dummyName,
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                ),
                Text(
                  AlbumString.dummyMail,
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                  ),
                )
              ],
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_down_rounded,
          ),
          // const SizedBox(width: 10),
        ],
      ),
    );
  }
}

class TabIndicator extends StatelessWidget {
  const TabIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      width: 3.w,
      decoration: BoxDecoration(
          color: AlbumsColors.darkColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.r),
            bottomLeft: Radius.circular(5.r),
          )),
    );
  }
}
