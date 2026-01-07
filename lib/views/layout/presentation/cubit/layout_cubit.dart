 import 'package:cosmetics/views/layout/pages/cart/cart_view.dart';
import 'package:cosmetics/views/layout/pages/categories/categories_view.dart';
import 'package:cosmetics/views/layout/pages/home/widgets/home_view_body.dart';
import 'package:cosmetics/views/layout/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'layout_states.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());
  static LayoutCubit get(context) => BlocProvider.of(context);
  int selectedIndex = 0;
  List<Widget> screens = [
   HomeViewBody(),
   CategoriesView(),
    CartView(),
    ProfileView(),
    
  ];

  void changeIndex(int index) {
    selectedIndex = index;
    emit(LayoutChangeIndexState());
  }
}
