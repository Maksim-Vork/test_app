import 'package:flutter/material.dart';

Widget buildCard(
  BuildContext context, {
  required String title,
  required String subtitle,
  required String iconPath,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xFFE5E7EB),
                  ),
                  child: Image.asset(iconPath),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'DMSans',
                fontWeight: FontWeight.bold,
                color: Color(0xFF25228D),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'DMSans',
                color: Color(0xB225228D),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
