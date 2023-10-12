import 'package:flutter/material.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    super.key,
    required this.text,
    this.color,
    this.horizontal,
    this.onTap,
  });
  final String text;
  final Color? color;

  final double? horizontal;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color ?? const Color(0xff198DE1).withOpacity(0.69),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontal ?? 130,
            vertical: 12,
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
