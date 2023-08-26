import 'package:flutter/material.dart';

class BlogCardWidget extends StatelessWidget {
  const BlogCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:  Container(
        height: 240,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor, // Container background color
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(16), // Padding for the content
        child: Stack(
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlogImageWidget(),
                // Adding spacing between image and text
                SizedBox(width: 16),
                BlogExcerptWidget(),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Text(
                "Jan 12,2022",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlogExcerptWidget extends StatelessWidget {
  const BlogExcerptWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "STUDENTS SHOULD WORK ON IMPROVING THEIR WRITING SKILL",
              style: Theme.of(context).textTheme.titleLarge,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
                height: 8), // Adding spacing between title and category
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .disabledColor, // Gray box background color for category
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                "Education",
                style: Theme.of(context).textTheme.displayLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
                height: 8), // Adding spacing between category and author
            Text(
              "by John Doe",
              style: Theme.of(context).textTheme.displayMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class BlogImageWidget extends StatelessWidget {
  const BlogImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8), // Adjust the radius as needed
          child: Image.asset(
            'images/avator.jpg',
            width: 160,
            height: 160,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              "5 min read",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ),
      ],
    );
  }
}
