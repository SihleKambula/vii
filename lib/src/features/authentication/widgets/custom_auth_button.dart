import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  final String text;
  final Widget icon;
  final VoidCallback onTap;
  const CustomAuthButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.secondary,
      elevation: .5,
      borderRadius: BorderRadius.circular(25),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(25),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [icon, SizedBox(width: 10), Text(text)],
          ),
        ),
      ),
    );
  }
}
