import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableAction extends StatelessWidget {
  const SlidableAction({
    super.key,
    this.flex = 1,
    this.backgroundColor = Colors.white,
    this.foregroundColor,
    this.autoClose = true,
    required this.onPressed,
    this.icon,
    this.spacing = 4,
    this.label,
    this.borderRadius = BorderRadius.zero,
    this.padding,
  })  : assert(flex > 0),
        assert(icon != null || label != null);

  final int flex;

  final Color backgroundColor;

  final Color? foregroundColor;

  final bool autoClose;

  final SlidableActionCallback? onPressed;

  final Widget? icon;

  final double spacing;

  final String? label;

  final BorderRadius borderRadius;

  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final children = List<Widget>.empty(growable: true);

    if (icon != null) {
      children.add(
        icon!,
      );
    }

    if (label != null) {
      if (children.isNotEmpty) {
        children.add(
          SizedBox(height: spacing),
        );
      }

      children.add(
        Text(
          label!,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 12),
        ),
      );
    }

    final child = children.length == 1
        ? children.first
        : Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...children
      ],
    );

    return CustomSlidableAction(
      borderRadius: borderRadius,
      padding: padding,
      onPressed: onPressed,
      autoClose: autoClose,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      flex: flex,
      child: child,
    );
  }
}