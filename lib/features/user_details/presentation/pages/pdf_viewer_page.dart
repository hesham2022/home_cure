import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerPage extends StatelessWidget {
  const PdfViewerPage({super.key, required this.paht});
  final String paht;
  @override
  Widget build(BuildContext context) {
    return SfPdfViewer.file(
      File(paht),
      canShowScrollHead: false,
      canShowScrollStatus: false,
    );
  }
}
