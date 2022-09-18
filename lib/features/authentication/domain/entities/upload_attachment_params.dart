import 'package:dio/dio.dart';
import 'package:home_cure/core/utils/attachment_url_helper.dart';
import 'package:http_parser/http_parser.dart';

class UploadAttachmentParams {
  UploadAttachmentParams({required this.attachment, required this.name});

  final String attachment;
  final String name;
  Future<Map<String, dynamic>> toMap() async {
    return <String, dynamic>{
      'attachment': await MultipartFile.fromFile(
        attachment,
        contentType: MediaType.parse(getMimeType(attachment)!),
      ),
      'name': name
    };
  }
}
