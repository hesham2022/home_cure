import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/api_config/api_constants.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_container.dart';
import 'package:home_cure/core/widgets/common_header.dart';
import 'package:home_cure/features/authentication/data/models/user_model.dart';
import 'package:home_cure/features/authentication/domain/entities/upload_attachment_params.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit_state.dart';
import 'package:home_cure/features/home/presentation/pages/home.dart';
import 'package:home_cure/l10n/l10n.dart';
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
    return Stack(
      children: [
        SingleChildScrollView(
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
                      CommonHeader(title: context.l10n.attachments),
                      // if (widget.attachments == null)
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     IconButton(
                      //       onPressed: () async {
                      //         final file = await FilePicker.platform.pickFiles();
                      //         if (file != null) {
                      //           await context.read<UserCubit>().uploadUserAttatchmentFunc(
                      //                 UploadAttachmentParams(
                      //                   attachment: file.files.first.path!,
                      //                   name: file.files.first.name,
                      //                 ),
                      //               );
                      //         }
                      //       },
                      //       icon: Icon(
                      //         Icons.upload,
                      //         color: primaryColor,
                      //         size: 40.sp,
                      //       ),
                      //     )
                      //   ],
                      // ),
                      if (attachments.isEmpty)
                        Center(child: Text(context.l10n.noData))
                      else
                        Column(
                          children: [
                            ...attachments.map(
                              (e) {
                                final extension =
                                    e.url.split('/').last.split('.').last;
                                return Column(
                                  children: [
                                    ListTile(
                                      leading: IconButton(
                                        onPressed: () async {
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
                                                  end: FractionalOffset.topLeft,
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
                                                            20),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          context
                                                              .l10n.areYouSure,
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
                                                                  .l10n.cancel,
                                                              size: const Size(
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
                                                                await context
                                                                    .read<
                                                                        UserCubit>()
                                                                    .deleteUserAttatchmentFunc(
                                                                      e.id,
                                                                    );
                                                                Future.delayed(
                                                                    Duration
                                                                        .zero,
                                                                    () {
                                                                  Navigator.pop(
                                                                    context,
                                                                  );
                                                                });
                                                              },
                                                              title: context
                                                                  .l10n.yes,
                                                              size: const Size(
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
                                                  '$domain/img/attachments/${e.url}',
                                            ),
                                          );
                                        }
                                        if (extension == 'pdf') {
                                          await context.router.push(
                                            PdfViewerPageRouter(
                                              paht:
                                                  '$domain/img/attachments/${e.url}',
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
                                        style: textStyleWithSecondSemiBold
                                            .copyWith(
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
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (App.isAr(context))
          Positioned(
            bottom: 70.h,
            right: 50,
            child: Column(
              children: [
                // FloatingActionButton(
                //   onPressed: () async {
                //     final file = await FilePicker.platform.pickFiles();
                //     if (file != null) {
                //       await context.read<UserCubit>().uploadUserAttatchmentFunc(
                //             UploadAttachmentParams(
                //               attachment: file.files.first.path!,
                //               name: file.files.first.name,
                //             ),
                //           );
                //     }
                //   },
                //   child: const Icon(Icons.add),
                // ),
                // Text(
                //   'Add Attachment',
                //   style: textStyleWithPrimaryBold,
                // ),
                Button1(
                  onPressed: () async {
                    final file = await FilePicker.platform.pickFiles();
                    if (file != null) {
                      await context.read<UserCubit>().uploadUserAttatchmentFunc(
                            UploadAttachmentParams(
                              attachment: file.files.first.path!,
                              name: file.files.first.name,
                            ),
                          );
                    }
                  },
                  title: '',
                  child: Row(
                    children: [
                      const Icon(Icons.add, color: Colors.white),
                      Text(
                        context.l10n.addAttachment,
                        style: textStyleWithPrimaryBold.copyWith(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        else
          Positioned(
            bottom: 70.h,
            left: 50,
            child: Column(
              children: [
                // FloatingActionButton(
                //   onPressed: () async {
                //     final file = await FilePicker.platform.pickFiles();
                //     if (file != null) {
                //       await context.read<UserCubit>().uploadUserAttatchmentFunc(
                //             UploadAttachmentParams(
                //               attachment: file.files.first.path!,
                //               name: file.files.first.name,
                //             ),
                //           );
                //     }
                //   },
                //   child: const Icon(Icons.add),
                // ),
                // Text(
                //   'Add Attachment',
                //   style: textStyleWithPrimaryBold,
                // ),

                Button1(
                  title: '',
                  onPressed: () async {
                    final file = await FilePicker.platform.pickFiles();
                    if (file != null) {
                      await context.read<UserCubit>().uploadUserAttatchmentFunc(
                            UploadAttachmentParams(
                              attachment: file.files.first.path!,
                              name: file.files.first.name,
                            ),
                          );
                    }
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.add, color: Colors.white),
                      Text(
                        context.l10n.addAttachment,
                        style: textStyleWithPrimaryBold.copyWith(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
      ],
    );
  }
}
