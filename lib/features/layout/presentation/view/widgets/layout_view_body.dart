import 'package:cosmetics/features/layout/presentation/view/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/layout_cubit.dart';
import '../../cubit/layout_states.dart';

class LayoutViewBody extends StatefulWidget {
  const LayoutViewBody({super.key});

  @override
  State<LayoutViewBody> createState() => _LayoutViewBodyState();
}

class _LayoutViewBodyState extends State<LayoutViewBody> {
  LayoutCubit layoutCubit = LayoutCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutStates>(
      bloc: layoutCubit,
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: CustomBottomNavigationBar(
            onItemTapped: (int value) {
              layoutCubit.changeIndex(value);
            },
          ),
          body: layoutCubit.screens[layoutCubit.selectedIndex],
        );
      },
    );
  }
}
