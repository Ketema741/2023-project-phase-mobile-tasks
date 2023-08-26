import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/blog_card_widget.dart';
import 'header_widget.dart';
import 'search_bar_widget.dart';
import 'tags_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Container(
          padding:  EdgeInsets.all(16.w),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 56.h),
             const SearchBarWidget(),
              SizedBox(height: 20.h),
              const HeaderWidget(),
              SizedBox(height: 20.h),
              const TagButtonListWidget(
                tagNames: [
                  'Sports',
                  'Tech',
                  'Politics',
                  'Education',
                ],
              ),
               SizedBox(height: 50.h),
              const BlogCardWidget()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => debugPrint("hello"),
        label:  Icon(
          Icons.add,
          size: 32.sp,
        ),
      ),
    );
  }
}
