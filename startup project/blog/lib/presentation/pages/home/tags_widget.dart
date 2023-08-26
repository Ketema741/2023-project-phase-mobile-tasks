import 'package:blog/presentation/theme_utils.dart';
import 'package:flutter/material.dart';

class TagButtonListWidget extends StatelessWidget {
  final List<String> tagNames;
  final double borderRadius;
  final double horizontalPadding;
  final Color buttonColor;
  final Color outlineColor;
  final double spaceBetweenButtons; // Add this property

  const TagButtonListWidget({
    Key? key,
    required this.tagNames,
    this.borderRadius = 20,
    this.horizontalPadding = 25,
    this.buttonColor = const Color(0xFF376AED),
    this.outlineColor = const Color(0xFF376AED),
    this.spaceBetweenButtons = 10, // Provide a default value for spacing
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var outlinedButtonStyle = OutlinedButton.styleFrom(
      side: BorderSide(color: outlineColor),
      padding: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: horizontalPadding,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );

    var elevatedButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: buttonColor,
      padding: EdgeInsets.symmetric(
        vertical: 2,
        horizontal: horizontalPadding,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Adjust alignment
        children: [
          SizedBox(
            height: 30,
            width: 100,
            child: ElevatedButton(
              onPressed: () {},
              style: elevatedButtonStyle,
              child: const Text(
                'All',
                style: TextStyle(
                  color: AppColors.whiteColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          SizedBox(width: spaceBetweenButtons),
          ...tagNames.map(
            (tagName) {
              return Container(
                height: 30,
                width: 100,
                margin: EdgeInsets.only(right: spaceBetweenButtons),
                child: OutlinedButton(
                  onPressed: () {},
                  style: outlinedButtonStyle,
                  child: Text(
                    tagName,
                    style: TextStyle(
                      color: outlineColor,
                      fontFamily: 'Urbanist',
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
