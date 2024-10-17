import 'package:flutter/material.dart';

class CircleExpansionAnimation extends StatelessWidget {
  final bool isMenuOpen;
  final Duration duration;
  final Widget child;
  final Color backgroundColor;
  final Size screenSize;

  const CircleExpansionAnimation({
    super.key,
    required this.isMenuOpen,
    required this.child,
    required this.backgroundColor,
    required this.screenSize,
    this.duration = const Duration(milliseconds: 600),
  });

  @override
  Widget build(BuildContext context) {
    double circleSize = isMenuOpen ? 2.0 : 0.0;

    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: circleSize),
      duration: duration,
      builder: (context, value, child) {
        return ClipPath(
          clipper: CircleClipper(value, screenSize),
          child: Container(
            color: backgroundColor,
            child: isMenuOpen ? child : null,
          ),
        );
      },
      child: child,
    );
  }
}

class CircleClipper extends CustomClipper<Path> {
  final double expansion;
  final Size screenSize;

  CircleClipper(this.expansion, this.screenSize);

  @override
  Path getClip(Size size) {
    final path = Path();
    double radius = screenSize.height * expansion * 1.5;

    path.addOval(Rect.fromCircle(
      center: Offset(screenSize.width - 30, 30),
      radius: radius,
    ));

    return path;
  }

  @override
  bool shouldReclip(CircleClipper oldClipper) => oldClipper.expansion != expansion;
}
