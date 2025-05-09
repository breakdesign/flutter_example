import 'package:flutter/material.dart';

class DietModel {
  String name;
  String icon;
  String level;
  String duration;
  String calorie;
  bool viewIsSelected;
  LinearGradient backgroundColor;

  DietModel({
    required this.name,
    required this.icon,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.viewIsSelected,
    required this.backgroundColor,
  });

  static List<DietModel> getDiet()  {
    LinearGradient blueLinearGradient = LinearGradient(
      colors: [
        Color(0xff92A3FD),
        Color(0xff9DCEFF),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    LinearGradient purpleLinearGradient = LinearGradient(
      colors: [
        Color(0xffC58BF2),
        Color(0xffEEA4CE),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    List<DietModel> diets = [
      DietModel(
        name: "Honey Pancake",
        icon: "assets/icons/pancakes.svg",
        level: "Easy",
        duration: "30 min",
        calorie: "180 kcal",
        viewIsSelected: true,
        backgroundColor: blueLinearGradient,
      ),
      DietModel(
        name: "Canai Bread",
        icon: "assets/icons/canai.svg",
        level: "Easy",
        duration: "20 min",
        calorie: "230 kcal",
        viewIsSelected: false,
        backgroundColor: purpleLinearGradient,
      ),
    ];

    return diets;
  }
}