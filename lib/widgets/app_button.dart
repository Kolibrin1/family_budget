import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final bool isDisabled;
  final double padding;
  final List<Color> gradientColors; // Gradient colors
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
    required this.gradientColors,
    this.icon,
    this.height,
    this.radius,
    this.textColor,
    this.fontWeight,
    this.fontSize,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isDisabled ? null : () => onPressed(),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 12),
        ),
        padding: EdgeInsets.symmetric(vertical: padding),
        minimumSize: const Size(double.maxFinite, 48),
        elevation: 6,
        shadowColor: Colors.black.withOpacity(0.2),
        backgroundColor: Colors.transparent,
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            stops: [0.0, 0.25, 0.75, 1.0],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            transform: const GradientRotation(6.76),
          ),
          borderRadius: BorderRadius.circular(radius ?? 12),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: padding),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) icon!,
              if (icon != null)
                const SizedBox(
                  width: 6,
                ),
              if (child == null)
                Text(
                  title,
                  style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontSize: fontSize ?? 16,
                    fontWeight: fontWeight ?? FontWeight.w600,
                    fontFamily: 'Inter',
                  ),
                )
              else
                child!,
            ],
          ),
        ),
      ),
    );
  }
}
