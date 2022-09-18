import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerPage extends StatelessWidget {
  const PdfViewerPage({super.key, required this.paht});
  final String paht;
  @override
  Widget build(BuildContext context) {
    print(paht);
    return SfPdfViewer.network(
      paht,
      canShowScrollHead: false,
      canShowScrollStatus: false,
    );
  }
}
