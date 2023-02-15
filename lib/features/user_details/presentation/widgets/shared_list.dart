import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/widgets/big_form_field.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_container.dart';
import 'package:home_cure/core/widgets/common_header.dart';
import 'package:home_cure/features/home/presentation/pages/home.dart';
import 'package:home_cure/features/user_details/data/models/medical_model.dart';
import 'package:home_cure/features/user_details/presentation/widgets/edit_dialouge.dart';
import 'package:home_cure/l10n/l10n.dart';

class SharedList extends StatefulWidget {
  const SharedList({
    super.key,
    required this.title,
    required this.subTitle,
    required this.list,
    required this.onSubmit,
    required this.onEdit,
    required this.hint,
  });
  final String title;
  final String subTitle;
  final String hint;
  final List<MediaclModel> list;
  final Function(List<MediaclModel> list) onSubmit;
  final Function(List<MediaclModel> list) onEdit;

  @override
  State<SharedList> createState() => _SharedListState();
}

class _SharedListState extends State<SharedList> {
  bool english = true;

  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const MyBackButton(),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                CommonHeader(title: widget.title),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  height: 287.h,
                  decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40.h,
                        ),
                        Text(
                          //   context.l10n.select_what_you_feel,
                          widget.hint,
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: const Color(0xff1AA9A0),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Expanded(
                          child: BighFormField(
                            controller: controller,
                            hint: widget.hint,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Button1(
                      onPressed: () {
                        if (controller.text.isNotEmpty) {
                          // setState(() {
                          widget.list.add(
                            MediaclModel(
                              id: DateTime.now().toString(),
                              description: controller.text,
                              date: DateTime.now(),
                            ),
                          );
                          widget.onSubmit(widget.list);
                          // });
                          controller.clear();
                        }
                      },
                      title: context.l10n.done,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Button1(
                      onPressed: controller.clear,
                      title: context.l10n.cancel,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CommonContainer(
                      constraints: const BoxConstraints(minHeight: 100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.2),
                          offset: const Offset(0, 3),
                          blurRadius: 10,
                          spreadRadius: 2,
                        )
                      ],
                      color: Colors.white,
                      width: double.infinity,
                      br: 10,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          if (widget.list.isEmpty) Text(context.l10n.noData),
                          ...widget.list
                              .map(
                                (e) => Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            e.description,
                                            textAlign: TextAlign.start,
                                            style: textStyleWithPrimaryBold
                                                .copyWith(
                                              fontSize: 15.sp,
                                            ),
                                          ),
                                        ),
                                        // Expanded(
                                        //   child: Center(
                                        //     child: Text(
                                        //       DateFormat.yMMMEd().format(e.date),
                                        //       style: textStyleWithPrimaryBold.copyWith(
                                        //         fontSize: 15.sp,
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),
                                        IconButton(
                                          onPressed: () async {
                                            final result =
                                                await showDialog<String>(
                                              context: context,
                                              builder: (_) => EditDialouge(
                                                title: 'Main Complaint',
                                                oldString: e.description,
                                              ),
                                            );
                                            if (result != null &&
                                                result.isNotEmpty) {
                                              final index =
                                                  widget.list.indexWhere(
                                                (element) => element.id == e.id,
                                              );
                                              widget.list[index] = MediaclModel(
                                                id: e.id,
                                                date: e.date,
                                                description: result,
                                              );
                                              widget.onEdit([...widget.list]);
                                              // setState(() {});
                                            }
                                          },
                                          icon: const Icon(
                                            Icons.edit,
                                            color: primaryColor,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () async {
                                            // remove action

                                            // widget.list.removeWhere(
                                            //   (element) => element.id == e.id,
                                            // );

                                            // widget.onEdit([...widget.list]);

                                            await showDialog<void>(
                                              useRootNavigator: false,
                                              context: context,
                                              builder: (_) => Dialog(
                                                // backgroundColor: Colors.white.withOpacity(.8),
                                                insetPadding:
                                                    const EdgeInsets.all(10),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: CommonContainer(
                                                  gradient: LinearGradient(
                                                    begin: FractionalOffset
                                                        .bottomRight,
                                                    end: FractionalOffset
                                                        .topLeft,
                                                    colors: [
                                                      const Color(0xffF8E5E8)
                                                          .withOpacity(.8),
                                                      const Color(0xffE6DAF5)
                                                          .withOpacity(.8),
                                                      const Color(0xffE4F0FC)
                                                          .withOpacity(.8),
                                                      const Color(0xffE8EEF2)
                                                          .withOpacity(.8),
                                                    ],
                                                  ),
                                                  // height: (widget.appointment.isOnPeocessing && widget.appointment.payed)
                                                  height: 130,
                                                  // width: 300,

                                                  child: Form(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                        20,
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            context.l10n
                                                                .areYouSure,
                                                            style:
                                                                textStyleWithPrimaryBold,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Button1(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                    context,
                                                                  );
                                                                },
                                                                title: context
                                                                    .l10n
                                                                    .cancel,
                                                                size:
                                                                    const Size(
                                                                  140,
                                                                  5,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 40,
                                                              ),
                                                              Button1(
                                                                onPressed:
                                                                    () async {
                                                                  widget.list
                                                                      .removeWhere(
                                                                    (element) =>
                                                                        element
                                                                            .id ==
                                                                        e.id,
                                                                  );

                                                                  widget.onEdit(
                                                                    [
                                                                      ...widget
                                                                          .list
                                                                    ],
                                                                  );
                                                                  Navigator.pop(
                                                                    context,
                                                                  );
                                                                },
                                                                title: context
                                                                    .l10n.yes,
                                                                size:
                                                                    const Size(
                                                                  140,
                                                                  5,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );

                                            // setState(() {});
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: primaryColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList()
                        ],
                      ),
                    ),
                    Positioned(
                      top: -25,
                      right: 0,
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: CommonContainer(
                          color: primaryColor,
                          height: 50,
                          br: 15,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      widget.subTitle,
                                      style: textStyleWithPrimaryBold.copyWith(
                                        color: Colors.white,
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                  ),
                                ),
                                // Expanded(
                                //   child: Center(
                                //     child: Text(
                                //       context.l10n.date,
                                //       style: textStyleWithPrimaryBold.copyWith(
                                //         color: Colors.white,
                                //         fontSize: 15.sp,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.edit,
                                    color: primaryColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
