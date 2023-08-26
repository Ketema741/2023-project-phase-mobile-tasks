import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme_utils.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Expanded(
          child: Container(
            width: 379.w,
            height: 70.5.h,
            padding:  EdgeInsets.only(left:15.w),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.iconGrey.withOpacity(0.1)),
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(10.w),
              boxShadow: [
                BoxShadow(
                  color: AppColors.iconGrey.withOpacity(0.1), // Shadow color
                  spreadRadius: 5, // Spread radius
                  blurRadius: 7, // Blur radius
                  offset: const Offset(0, 2), // Offset in the x and y direction
                ),
              ],
            ),
            child:  TextField(
              decoration: InputDecoration(
                hintText: 'Search and articles...',
                hintStyle: TextStyle(
                  color: Theme.of(context).hintColor, // Extra light color
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w300, // Extra light font weight
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          width: 52.w,
          height: 70.5.h,
          child: ElevatedButton(
            onPressed: () {
              // Perform search action here
            },
            style: ElevatedButton.styleFrom(
              padding:  EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.w),
              ),
            ),
            child:  Icon(
              Icons.search,
              color: AppColors.whiteColor,
              size: 35.h,
            ),
          ),
        ),
      ],
    );
  }
}
