import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/widgets/common_container.dart';
import 'package:home_cure/features/user_details/data/models/medical_model.dart';
import 'package:home_cure/l10n/l10n.dart';
import 'package:intl/intl.dart';

class MedicalTableWidget extends StatelessWidget {
  const MedicalTableWidget({
    super.key,
    required this.list,
    required this.subtitle,
  });
  final List<MediaclModel> list;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Stack(
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
              if (list.isEmpty) Text(context.l10n.noData),
              ...list
                  .map(
                    (e) => Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                e.description,
                                textAlign: TextAlign.start,
                                style: textStyleWithPrimaryBold.copyWith(
                                  fontSize: 15.sp,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  DateFormat.yMMMEd().format(e.date),
                                  style: textStyleWithPrimaryBold.copyWith(
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                            ),
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
                          subtitle,
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
    );
  }
}
