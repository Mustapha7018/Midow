// Function to build individual blog card
import 'package:flutter/material.dart';
import 'package:midow_app/core/utils/midow_colors.dart';

Widget buildBlogCard(
    String title, String category, String readTime, String imagePath) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Blog Image
      Container(
        height: 230,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
      const SizedBox(height: 10),
      // Blog Title
      Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
      ),
      const SizedBox(height: 5),
      // Blog Meta Info
      Text(
        '$category • $readTime',
        style: const TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
    ],
  );
}