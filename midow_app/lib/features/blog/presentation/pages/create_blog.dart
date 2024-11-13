import 'package:flutter/material.dart';
import 'package:midow_app/core/utils/midow_colors.dart';

import '../../../../core/utils/bottom_slider.dart';
import '../../../../core/utils/midow_buttons.dart';

class CreateBlogScreen extends StatelessWidget {
  const CreateBlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: IconButton(
          icon: Image.asset('assets/back_btn.png'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            icon: Image.asset('assets/menu_icon.png'),
            onPressed: () {
              // TODO
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Create ',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 32,
                    ),
                  ),
                  TextSpan(
                    text: 'Blog',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: height * 0.05,
            ),

            // Title
            const Text(
              '*Title',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Eg. Top 15 places for vacation',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                ),
                contentPadding: EdgeInsets.all(16),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                  ),
                  borderRadius: BorderRadius.zero,
                ),
              ),
              cursorColor: AppColors.primaryColor,
            ),
            const SizedBox(height: 25),

            // Category
            const Text(
              '*Category',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                ),
                contentPadding: EdgeInsets.all(16),
              ),
              items: ['Health & Fitness', 'Travel', 'Technology']
                  .map((category) => DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      ))
                  .toList(),
              onChanged: (value) {
                // Add dropdown logic here
              },
            ),
            const SizedBox(height: 25),

            // Body
            const Text(
              '*Body',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const TextField(
              maxLines: 6,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                ),
                contentPadding: EdgeInsets.all(16),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                  ),
                  borderRadius: BorderRadius.zero,
                ),
              ),
              cursorColor: AppColors.primaryColor,
            ),
            const SizedBox(height: 25),

            // Image
            const Text(
              '*Image',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Choose image',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                ),
                contentPadding: EdgeInsets.all(16),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                  ),
                  borderRadius: BorderRadius.zero,
                ),
              ),
              onTap: () {
                // Add image picker logic here
              },
            ),
            const SizedBox(height: 25),

            // Tags
            const Text(
              '*Select tags',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SearchBar(
              padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(vertical: 8, horizontal: 18),
              ),
              elevation: const WidgetStatePropertyAll(0),
              side: const WidgetStatePropertyAll(
                BorderSide(
                  color: AppColors.primaryColor,
                  width: 1,
                ),
              ),
              backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
              leading: Image.asset('assets/search_icon.png'),
              hintText: 'Browse trending tags',
              hintStyle: const WidgetStatePropertyAll(
                TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(135, 135, 135, 1),
                ),
              ),
              textStyle: const WidgetStatePropertyAll(
                TextStyle(
                  fontSize: 18,
                  color: AppColors.primaryColor,
                ),
              ),
              shape: const WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Tag Chips
            Wrap(
              spacing: 8.0,
              children: [
                Chip(
                  label: const Text('#Health'),
                  onDeleted: () {
                    // TODO
                  },
                ),
                Chip(
                  label: const Text('#Wellness'),
                  onDeleted: () {
                    // TODO
                  },
                ),
                Chip(
                  label: const Text('#Yoga'),
                  onDeleted: () {
                    // TODO
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Create Blog Button
            CustomButton(
              text: 'Create Blog',
              isFilled: true,
              isIconRight: false,
              withIcon: false,
              colorFill: AppColors.primaryColor,
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              onPressed: () {
                showLocationBottomSheet(
                  context,
                  title: 'Set your location',
                  subtext: 'Choose your location to start finding\nproperties around you',
                  buttonText: 'Use My Location',
                  iconPath:
                      'assets/location_icon.png', 
                  onUseMyLocation: () {
                    // Handle the "Use My Location" button press
                  },
                  onSkip: () {
                    // Handle the optional "Skip" button press
                  },
                  skipText: 'Skip for now', // Optional skip text
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
