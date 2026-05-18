import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.backgroundColor,
    this.iconColor,
    this.onTap,
    this.iconSize,
    required this.title,
    required this.icon,
  });
  final String title;
  final IconData icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? iconSize;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.amber,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(12),
        height: 50,
        width: 150,
        child: Row(
          mainAxisAlignment: .center,
          spacing: 10,
          children: [
            Text(title, style: TextStyle(color: Colors.deepPurple)),
            Icon(icon, color: iconColor ?? Colors.white, size: iconSize ?? 24),
          ],
        ),
      ),
    );
  }
}
