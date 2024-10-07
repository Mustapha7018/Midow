import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final bool isFilled;
  final bool withIcon;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color? buttonBackground;
  final double iconTextSpacing;
  final bool isIconRight;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    required this.text,
    this.icon,
    this.isFilled = true,
    this.withIcon = false,
    this.width,
    this.height,
    this.buttonBackground,
    this.iconTextSpacing = 8.0,
    this.isIconRight = false,
    this.textStyle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    const defaultTextStyle = TextStyle(
      color: Colors.white,
    );

    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width * 0.8,
      height: height ?? MediaQuery.of(context).size.height * 0.07,
      child: isFilled
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                backgroundColor: buttonBackground ?? Theme.of(context).primaryColor,
              ),
              onPressed: onPressed,
              child: withIcon && icon != null
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: isIconRight
                          ? [
                              Text(
                                text,
                                style: textStyle ?? defaultTextStyle,
                              ),
                              SizedBox(width: iconTextSpacing),
                              icon!,
                            ]
                          : [
                              icon!,
                              SizedBox(width: iconTextSpacing),
                              Text(
                                text,
                                style: textStyle ?? defaultTextStyle,
                              ),
                            ],
                    )
                  : Text(
                      text,
                      style: textStyle ?? defaultTextStyle,
                    ),
            )
          : OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                side: BorderSide(color: buttonBackground ?? Colors.white),
              ),
              onPressed: onPressed,
              child: withIcon && icon != null
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: isIconRight
                          ? [
                              Text(
                                text,
                                style: textStyle ?? defaultTextStyle,
                              ),
                              SizedBox(width: iconTextSpacing),
                              icon!,
                            ]
                          : [
                              icon!,
                              SizedBox(width: iconTextSpacing),
                              Text(
                                text,
                                style: textStyle ?? defaultTextStyle,
                              ),
                            ],
                    )
                  : Text(
                      text,
                      style: textStyle ?? defaultTextStyle,
                    ),
            ),
    );
  }
}
