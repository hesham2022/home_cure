import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/features/authentication/domain/entities/entities.dart';
import 'package:home_cure/features/notifications/presentation/widgets/medical_table_widget.dart';
import 'package:home_cure/features/notifications/presentation/widgets/profile_photo_widget.dart';
import 'package:home_cure/features/user_details/data/models/medical_model.dart';
import 'package:url_launcher/url_launcher.dart';

class UserInformationPage extends StatelessWidget {
  const UserInformationPage({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(35),
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                ProfilePhotoWidget(
                  user: user,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Text('Phone Number', style: textStyleWithPrimarySemiBold),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () async {
                        await launchUrl(
                          Uri.parse(
                            'tel:${user.phoneNumber}',
                          ),
                        );
                      },
                      child: Text(
                        user.phoneNumber,
                        style: textStyleWithSecondBold().copyWith(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Smooking', style: textStyleWithPrimarySemiBold),
                        const SizedBox(width: 20),
                        if (user.details.smoke)
                          const Icon(
                            Icons.check,
                          )
                        else
                          const Icon(Icons.close, color: seocondColor)
                      ],
                    ),
                    Row(
                      children: [
                        Text('Alchol', style: textStyleWithPrimarySemiBold),
                        const SizedBox(width: 20),
                        if (user.details.alcohol)
                          const Icon(
                            Icons.check,
                          )
                        else
                          const Icon(Icons.close, color: seocondColor)
                      ],
                    )
                  ],
                ),
                if (user.details.bloodType.isNotEmpty)
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            'Blood Type',
                            style: textStyleWithPrimarySemiBold,
                          ),
                          const SizedBox(width: 20),
                          Text(
                            user.details.bloodType,
                            style: textStyleWithSecondSemiBold,
                          )
                        ],
                      ),
                    ],
                  ),
                const SizedBox(height: 30),

                InkWell(
                  onTap: () {
                    context.router.push(
                      AttachmentsPageRouter2(
                          attachments: user.details.attachments),
                    );
                  },
                  child: Text(
                    'View User Attachments',
                    style: textStyleWithSecondBold().copyWith(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text('Current Medicenes', style: textStyleWithPrimarySemiBold),
                const SizedBox(height: 40),
                MedicalTableWidget(
                  subtitle: 'Medicene',
                  list: user.details.medicines
                      .map(
                        (e) => MediaclModel(
                          date: e.date,
                          id: e.id,
                          description: e.name,
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 30),
                Text('Main Complaint', style: textStyleWithPrimarySemiBold),
                const SizedBox(height: 40),
                MedicalTableWidget(
                  subtitle: 'Complaint',
                  list: user.details.complaintments
                      .map(
                        (e) => MediaclModel(
                          date: e.date,
                          id: e.id,
                          description: e.description,
                        ),
                      )
                      .toList(),
                ),
                ////////////////////////////////////////////////////////////////////////
                const SizedBox(height: 30),
                Text('Chronic Diseases', style: textStyleWithPrimarySemiBold),
                const SizedBox(height: 40),
                MedicalTableWidget(
                  subtitle: 'Disease',
                  list: user.details.chDiseases
                      .map(
                        (e) => MediaclModel(
                          date: e.date,
                          id: e.id,
                          description: e.description,
                        ),
                      )
                      .toList(),
                ),
                ////////////////////////////////////////////////////////////////////////
                const SizedBox(height: 30),
                Text('Allergy', style: textStyleWithPrimarySemiBold),
                const SizedBox(height: 40),
                MedicalTableWidget(
                  subtitle: 'Allergy',
                  list: user.details.allergy
                      .map(
                        (e) => MediaclModel(
                          date: e.date,
                          id: e.id,
                          description: e.description,
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
