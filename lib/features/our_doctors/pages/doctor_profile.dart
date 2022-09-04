import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/widgets/common_header.dart';
import 'package:home_cure/core/widgets/common_scaffold.dart';
import 'package:home_cure/features/Services/presentation/pages/services_page.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            const CommonHeader(title: 'Dr.Ahmed Ibrahim'),
            const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuOH-gYd6No-lHkjkrDZ61YRvOimizsL5GZw&usqp=CAU',
              ),
              radius: 100,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Dr. Ahmed Ibrahim',
              style: textStyleWithPrimaryBold.copyWith(color: Colors.black),
            ),
            Center(
              child: Text(
                'Neurologist',
                style: textStyleWithSecondBold().copyWith(color: primaryColor),
              ),
            ),
            SizedBox(height: 40.w),
            const InfoTap(
              title: 'Experience:',
              info: '10 Years+',
            ),
            const InfoTap(
              title: 'Degree:',
              info: 'PHD from Cairo University',
            ),
            const InfoTap(
              title: 'Speciality:',
              info: 'Neurology',
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
