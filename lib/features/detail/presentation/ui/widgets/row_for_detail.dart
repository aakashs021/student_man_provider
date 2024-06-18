import 'package:flutter/material.dart';

Row rowfordetail(String text, String detail, IconData icon) {
  return Row(
    children: [
      Icon(icon, color: Colors.grey[600]),
      const SizedBox(width: 10),
      Text(
        '$text: ',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      Expanded(
        child: Text(
          detail,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    ],
  );
}
