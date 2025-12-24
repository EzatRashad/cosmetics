 import 'package:cosmetics/views/cart/cart_view.dart';
import 'package:cosmetics/views/categories/categories_view.dart';
import 'package:cosmetics/views/home/widgets/home_view_body.dart';
import 'package:cosmetics/views/profile/profile_view.dart';
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
