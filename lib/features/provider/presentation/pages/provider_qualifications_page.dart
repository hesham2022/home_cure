import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/api_config/api_constants.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/common_header.dart';
import 'package:home_cure/features/authentication/data/models/user_model.dart';
import 'package:home_cure/features/authentication/domain/entities/ulpoad_provider_attachments_params.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit_state.dart';
import 'package:home_cure/features/login/presentation/widgets/register_field.dart';
import 'package:home_cure/features/user_details/presentation/pages/attachments_page.dart';

class ProviderQualificationsPage extends StatefulWidget {
  const ProviderQualificationsPage({super.key});

  @override
  State<ProviderQualificationsPage> createState() =>
      _ProviderQualificationsPageState();
}

class _ProviderQualificationsPageState
    extends State<ProviderQualificationsPage> {
  late List<Qualification> attachments;
  @override
  void initState() {
    attachments = (context.read<UserCubit>().state as UserCubitStateLoaded)
        .user
        .qualifications!;
    super.initState();
  }

  final paths = <AttachmentModel>[];
  Widget getIcon(String extension, String path) {
    if (extension == 'pdf') {
      return const Icon(Icons.picture_as_pdf_sharp);
    }
    if (extension == 'png' || extension == 'jpeg' || extension == 'jpg') {
      return Image.network(
        '$domain/img/attachments/$path',
        height: 40,
        width: 40,
      );
    }
    return Text(
      extension,
      style: textStyleWithSecondBold().copyWith(fontStyle: FontStyle.italic),
    );
  }

  final _key = GlobalKey<FormState>();
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocListener<UserCubit, UserCubitState>(
        listener: (context, state) {
          if (state is UserCubitStateLoaded) {
            setState(() {
              attachments = state.user.qualifications!;
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
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              const CommonHeader(title: 'Qualifications'),
              Form(
                key: _key,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: RegisterField(
                        controller: controller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Provide Name';
                          }
                          return null;
                        },
                        suffix: InkWell(
                          onTap: () async {
                            // if (_key.currentState!.validate()) {

                            if (controller.text.isEmpty) {
                              ScaffoldMessenger.of(context)
                                ..clearSnackBars()
                                ..showSnackBar(
                                  SnackBar(
                                    content: Row(
                                      children: const [
                                        SizedBox(
                                          width: 100,
                                        ),
                                        Text('Please provide a name'),
                                      ],
                                    ),
                                  ),
                                );
                              return;
                            }
                            final file = await FilePicker.platform.pickFiles();
                            if (file != null) {
                              await Future.delayed(Duration.zero, () {
                                context
                                    .read<UserCubit>()
                                    .uploadProviderAttatchmentFunc(
                                      UploadPorviderAttachmentParams(
                                        attachment: file.files.first.path!,
                                        title: controller.text,
                                      ),
                                    );
                              });
                            }
                            // }
                          },
                          child: const Icon(
                            Icons.upload,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 39),
              Column(
                children: [
                  ...attachments.map(
                    (e) {
                      final extension =
                          e.attachment.split('/').last.split('.').last;
                      return Column(
                        children: [
                          ListTile(
                            leading: IconButton(
                              onPressed: () async {
                                print(e.id);
                                await context
                                    .read<UserCubit>()
                                    .deleteProviderAttatchmentFunc(e.id);
                              },
                              icon: const Icon(Icons.delete),
                            ),
                            onTap: () async {
                              if (extension == 'png' ||
                                  extension == 'jpeg' ||
                                  extension == 'jpg') {
                                await context.router.push(
                                  PhotoViewPageeRouter(
                                    path:
                                        '$domain/img/attachments/${e.attachment}',
                                  ),
                                );
                              }
                              if (extension == 'pdf') {
                                await context.router.push(
                                  PdfViewerPageRouter(
                                    paht:
                                        '$domain/img/attachments/${e.attachment}',
                                  ),
                                );
                              }
                            },
                            title: Text(
                              e.title,
                              style: textStyleWithPrimaryBold,
                            ),
                            // subtitle: Text(
                            //   DateFormat('yyyy-MM-dd').format(e.date),
                            //   style: textStyleWithSecondSemiBold.copyWith(
                            //     fontSize: 14,
                            //   ),
                            // ),
                            trailing: getIcon(
                              e.attachment.split('/').last.split('.').last,
                              e.attachment,
                            ),
                          ),
                          const Divider(
                            height: 2,
                            thickness: 2,
                          )
                        ],
                      );
                    },
                  ).toList()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
