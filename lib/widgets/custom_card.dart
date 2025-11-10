import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double elevation;
  final Color color;
  final BorderRadiusGeometry borderRadius;
  final Color? borderColor;

  const CustomCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24),
    this.margin = const EdgeInsets.symmetric(horizontal: 16),
    this.elevation = 5,
    this.color = Colors.white,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: elevation,
      margin: margin,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: BorderSide(
          color: borderColor ?? Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: Padding(
        padding: padding!,
        child: child,
      ),
    );
  }
}
