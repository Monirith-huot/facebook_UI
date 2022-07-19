import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final VoidCallback onPreesed;

  const CircleButton({
    super.key,
    required this.icon,
    required this.iconSize,
    required this.onPreesed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(
          icon,
          size: iconSize,
          color: Colors.black,
        ),
        onPressed: onPreesed,
      ),
    );
  }
}
