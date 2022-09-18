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
import 'package:home_cure/features/authentication/domain/entities/upload_attachment_params.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit_state.dart';
import 'package:intl/intl.dart';

class AttachmentsPage extends StatefulWidget {
  const AttachmentsPage({super.key, this.attachments});
  final List<Attachment>? attachments;
  @override
  State<AttachmentsPage> createState() => _AttachmentsPageState();
}

class AttachmentModel {
  AttachmentModel({required this.path, required this.date});
  final String path;
  final DateTime date;
}

class _AttachmentsPageState extends State<AttachmentsPage> {
  late List<Attachment> attachments;
  @override
  void initState() {
    if (widget.attachments == null) {
      attachments = (context.read<UserCubit>().state as UserCubitStateLoaded)
          .user
          .details
          .attachments;
    } else {
      attachments = widget.attachments!;
    }
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocListener<UserCubit, UserCubitState>(
        listener: (context, state) {
          if (state is UserCubitStateLoaded) {
            final details = state.user.details;
            setState(() {
              attachments = details.attachments;
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
              const CommonHeader(title: 'Attachments'),
              if (widget.attachments == null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () async {
                        final file = await FilePicker.platform.pickFiles();
                        if (file != null) {
                          await context
                              .read<UserCubit>()
                              .uploadUserAttatchmentFunc(
                                UploadAttachmentParams(
                                  attachment: file.files.first.path!,
                                  name: file.files.first.name,
                                ),
                              );
                        }
                      },
                      icon: Icon(
                        Icons.upload,
                        color: primaryColor,
                        size: 40.sp,
                      ),
                    )
                  ],
                ),
              Column(
                children: [
                  ...attachments.map(
                    (e) {
                      final extension = e.url.split('/').last.split('.').last;
                      return Column(
                        children: [
                          ListTile(
                            onTap: () async {
                              if (extension == 'png' ||
                                  extension == 'jpeg' ||
                                  extension == 'jpg') {
                                await context.router.push(
                                  PhotoViewPageeRouter(
                                    path: '$domain/img/attachments/${e.url}',
                                  ),
                                );
                              }
                              if (extension == 'pdf') {
                                await context.router.push(
                                  PdfViewerPageRouter(
                                    paht: '$domain/img/attachments/${e.url}',
                                  ),
                                );
                              }
                            },
                            title: Text(
                              e.url.split('/').last,
                              style: textStyleWithPrimaryBold,
                            ),
                            subtitle: Text(
                              DateFormat('yyyy-MM-dd').format(e.date),
                              style: textStyleWithSecondSemiBold.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            trailing: getIcon(
                              e.url.split('/').last.split('.').last,
                              e.url,
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
