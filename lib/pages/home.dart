import 'package:flutter/material.dart';
import 'package:flutter_example/models/category_model.dart';
import 'package:flutter_example/models/diet_model.dart';
import 'package:flutter_example/models/popular_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularModel> populars = [];

  void _getInitialInfo() {
    categories = CategoryModel.getCategory();
    diets = DietModel.getDiet();
    populars = PopularModel.getPopular();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();

    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _searchField(),
          SizedBox(height: 30),
          _categorySection(),
          SizedBox(height: 30),
          _dietSection(),
          SizedBox(height: 30),
          _popularSection(),
        ],
      ),
    );
  }

  Column _popularSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Popular",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 15),
        ListView.separated(
          itemCount: populars.length,
          shrinkWrap: true,
          separatorBuilder: (context, index) => SizedBox(height: 25),
          padding: EdgeInsets.only(left: 20, right: 20),
          itemBuilder: (context, index) {
            return Container(
              height: 115,
              decoration: BoxDecoration(
                color:
                    populars[index].viewIsSelected
                        ? Colors.white
                        : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color:
                        populars[index].viewIsSelected
                            ? Color(0xFF1D1617).withOpacity(0.07)
                            : Colors.transparent,
                    offset: Offset(0, 10),
                    blurRadius: 40,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(populars[index].icon),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        populars[index].name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '${populars[index].level} | ${populars[index].duration} | ${populars[index].calorie}',
                        style: TextStyle(
                          color: Color(0xFF7B6F72),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: Container(
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/icons/circle-arrow-right.svg',
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Column _dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Recommendation\nfor Diet",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 15),
        SizedBox(
          height: 240,
          child: ListView.separated(
            itemCount: diets.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 25),
            padding: EdgeInsets.only(left: 20, right: 20),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  gradient: diets[index].backgroundColor.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(16),
                ),
                width: 210,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: SvgPicture.asset(diets[index].icon),
                    ),
                    Text(
                      diets[index].name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${diets[index].level} | ${diets[index].duration} | ${diets[index].calorie}',
                      style: TextStyle(color: Color(0xFF7B6F72), fontSize: 12),
                    ),
                    Container(
                      height: 45,
                      width: 130,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            diets[index].viewIsSelected
                                ? Color(0xff92A3FD)
                                : Colors.transparent,
                            diets[index].viewIsSelected
                                ? Color(0xff9DCEFF)
                                : Colors.transparent,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          "View",
                          style: TextStyle(
                            color:
                                diets[index].viewIsSelected
                                    ? Colors.white
                                    : Color(0xFFC58BF2),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Column _categorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Category",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 15),
        SizedBox(
          height: 120,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 25),
            padding: EdgeInsets.only(left: 20, right: 20),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  gradient: categories[index].backgroundColor.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(16),
                ),
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      // decoration: BoxDecoration(
                      //   color: Colors.white,
                      //   shape: BoxShape.circle,
                      // ),
                      width: 50,
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(categories[index].icon),
                      ),
                    ),
                    Text(
                      categories[index].name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Container _searchField() {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xFF1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(15),
          hintText: "Search Pancake",
          hintStyle: TextStyle(color: Color(0xFFDDDADA), fontSize: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset('assets/icons/search.svg'),
          ),
          suffixIcon: SizedBox(
            width: 100,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  VerticalDivider(
                    color: Color(0xFFDDDADA),
                    indent: 12,
                    endIndent: 12,
                    thickness: 0.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: SvgPicture.asset('assets/icons/filter.svg'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        "Breakfast",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () => {},
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFFF7F8F8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
            height: 20,
            width: 20,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () => {},
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            decoration: BoxDecoration(
              color: Color(0xFFF7F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              'assets/icons/dot.svg',
              height: 5,
              width: 5,
            ),
          ),
        ),
      ],
    );
  }
}
