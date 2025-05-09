import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String icon;
  LinearGradient backgroundColor;

  CategoryModel({
    required this.name,
    required this.icon,
    required this.backgroundColor,
  });

  static List<CategoryModel> getCategory()  {
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

    List<CategoryModel> categories = [
      CategoryModel(
        name: "Salad",
        icon: "assets/icons/salad.svg",
        backgroundColor: blueLinearGradient,
      ),
      CategoryModel(
        name: "Cake",
        icon: "assets/icons/cake.svg",
        backgroundColor: purpleLinearGradient,
      ),
      CategoryModel(
        name: "Pie",
        icon: "assets/icons/pie.svg",
        backgroundColor: blueLinearGradient,
      ),
      CategoryModel(
        name: "Smoothie",
        icon: "assets/icons/smoothie.svg",
        backgroundColor: purpleLinearGradient,
      ),
    ];

    return categories;
  }
}