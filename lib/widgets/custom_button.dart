import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? pressedBackgroundColor;
  final Color? pressedTextColor;
  final double? width; 
  final double? height;

  const CustomButton({
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.pressedBackgroundColor,
    this.pressedTextColor,
    this.width, 
    this.height,
    super.key,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final Color normalBg =
        widget.backgroundColor ?? Theme.of(context).colorScheme.primary;
    final Color pressedBg = widget.pressedBackgroundColor ?? Colors.white;
    final Color normalText = widget.textColor ?? Colors.white;
    final Color pressedText =
        widget.pressedTextColor ?? Theme.of(context).colorScheme.primary;

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onPressed();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        width: widget.width ?? double.infinity,
        height: widget.height ?? 50,
        decoration: BoxDecoration(
          color: _isPressed ? pressedBg : normalBg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _isPressed ? normalBg : Colors.transparent,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        alignment: Alignment.center,
        child: Text(
          widget.text,
          style: TextStyle(
            color: _isPressed ? pressedText : normalText,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
