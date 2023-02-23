import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class Picker {
  static Future<String?> pickFile() async {
    final file = await FilePicker.platform.pickFiles();
    if (file != null) return file.files.first.path;
    return null;
  }

  static Future<XFile?> pickGallaryImage() async {
    final _picker = ImagePicker();
    // Pick an image
    final result = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (result != null) return result;
    return null;
  }
}
