import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:album/core/constants/env_colors.dart';
import 'package:album/core/constants/env_strings.dart';

class LastOrderHeading extends StatelessWidget {
  const LastOrderHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            AlbumString.name,
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w500,
              fontSize: 13.sp,
              color: AlbumsColors.darkGreyColor,
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 2,
                child: Text(
                  AlbumString.dateLiteral,
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp,
                    color: AlbumsColors.darkGreyColor,
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Flexible(
                flex: 1,
                child: Text(
                  AlbumString.amount,
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp,
                    color: AlbumsColors.darkGreyColor,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Text(
                  AlbumString.stat,
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp,
                    color: AlbumsColors.darkGreyColor,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Text(
                  AlbumString.inv,
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp,
                    color: AlbumsColors.darkGreyColor,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
