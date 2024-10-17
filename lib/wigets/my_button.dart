import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final text;
  final Image icon;
  final onPressed;
  const MyButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          Color(0xff886AE2),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        child: Row(
          children: [
            Text(
              "$text",
              style: const TextStyle(
                color: Color(0xff481E71),
                fontSize: 24.0,
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            icon,
          ],
        ),
      ),
    );
  }
}
