import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:midow_app/core/utils/midow_colors.dart';
// import 'package:midow_app/presentation/blog/create_blog.dart';
import '../../core/utils/build_card.dart';
import '../../core/utils/build_tab.dart';
import '../../core/utils/menu_animation.dart';
import '../main/hamburger_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMenuOpen = false;
  int selectedIndex = 0;

  List<String> tabs = [
    'Latest',
    'For you',
    'Growth',
    'Design',
    'Sports',
    'Travel',
    'Technology'
  ];

  void toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
    });
  }

  void onTabClick(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: Container(), // Remove back button
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(isMenuOpen ? Icons.close : Icons.menu),
            onPressed: toggleMenu,
            iconSize: 25,
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Explore your \nworld of ideas',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  SearchBar(
                    padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                    ),
                    elevation: const WidgetStatePropertyAll(0),
                    side: const WidgetStatePropertyAll(
                      BorderSide(
                        color: Color.fromRGBO(226, 226, 226, 1),
                        width: 2.0,
                      ),
                    ),
                    backgroundColor:
                        const WidgetStatePropertyAll(Colors.transparent),
                    leading: Image.asset('assets/search_icon.png'),
                    hintText: 'Find interesting news',
                    hintStyle: const WidgetStatePropertyAll(
                      TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(135, 135, 135, 1),
                      ),
                    ),
                    textStyle: const WidgetStatePropertyAll(
                      TextStyle(
                        fontSize: 18,
                        color: AppColors.accentColor,
                      ),
                    ),
                    shape: const WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  const Divider(
                    height: 1,
                    thickness: 3,
                    color: Color.fromRGBO(226, 226, 226, 1),
                  ),
                  SizedBox(height: height * 0.01),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(tabs.length, (index) {
                        return buildTab(tabs[index], selectedIndex == index,
                            () => onTabClick(index));
                      }),
                    ),
                  ),
                  SizedBox(height: height * 0.04),

                  // Blog Post 1
                  buildBlogCard(
                    context,
                    'How Apple’s M3 chips make MacOS development less costly',
                    'Technology',
                    '6 min read',
                    'assets/card_img1.png',
                  ),
                  SizedBox(height: height * 0.04),

                  // Blog Post 2
                  buildBlogCard(
                    context,
                    '10 Things Doctors Say About Eating Fruits Everyday',
                    'Food & Nutrition',
                    '6 min read',
                    'assets/card_img2.png',
                  ),
                  SizedBox(height: height * 0.02),
                ],
              ),
            ),
          ),

          // Circular Expansion Animation for the menu
          CircleExpansionAnimation(
            isMenuOpen: isMenuOpen,
            backgroundColor: AppColors.primaryColor,
            screenSize: size,
            child: const HamburgerMenu(),
          ),
        ],
      ),
      floatingActionButton: isMenuOpen
          ? null
          : SizedBox(
              width: 65,
              height: 65,
              child: FloatingActionButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const CreateBlogScreen()));
                },
                backgroundColor: AppColors.primaryColor,
                shape: const CircleBorder(),
                child: const Icon(
                  FontAwesomeIcons.plus,
                  color: Colors.white,
                ),
              ),
            ),
    );
  }
}
