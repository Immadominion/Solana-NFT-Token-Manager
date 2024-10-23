import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:album/core/constants/env_colors.dart';
import 'package:album/core/extensions/widget_extension.dart';
import 'package:album/presentation/views/dashboard/widgets/dash_top_platforms.dart';
import 'package:album/presentation/views/dashboard/widgets/dashboard_graph.dart';
import 'package:album/presentation/views/dashboard/widgets/dashboard_widgets.dart';
import 'package:album/presentation/views/dashboard/widgets/last_order_screen.dart';
import 'package:album/presentation/views/side_menu.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'widgets/section_widgets/appbar.dart';
import 'widgets/dashboard_mini_cooper.dart';

class AlbumDashBoard extends StatefulWidget {
  const AlbumDashBoard({super.key});

  @override
  State<AlbumDashBoard> createState() => _AlbumDashBoardState();
}

class _AlbumDashBoardState extends State<AlbumDashBoard> {
  int selectedIndex = 0;

  final List<Widget> dashboardSections = [
    const DesktopDashboard(),
    const DashboardGraph(),
    const MiniCooper(),
    const MainLastOrder(),
    const TopPlatforms(),
    const MiniCooper(),
    const DashboardGraph(),
  ];

  void onMenuItemSelected(int index) {
    setState(() {
      selectedIndex =
          index; // Update the selected index when menu item is tapped
    });
  }

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener =
      ScrollOffsetListener.create();
  final onMenuHover = Matrix4.identity()..scale(1.0);
  final ScrollController yourScrollController = ScrollController();
  final menuItems = const <Widget>[
    DashboardDate(),
  ];
  var menuIndex = 0;

  Future scrollTo({required int index}) async {
    itemScrollController
        .scrollTo(
            index: index,
            duration: const Duration(seconds: 2),
            curve: Curves.fastLinearToSlowEaseIn)
        .whenComplete(() {
      setState(() {
        menuIndex = index;
      });
    });
  }

  bool removeSpan = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    bool removeSpan = size.width <= 1300;
    return Scaffold(
      backgroundColor: AlbumsColors.greyColor,
      body: Row(
        children: [
          Expanded(
            flex: removeSpan ? 0 : 1,
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (removeSpan) {
                  return const SizedBox();
                } else {
                  return SideBarDesktop(onItemSelected: onMenuItemSelected);
                }
              },
            ),
          ),
          Expanded(
            flex: removeSpan ? 1 : 18,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                toolbarHeight: 130.h,
                titleSpacing: 50.w,
                elevation: 0,
                title: topWidget(removeSpan, size, menuItems, scrollTo),
              ),
              body: Column(
                children: [
                  Divider(
                    height: 0.5,
                    thickness: 0.5,
                    color: AlbumsColors.darkGreyColor,
                  ),
                  removeSpan
                      ?

                      ///This is the mobile view
                      ListView(
                          children: const [
                            DashboardGraph(),
                            MiniCooper(),
                            MainLastOrder(),
                          ],
                        )
                      : dashboardSections[selectedIndex].afmPadding(
                          EdgeInsets.all(20.sp),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DesktopDashboard extends StatelessWidget {
  const DesktopDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DashboardGraph(),
            MiniCooper(),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ///This is the last orders container
            MainLastOrder(),

            ///This is the container that contains top platforms
            TopPlatforms(),
          ],
        ),
      ],
    );
  }
}
