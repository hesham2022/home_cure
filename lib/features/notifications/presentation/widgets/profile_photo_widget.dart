import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:home_cure/app/app.dart';
import 'package:home_cure/core/api_config/api_constants.dart';
import 'package:home_cure/features/authentication/domain/entities/entities.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit_state.dart';
import 'package:home_cure/gen/assets.gen.dart';

class ProfilePhotoWidget extends StatefulWidget {
  const ProfilePhotoWidget({super.key, this.user});
  final User? user;
  @override
  State<ProfilePhotoWidget> createState() => _ProfilePhotoWidgetState();
}

class _ProfilePhotoWidgetState extends State<ProfilePhotoWidget> {
  late User user;
  @override
  void initState() {
    if (widget.user == null) {
      user = (context.read<UserCubit>().state as UserCubitStateLoaded).user;
    } else {
      user = widget.user!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserCubitState>(
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
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            user.name,
            style: textStyleWithPrimaryBold,
          )
        ],
      ),
    );
  }
}
