import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/core/utils/navigate.dart';
import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/utils/validatio.dart';
import 'package:cosmetics/core/widgets/app_button.dart';
import 'package:cosmetics/core/widgets/app_image.dart';
import 'package:cosmetics/core/widgets/app_input.dart';
import 'package:cosmetics/models/profile_model.dart';
import 'package:cosmetics/view_model/profile_cubit/profile_cubit.dart';
import 'package:cosmetics/view_model/profile_cubit/profile_state.dart';
import 'package:cosmetics/views/layout/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key, required this.profileModel});
  final ProfileModel profileModel;

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.profileModel.username);
    emailController = TextEditingController(text: widget.profileModel.email);
    phoneController = TextEditingController(
      text: widget.profileModel.phoneNumber,
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Text("Edit Profile"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: BlocProvider(
            create: (context) => ProfileCubit(),
            child: BlocConsumer<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      30.ph,

                      Center(
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 55.r,
                              backgroundColor: Colors.grey.shade200,
                              child: const AppImage(
                                imageName: "prof.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            CircleAvatar(
                              radius: 18.r,
                              backgroundColor: AppColors.primary,
                              child: const Icon(
                                Icons.edit,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                      40.ph,

                      Text("Personal Information", style: theme.titleMedium),
                      20.ph,

                      AppInput(
                        label: "Full Name",
                        controller: nameController,
                        validator: (value) =>
                            value!.isEmpty ? "Name can't be empty" : null,
                      ),

                      12.ph,

                      AppInput(
                        label: "Email Address",
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) => Validation.validateEmail(value),
                      ),

                      12.ph,

                      AppInput(
                        label: "Phone Number",
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        validator: (value) =>
                            value!.length < 10 ? "Invalid phone number" : null,
                      ),

                      50.ph,

                      state is UpdateProfileLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primary,
                              ),
                            )
                          : AppButton(
                              width: double.infinity,
                              height: 54.h,
                              radius: 16.r,
                              title: "Save Changes",
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<ProfileCubit>().updateProfile(
                                    username: nameController.text,
                                    phoneNumber: phoneController.text,
                                    email: emailController.text,
                                  );
                                }
                              },
                            ),

                      20.ph,
                    ],
                  ),
                );
              },
              listener: (context, state) {
                if (state is UpdateProfileSuccess) {
                  context.showSnackBar(message: state.message);
                  context.nextScreen(ProfileView());
                }
                if (state is UpdateProfileError) {
                  context.showSnackBar(
                    message: state.error,
                    backgroundColor: AppColors.error,
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
