import 'package:flutter/material.dart';

Text buttonText({
  required String text,
}) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );
}