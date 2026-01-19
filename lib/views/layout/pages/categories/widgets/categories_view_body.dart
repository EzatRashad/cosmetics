import 'package:cosmetics/core/constants/api_constants.dart';
import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/widgets/custom_image_widget.dart';
import 'package:cosmetics/view_model/categories_cubit/categories_state.dart';
import 'package:cosmetics/view_model/categories_cubit/catigories_cubit.dart';
import 'package:cosmetics/views/layout/pages/categories/widgets/categories_App_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w),

          child: BlocBuilder<CatigoriesCubit, CategoriesState>(
            builder: (context, state) {
              return CustomScrollView(
                slivers: [
                  CategoriesAppBar(),

                  state is GetCatigoriesSuccess
                      ? SliverList.builder(
                          itemCount: state.categoryList.length,

                          itemBuilder: (context, index) => Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 69.h,
                                    child: AspectRatio(
                                      aspectRatio: 64.w / 69.h,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          10.r,
                                        ),
                                        child: Image(
                                          image: NetworkImage(
                                            "https://images.pexels.com/photos/15191189/pexels-photo-15191189.jpeg",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  12.pw,
                                  Text(
                                    state.categoryList[index].title,
                                    style: theme.titleMedium,
                                  ),
                                  Spacer(),
                                  AppImage(imageName: "arrow.svg"),
                                ],
                              ),
                              if (index < 5)
                                Divider(thickness: 1.h, height: 20.h),
                            ],
                          ),
                        )
                      : state is GetCatigoriesError
                      ? SliverToBoxAdapter(
                          child: Center(child: Text(state.message)),
                        )
                      : SliverToBoxAdapter(
                          child: Center(
                            child: Lottie.asset(loadingImage, width: 180),
                          ),
                        ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
