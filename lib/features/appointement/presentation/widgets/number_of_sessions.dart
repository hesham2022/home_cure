import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/features/appointement/presentation/blocs/appointment_params_cubit.dart/appointment_params_cubit.dart';
import 'package:home_cure/features/user_details/presentation/widgets/small_text.dart';
import 'package:home_cure/l10n/l10n.dart';

class NumberOfSessionsWidget extends StatefulWidget {
  const NumberOfSessionsWidget({
    super.key,
    this.onChange,
  });
  final Function(int v)? onChange;

  @override
  State<NumberOfSessionsWidget> createState() => _NumberOfSessionsWidgetState();
}

class _NumberOfSessionsWidgetState extends State<NumberOfSessionsWidget> {
  final controller = TextEditingController();
  int counter = 1;
  @override
  void initState() {
    controller
      ..text = counter.toString()
      ..addListener(() {
        counter = int.parse(controller.text);
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${context.l10n.numberOfSession} :',
            style: textStyleWithPrimaryBold.copyWith(fontSize: 16.sp),
          ),
          const SizedBox(
            width: 50,
            height: 50,
          ),
          Row(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: Center(
                  child: SmallTextFiel(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    color: Colors.white.withOpacity(.8),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  counter++;
                  if (widget.onChange != null) {
                    widget.onChange!(counter);
                  }
                  controller.text = counter.toString();
                  setState(() {});
                  context.read<AppointmentsParamsCubit>().addSessions(counter);
                },
                icon: const Icon(
                  Icons.add,
                  color: primaryColor,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
