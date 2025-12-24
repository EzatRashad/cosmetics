import 'package:cosmetics/views/layout/domain/bottom_navigation_bar_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'naivation_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.onItemTapped});
  final ValueChanged<int> onItemTapped;
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 22.h),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration:   ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.r)),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: bottomNavigationBarItems.asMap().entries.map((e) {
          var index = e.key;
          var entity = e.value;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                  widget.onItemTapped(index);
                });
              },
              child: NaivgationBarItem(
                isSelected: selectedIndex == index,
                bottomNavigationBarEntity: entity,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
