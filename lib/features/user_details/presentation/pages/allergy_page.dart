import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:home_cure/features/authentication/data/models/user_model.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit_state.dart';
import 'package:home_cure/features/user_details/data/models/medical_model.dart';
import 'package:home_cure/features/user_details/presentation/widgets/shared_list.dart';

class AllergyPagePage extends StatefulWidget {
  const AllergyPagePage({super.key});

  @override
  State<AllergyPagePage> createState() => _AllergyPagePageState();
}

class _AllergyPagePageState extends State<AllergyPagePage> {
  bool english = true;

  final controller = TextEditingController();
  late Details _details;
  @override
  void initState() {
    _details =
        (context.read<UserCubit>().state as UserCubitStateLoaded).user.details;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserCubitState>(
      listener: (context, state) {
        if (state is UserCubitStateLoaded) {
          final details = state.user.details;
          setState(() {
            _details = details;
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
      child: SharedList(
        onEdit: (list) {
          context.read<UserCubit>().updateUserDeatilsFunc(
                _details.copyWith(
                  allergy: list
                      .map(
                        (e) => Allergy(
                          description: e.description,
                          id: e.date.toString(),
                          date: e.date,
                        ),
                      )
                      .toList(),
                ),
              );
        },
        onSubmit: (list) {
          context.read<UserCubit>().updateUserDeatilsFunc(
                _details.copyWith(
                  allergy: list
                      .map(
                        (e) => Allergy(
                          description: e.description,
                          id: e.date.toString(),
                          date: e.date,
                        ),
                      )
                      .toList(),
                ),
              );
        },
        title: 'Allergy',
        subTitle: 'Allergy',
        list: _details.allergy
            .map(
              (e) => MediaclModel(
                description: e.description,
                id: e.id,
                date: e.date,
              ),
            )
            .toList(),
      ),
    );
  }
}
