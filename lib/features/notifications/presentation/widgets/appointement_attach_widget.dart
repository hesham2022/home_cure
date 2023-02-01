import 'package:flutter/material.dart';
import 'package:home_cure/core/api_config/api_constants.dart';
import 'package:home_cure/core/utils/attachment_url_helper.dart';

class AppointmentAttachemntsWidget extends StatefulWidget {
  const AppointmentAttachemntsWidget({super.key, required this.urls});
  final List<String> urls;
  @override
  State<AppointmentAttachemntsWidget> createState() => _AppointmentAttachemntsWidgetState();
}

class _AppointmentAttachemntsWidgetState extends State<AppointmentAttachemntsWidget> {
  late List<AttachmentUrlHelper> attachments;
  @override
  void initState() {
    attachments = widget.urls.map<AttachmentUrlHelper>(AttachmentUrlHelper.new).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ListView.builder(
        itemCount: attachments.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          height: 100,
          width: 100,
          margin: const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            image: attachments[index].isImage
                ? DecorationImage(
                    image: NetworkImage(
                      kPhotosUrl + attachments[index].url,
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
