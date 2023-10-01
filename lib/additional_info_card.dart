import 'package:flutter/material.dart';

class AdditionalInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  const AdditionalInfoCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 40,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 8,
        ),
        Text(value),
      ],
    );
  }
}
