import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewPage extends StatelessWidget {
  const PhotoViewPage({super.key, required this.path});
  final String path;
  @override
  Widget build(BuildContext context) {
    return PhotoView(
      imageProvider: NetworkImage(path),
    );
  }
}
