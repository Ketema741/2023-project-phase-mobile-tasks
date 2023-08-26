import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme_utils.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            debugPrint("Sorted");
          },
          child:  Icon(
            Icons.sort,
            size: 40.sp,
            color: AppColors.textDark,
          ),
        ),
        Center(
          child: Text(
            "Welcome Back!",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
             const CircleAvatar(
              backgroundImage:  AssetImage('images/avator.jpg'),
              radius: 32,
            ),
            Container(
              width: 59,
              height: 59,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.whiteColor,
                  width: 2.sp,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
