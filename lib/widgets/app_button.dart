import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final bool isDisabled;
  final double padding;
  final Color color;
  final Widget? icon;
  final double? height;
  final double? radius;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Widget? child;

  const AppButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isDisabled = false,
    this.padding = 9,
    this.color = Colors.blue,
    this.icon,
    this.height,
    this.radius,
    this.textColor,
    this.fontWeight,
    this.fontSize, this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isDisabled ? null : () => onPressed(),
      style: ElevatedButton.styleFrom(
        backgroundColor: isDisabled ? Colors.blue : color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 4),
        ),
        padding: EdgeInsets.symmetric(vertical: padding),
        minimumSize: const Size(double.maxFinite, 39),
        maximumSize: const Size(double.maxFinite, 56),
        shadowColor: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) icon!,
          if (icon != null)
            const SizedBox(
              width: 6,
            ),
          if(child == null)
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize ?? 16,
                fontWeight: fontWeight ?? FontWeight.w600,
                fontFamily: 'Inter',
              ),
            ) else
            child!
        ],
      ),
    );
  }
}
