import 'dart:io';

import 'package:flutter/material.dart';
import 'package:home_cure/features/home/presentation/pages/home.dart';
import 'package:photo_view/photo_view.dart';

enum PhotoViewPageProvider { file, newtwork, assets }

class PhotoViewPage extends StatelessWidget {
  const PhotoViewPage({
    super.key,
    required this.path,
    this.provider = PhotoViewPageProvider.newtwork,
  });
  final String path;
  final PhotoViewPageProvider provider;
  PhotoView getViewWidget() {
    if (provider == PhotoViewPageProvider.file) {
      return PhotoView(
        imageProvider: FileImage(File(path)),
      );
    }
    return PhotoView(
      imageProvider: NetworkImage(path),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        getViewWidget(),
        const Padding(
          padding: EdgeInsets.all(30),
          child: MyBackButton(
            buttonColor: Colors.white,
          ),
        )
      ],
    );
  }
}

class DataBase {
  factory DataBase() {
    _internal ??= DataBase._();
    return _internal!;
  }
  DataBase._();
  static DataBase? _internal;
}
