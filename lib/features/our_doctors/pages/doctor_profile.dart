import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/api_config/index.dart';
import 'package:home_cure/core/widgets/common_scaffold.dart';
import 'package:home_cure/features/authentication/domain/entities/entities.dart';
import 'package:home_cure/l10n/l10n.dart';

final spcializaions = [
  'Cardiology',
  'INTERNAL MEDICINE',
  'OEB/GYN',
  'E.N.T',
  'PEDIATRICS',
  'GERIATRICS',
  'CHEST',
];
final spcializaionsAr = [
  'القلب',
  'الباطنه',
  'التوليد وأمراض النساء',
  'الأنف والأن والحنجرة',
  'الأطفال',
  'امراض الشيخوخه',
  'الرئه',
];

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            // CommonHeader(
            //   title: '${App.isAr(context) ? 'د.' : 'Dr'}. ${user.name}',
            // ),
            const SizedBox(
              height: 30,
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(
                '$domain/img/attachments/${user.photo!}',
              ),
              radius: 100,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              '${App.isAr(context) ? 'د.' : 'Dr'}. ${user.name}',
              style: textStyleWithPrimaryBold.copyWith(color: Colors.black),
            ),
            Center(
              child: Text(
                spcializaionsAr[spcializaions.indexWhere(
                      (element) => element == user.specialization,
                    )] ??
                    '',
                style: textStyleWithSecondBold().copyWith(color: primaryColor),
              ),
            ),
            SizedBox(height: 40.w),
            if (user.experience != null)
              InfoTap(
                title: '${context.l10n.experience}:',
                info: '${user.experience} ${context.l10n.years}',
              ),
            if (user.degree != null)
              InfoTap(
                title: '${context.l10n.degree}:',
                info: '${user.degree} ',
              ),
            InfoTap(
              title: '${context.l10n.spicailization}:',
              info: spcializaionsAr[spcializaions
                  .indexWhere((element) => element == user.specialization)],
            ),
          ],
        ),
      ),
    );
  }
}

class InfoTap extends StatelessWidget {
  const InfoTap({
    super.key,
    required this.title,
    required this.info,
  });
  final String title;
  final String info;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.w),
      child: Row(
        children: [
          Text(
            title,
            style: textStyleWithPrimaryBold.copyWith(color: Colors.black),
          ),
          SizedBox(width: 20.w),
          Text(
            info,
            style: textStyleWithPrimarySemiBold.copyWith(
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
