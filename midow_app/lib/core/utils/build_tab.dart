import 'package:flutter/material.dart';
import 'package:midow_app/core/utils/midow_colors.dart';

Widget buildTab(String label, bool isSelected, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? AppColors.primaryColor : AppColors.accentColor,
            ),
          ),
          const SizedBox(height: 4), 
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 2,
            width: _calculateTextWidth(label, const TextStyle(fontSize: 16)),
            color: isSelected ? AppColors.primaryColor : Colors.transparent,
          ),
        ],
      ),
    ),
  );
}

double _calculateTextWidth(String text, TextStyle style) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    maxLines: 1,
    textDirection: TextDirection.ltr,
  )..layout(minWidth: 0, maxWidth: double.infinity);
  return textPainter.size.width;
}
