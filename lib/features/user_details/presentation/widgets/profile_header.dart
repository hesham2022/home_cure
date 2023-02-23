// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/app.dart';
import 'package:home_cure/core/api_config/api_constants.dart';
import 'package:home_cure/features/authentication/domain/entities/entities.dart';
import 'package:home_cure/features/authentication/domain/entities/upload_user_photo_params.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit_state.dart';
import 'package:home_cure/features/home/presentation/pages/home.dart';
import 'package:home_cure/gen/assets.gen.dart';
import 'package:image_picker/image_picker.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({
    super.key,
    this.showBackButton = false,
  });
  final bool showBackButton;
  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  User? user;
  @override
  void initState() {
    if (context.read<UserCubit>().state is UserCubitStateLoaded) {
      user = (context.read<UserCubit>().state as UserCubitStateLoaded).user;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return user == null
        ? Container()
        : Container(
            height: 300,
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: BlocListener<UserCubit, UserCubitState>(
              listener: (context, state) {
                if (state is UserCubitStateLoaded) {
                  EasyLoading.dismiss();
                  // Navigator.pop(context);
                  setState(() {
                    user = state.user;
                  });
                }
                // if (state is UserCubitStateLoading) {
                //    EasyLoading.show();
                //   // showGifLoading(context);
                // }
                if (state is UserCubitStateError) {
                  EasyLoading.showError(state.error.errorMessege);
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: const [
                        MyBackButton(),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          if (user!.photo != null)
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                '$domain/img/attachments/${user!.photo!}',
                              ),
                              radius: 100,
                            )
                          else
                            Container(
                              padding: const EdgeInsets.all(50),
                              height: 200,
                              width: 200,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Assets.svg.personAvatar.svg(),
                            ),
                          Positioned(
                            bottom: 5,
                            right: 5,
                            child: Container(
                              height: 50.h,
                              width: 50.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.4),
                                    blurRadius: 8,
                                    offset: const Offset(0, 3),
                                  )
                                ],
                              ),
                              child: InkWell(
                                onTap: () async {
                                  // final file =
                                  //     await FilePicker.platform.pickFiles();
                                  await EasyLoading.show();
                                  // final result = await FilePicker.platform
                                  //     .pickFiles();
                                  final _picker = ImagePicker();
                                  // Pick an image
                                  final file = await _picker.pickImage(
                                    source: ImageSource.gallery,
                                  );
                                  await EasyLoading.dismiss();

                                  if (file != null) {
                                    await context
                                        .read<UserCubit>()
                                        .uploadUserPhotoFunc(
                                          UploadUserPhotoParams(
                                            photo: file.path,
                                          ),
                                        );
                                  }
                                },
                                child: Transform.scale(
                                  scale: 1.5,
                                  child: const Icon(
                                    Icons.edit,
                                    color: seocondColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
  }
}
