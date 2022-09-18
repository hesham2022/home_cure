// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:file_picker/file_picker.dart';
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
import 'package:home_cure/gen/assets.gen.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  late User user;
  @override
  void initState() {
    user = (context.read<UserCubit>().state as UserCubitStateLoaded).user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
            setState(() {
              user = state.user;
            });
            EasyLoading.dismiss();
          }
          if (state is UserCubitStateLoading) {
            EasyLoading.show();
          }
          if (state is UserCubitStateError) {
            EasyLoading.showError(state.error.errorMessege);
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    if (user.photo != null)
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          '$domain/img/attachments/${user.photo!}',
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
                            final file = await FilePicker.platform.pickFiles();

                            if (file != null) {
                              await context
                                  .read<UserCubit>()
                                  .uploadUserPhotoFunc(
                                    UploadUserPhotoParams(
                                      photo: file.files.first.path!,
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
                    )
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
