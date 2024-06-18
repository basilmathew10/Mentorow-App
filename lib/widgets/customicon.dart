import 'package:flutter/material.dart';

Widget customIcon(IconData icon) {
  return Container(
    padding: const EdgeInsets.all(5),
    decoration:
         BoxDecoration(shape: BoxShape.circle, 
        color: Colors.white.withOpacity(0.7),
        ),
    child:  Icon(
      icon,
      size: 30,
      color: Colors.blue.shade800,
    ),
  );
}
