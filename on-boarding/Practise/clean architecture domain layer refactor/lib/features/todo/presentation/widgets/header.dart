import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final VoidCallback onBackButtonPressed;

  const Header({super.key, 
    required this.onBackButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onBackButtonPressed,
            child: const Icon(
              Icons.arrow_back_ios,
              size: 40,
              color: Color(0xFFEE6F57),
            ),
          ),
          const Icon(Icons.more_vert, size: 40),
        ],
      ),
    );
  }
}
