import 'package:flutter/material.dart';

class CardItem {
  final String title;
  final String date;
  final IconData icon;
  final String description;

  CardItem({
    required this.title,
    required this.date,
    required this.icon,
    required this.description,
  });
}
