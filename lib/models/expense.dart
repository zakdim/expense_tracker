import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category {
  food(icon: Icons.lunch_dining),
  travel(icon: Icons.flight_takeoff),
  leisure(icon: Icons.movie),
  work(icon: Icons.work);

  const Category({required this.icon});

  final IconData icon;
}

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate => formatter.format(date);
}
