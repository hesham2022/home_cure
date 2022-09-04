import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/common_header.dart';
import 'package:home_cure/features/Services/presentation/pages/services_page.dart';
import 'package:intl/intl.dart';

class AttachmentsPage extends StatefulWidget {
  const AttachmentsPage({super.key});

  @override
  State<AttachmentsPage> createState() => _AttachmentsPageState();
}

class AttachmentModel {
  AttachmentModel({required this.path, required this.date});
  final String path;
  final DateTime date;
}

class _AttachmentsPageState extends State<AttachmentsPage> {
  final paths = <AttachmentModel>[];
  Widget getIcon(String extension, String path) {
    if (extension == 'pdf') {
      return const Icon(Icons.picture_as_pdf_sharp);
    }
    if (extension == 'png' || extension == 'jpeg' || extension == 'jpg') {
      return Image.file(
        File(path),
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
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            const CommonHeader(title: 'Attachments'),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () async {
                    final file = await FilePicker.platform
                        .pickFiles(allowMultiple: true);
                    if (file != null) {
                      setState(() {
                        paths.addAll(
                          file.files.map(
                            (e) => AttachmentModel(
                              path: e.path!,
                              date: DateTime.now(),
                            ),
                          ),
                        );
                      });
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
                ...paths.map(
                  (e) {
                    final extension = e.path.split('/').last.split('.').last;
                    return Column(
                      children: [
                        ListTile(
                          onTap: () async {
                            if (extension == 'png' ||
                                extension == 'jpeg' ||
                                extension == 'jpg') {
                              await context.router
                                  .push(PhotoViewPageeRouter(path: e.path));
                            }
                            if (extension == 'pdf') {
                              await context.router
                                  .push(PdfViewerPageRouter(paht: e.path));
                            }
                          },
                          title: Text(
                            e.path.split('/').last,
                            style: textStyleWithPrimaryBold,
                          ),
                          subtitle: Text(
                            DateFormat('yyyy-MM-dd').format(e.date),
                            style: textStyleWithSecondSemiBold.copyWith(
                              fontSize: 14,
                            ),
                          ),
                          trailing: getIcon(
                            e.path.split('/').last.split('.').last,
                            e.path,
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
    );
  }
}
