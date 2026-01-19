import 'package:cosmetics/view_model/home_cubit/home_cubit.dart';
import 'package:cosmetics/views/layout/pages/home/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: HomeViewBody(),
    );
  }
}
