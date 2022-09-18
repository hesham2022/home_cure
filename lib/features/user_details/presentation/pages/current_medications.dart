import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:home_cure/features/authentication/data/models/user_model.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit_state.dart';
import 'package:home_cure/features/user_details/data/models/medical_model.dart';
import 'package:home_cure/features/user_details/presentation/widgets/shared_list.dart';

class CurrentMedicationsPage extends StatefulWidget {
  const CurrentMedicationsPage({super.key});

  @override
  State<CurrentMedicationsPage> createState() => _CurrentMedicationsPageState();
}

class _CurrentMedicationsPageState extends State<CurrentMedicationsPage> {
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
                  medicines: list
                      .map(
                        (e) => Medicine(
                          name: e.description,
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
                  medicines: list
                      .map(
                        (e) => Medicine(
                          name: e.description,
                          id: e.date.toString(),
                          date: e.date,
                        ),
                      )
                      .toList(),
                ),
              );
        },
        title: 'Current medications',
        subTitle: 'Medications',
        list: _details.medicines
            .map(
              (e) => MediaclModel(
                description: e.name,
                id: e.id,
                date: e.date,
              ),
            )
            .toList(),
      ),
    );
  }
}
