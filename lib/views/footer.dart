import 'package:flutter/material.dart';
import 'package:porfolio_flutter_web/global/app_colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.bgColor2, // Background color of the footer
        padding: const EdgeInsets.all(16.0), // Padding for content inside the footer
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '© 2024 Portfolio Herlambang Hanafi Aji',
              style: TextStyle(
                color: Colors.white, // Text color
              ),
            ),
          ],
        ));
  }
}
