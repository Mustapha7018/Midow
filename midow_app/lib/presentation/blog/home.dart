import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:midow_app/presentation/main/hamburger_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // TODO
          },
        ),
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.bars),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const HamburgerMenu())); // To be edited
            },
          ),
        ],
      ),
      body: Container(
          // TODO
          ),
    );
  }
}
