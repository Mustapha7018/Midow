import 'package:flutter/material.dart';

Widget buildRelatedPost(BuildContext context,
    {required String imagePath, required String title}) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  return Row(
    children: [
      // Post Image
      Container(
        width: width * 0.35,
        height: height * 0.1,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      SizedBox(width: width * 0.05),

      // Post Title and Description
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'There has been so many people who have anticipated a face ID authenticat...',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ),
      ),
    ],
  );
}
