import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:album/core/constants/env_colors.dart';
import 'package:album/core/constants/env_strings.dart';

class DashboardDropdown extends StatefulWidget {
  const DashboardDropdown({Key? key}) : super(key: key);

  @override
  DashboardDropdownState createState() => DashboardDropdownState();
}

class DashboardDropdownState extends State<DashboardDropdown> {
  // Initial Selected Value
  String dropdownvalue = AlbumString.week;

  // List of items in our dropdown menu
  var items = [
    AlbumString.hr,
    AlbumString.day,
    AlbumString.week,
    AlbumString.mnth,
    AlbumString.yr,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 10.sp),
      decoration: BoxDecoration(
        border: Border.all(
          color: AlbumsColors.darkGreyColor,
          width: 1.sp,
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: DropdownButton(
                // Initial Value
                value: dropdownvalue,
                underline: Container(),
                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
