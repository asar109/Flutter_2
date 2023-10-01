import 'package:flutter/material.dart';

class HourlyForeCastCard extends StatelessWidget {
  final IconData icon;
  final String time;
  final String value;
  const HourlyForeCastCard(
      {super.key, required this.icon, required this.time, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 104,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                time,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              Icon(icon, size: 40, color: Colors.blueGrey),
              const SizedBox(
                height: 8,
              ),
              Text(value),
            ],
          ),
        ),
      ),
    );
  }
}
