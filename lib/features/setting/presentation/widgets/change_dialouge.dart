import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_container.dart';
import 'package:home_cure/features/user_details/presentation/widgets/small_text.dart';
import 'package:home_cure/l10n/l10n.dart';

class ChangeDialouge extends StatefulWidget {
  const ChangeDialouge({
    super.key,
    required this.title,
    required this.current,
    required this.onDone,
    this.keyboardType,
    this.validator,
  });
  final TextInputType? keyboardType;
  final String title;
  final String current;
  final Function(String value) onDone;
  final String? Function(String?)? validator;
  @override
  State<ChangeDialouge> createState() => _ChangeDialougeState();
}

class _ChangeDialougeState extends State<ChangeDialouge> {
  final TextEditingController controller = TextEditingController();
  final _key = GlobalKey<FormState>();
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
        height: 360,
        width: 380,
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                height: 48,
                width: 380,
                child: Text(
                  widget.current.isEmpty
                      ? (App.isAr(context)
                          ? ' اضافه ${widget.title}'
                          : 'Add ${widget.title}')
                      // 'Add ${widget.title}'
                      : (App.isAr(context)
                          ? 'تغيير ${widget.title}'
                          : 'Change ${widget.title}'),
                  style: textStyleWithPrimaryBold.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),

              /// TextFields
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.current.isNotEmpty)
                      Column(
                        children: [
                          Text(
                            App.isAr(context)
                                ? ' ${widget.title} الحالي  '
                                : 'Current ${widget.title}',
                            style: textStyleWithSecondSemiBold,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SmallTextFiel(
                            color: Colors.white,
                            enabled: false,
                            controller: TextEditingController()
                              ..text = widget.current,
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      App.isAr(context)
                          ? ' ${widget.title} الجديد  '
                          : 'New ${widget.title}',
                      style: textStyleWithSecondSemiBold,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SmallTextFiel(
                      keyboardType: widget.keyboardType,
                      controller: controller,
                      validator: widget.validator,
                      // (value) {
                      //   if (value!.isEmpty) {
                      //     return 'Name is empty';
                      //   }
                      //   if (value.length < 2) {
                      //     return 'Name is too short';
                      //   }
                      //   return null;
                      // },
                      isPhoneNumber: widget.title == 'Phone Number',
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Button1(
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            widget.onDone(controller.text);
                            context.router.pop();
                          }
                          // final status =
                          //     Formz.validate([Name.dirty(controller.text)]);
                          //     if(status == FormzStatus.invalid){

                          //     }
                        },
                        title: context.l10n.done,
                        size: const Size(170, 5),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
