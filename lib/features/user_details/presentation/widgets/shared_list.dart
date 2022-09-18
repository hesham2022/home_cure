import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/widgets/big_form_field.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_container.dart';
import 'package:home_cure/core/widgets/common_header.dart';
import 'package:home_cure/features/user_details/data/models/medical_model.dart';
import 'package:home_cure/features/user_details/presentation/widgets/edit_dialouge.dart';
import 'package:intl/intl.dart';

class SharedList extends StatefulWidget {
  const SharedList({
    super.key,
    required this.title,
    required this.subTitle,
    required this.list,
    required this.onSubmit,
    required this.onEdit,
  });
  final String title;
  final String subTitle;
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
      child: Padding(
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
                      'Descripe What  You Feel',
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
                  title: 'Done',
                ),
                const SizedBox(
                  width: 30,
                ),
                Button1(
                  onPressed: () {},
                  title: 'Cancel',
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
                      ...widget.list
                          .map(
                            (e) => Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        e.description,
                                        textAlign: TextAlign.start,
                                        style:
                                            textStyleWithPrimaryBold.copyWith(
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          DateFormat.yMMMEd().format(e.date),
                                          style:
                                              textStyleWithPrimaryBold.copyWith(
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        final result = await showDialog<String>(
                                          context: context,
                                          builder: (_) => const EditDialouge(
                                            title: 'Main Complaint',
                                          ),
                                        );
                                        if (result != null &&
                                            result.isNotEmpty) {
                                          final index = widget.list.indexWhere(
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
                                        widget.list.removeWhere(
                                          (element) => element.id == e.id,
                                        );

                                        widget.onEdit([...widget.list]);
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
                            Expanded(
                              child: Center(
                                child: Text(
                                  'Date',
                                  style: textStyleWithPrimaryBold.copyWith(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                            ),
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
    );
  }
}
