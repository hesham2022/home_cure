import 'package:mime/mime.dart';

class AttachmentUrlHelper {
  AttachmentUrlHelper(this.url);
  final String url;
  bool get isImage {
    final mimeType = lookupMimeType(url);

    return mimeType!.startsWith('image/');
  }

  bool get isPdf {
    final mimeType = lookupMimeType(url);

    return mimeType == 'application/pdf';
  }
  //
}

String? getMimeType(String url) => lookupMimeType(url);
