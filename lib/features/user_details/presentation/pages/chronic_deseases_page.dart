import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:home_cure/features/authentication/data/models/user_model.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit_state.dart';
import 'package:home_cure/features/user_details/data/models/medical_model.dart';
import 'package:home_cure/features/user_details/presentation/widgets/shared_list.dart';
import 'package:home_cure/l10n/l10n.dart';

class ChronicDiseasesPagePage extends StatefulWidget {
  const ChronicDiseasesPagePage({super.key});

  @override
  State<ChronicDiseasesPagePage> createState() =>
      _ChronicDiseasesPagePageState();
}

class _ChronicDiseasesPagePageState extends State<ChronicDiseasesPagePage> {
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
                hint: context.l10n.enterChronicDiseases,

        onEdit: (list) {
          context.read<UserCubit>().updateUserDeatilsFunc(
                _details.copyWith(
                  chDiseases: list
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
                  chDiseases: list
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
        title: context.l10n.chronicDiseases,
        subTitle: context.l10n.chronicDiseases,
        list: _details.chDiseases
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
