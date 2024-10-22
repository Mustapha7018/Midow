import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utils/buid_related_posts.dart';
import '../../core/utils/midow_colors.dart';

class BlogDetailScreen extends StatelessWidget {
  const BlogDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Image and Icons
            Stack(
              children: [
                // Blog Image
                Container(
                  height: size.height * 0.4,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/card_img1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(29, 29, 29, 0.4),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        'assets/icon_arrow_left.svg',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 20,
                  child: GestureDetector(
                    onTap: () {
                      // Handle favorite button action
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(29, 29, 29, 0.4),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        'assets/heart_icon.svg',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Blog Title
                  const Text(
                    'How Apple’s M3 chips make MacOS development less costly',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: height * 0.03),

                  // Author and Date
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/avatar_img.png'),
                      ),
                      SizedBox(width: width * 0.03),
                      const Text(
                        'Michelle Laura',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'October 4, 2024',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(135, 135, 135, 1),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  const Divider(
                    thickness: 2,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(height: height * 0.02),

                  // Blog Content
                  const Text(
                    'Building on the M3 chip, M3 Pro provides even greater performance and '
                    'additional unified memory for more demanding apps and workflows. '
                    'Building on the M3 chip, M3 Pro provides even greater performance '
                    'and additional unified memory for more demanding apps and workflows. '
                    'Building on the M3 chip, M3 Pro provides even greater performance '
                    'and additional unified memory for more demanding apps and workflows.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  // Blog Content
                  const Text(
                    'Building on the M3 chip, M3 Pro provides even greater performance and '
                    'additional unified memory for more demanding apps and workflows. '
                    'Building on the M3 chip, M3 Pro provides even greater performance '
                    'and additional unified memory for more demanding apps and workflows. '
                    'Building on the M3 chip, M3 Pro provides even greater performance '
                    'and additional unified memory for more demanding apps and workflows.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Tags
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 25),
                    child: Text(
                      '#Technology #Apple Macbook #Latest product',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),

                  // Like and Dislike Row
                  const Row(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.thumb_up_alt_outlined,
                              size: 20, color: Colors.grey),
                          SizedBox(width: 5),
                          Text(
                            '12',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Row(
                        children: [
                          Icon(Icons.thumb_down_alt_outlined,
                              size: 20, color: Colors.grey),
                          SizedBox(width: 5),
                          Text(
                            '9',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  const Divider(
                    thickness: 2,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(height: height * 0.02),
                  const Text(
                    'Related Posts',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                   // Post 1
                  buildRelatedPost(
                    context,
                    imagePath: 'assets/related_post1.png',
                    title: 'Face ID on New M4 Chips. The wait is finally over!',
                  ),
                  SizedBox(height: height * 0.03),

                  // Post 2
                  buildRelatedPost(
                    context,
                    imagePath: 'assets/related_post2.png',
                    title: 'Face ID on New M4 Chips. The wait is finally over!',
                  ),
                  SizedBox(height: height * 0.03),

                  // Post 3
                  buildRelatedPost(
                    context,
                    imagePath: 'assets/related_post3.png',
                    title: 'Face ID on New M4 Chips. The wait is finally over!',
                  ),
                  SizedBox(height: height * 0.04),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
