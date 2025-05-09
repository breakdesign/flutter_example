import 'package:flutter/material.dart';

class PopularModel {
  String name;
  String icon;
  String level;
  String duration;
  String calorie;
  bool viewIsSelected;

  PopularModel({
    required this.name,
    required this.icon,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.viewIsSelected,
  });

  static List<PopularModel> getPopular()  {
    List<PopularModel> populars = [
      PopularModel(
        name: "Blueberry Pancake",
        icon: "assets/icons/blueberry_pancake.svg",
        level: "Medium",
        duration: "30 min",
        calorie: "230 kcal",
        viewIsSelected: true,
      ),
      PopularModel(
        name: "Salmon Nigiri",
        icon: "assets/icons/salmon_nigiri.svg",
        level: "Medium",
        duration: "20 min",
        calorie: "120 kcal",
        viewIsSelected: false,
      ),
    ];

    return populars;
  }
}