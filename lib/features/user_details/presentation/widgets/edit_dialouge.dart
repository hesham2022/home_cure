import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_cure/core/widgets/big_form_field.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_container.dart';
import 'package:home_cure/features/appointement/presentation/pages/create_appointement.dart';

class EditDialouge extends StatefulWidget {
  const EditDialouge({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<EditDialouge> createState() => _EditDialougeState();
}

class _EditDialougeState extends State<EditDialouge> {
  final TextEditingController controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // backgroundColor: Colors.white.withOpacity(.8),
      insetPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: CommonContainer(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomRight,
          end: FractionalOffset.topLeft,
          colors: [
            const Color(0xffF8E5E8).withOpacity(.8),
            const Color(0xffE6DAF5).withOpacity(.8),
            const Color(0xffE4F0FC).withOpacity(.8),
            const Color(0xffE8EEF2).withOpacity(.8),
          ],
        ),
        height: 400,
        width: 380,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// TextFields
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  BighFormField(
                    focusNode: _focusNode,
                    controller: controller,
                    fillColor: Colors.white,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Button1(
                      onPressed: () {
                        context.router.pop<String>(controller.text);
                        final currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                      },
                      title: 'Done',
                      size: const Size(170, 5),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
