import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

enum FileExtension {
  jpg,
  jpeg,
  png,
  gif,
  bmp,
  tiff,
  pdf,
  doc,
  docx,
  xls,
  xlsx,
  ppt,
  pptx,
  txt,
  csv,
  mp3,
  wav,
  mp4,
  avi,
  mkv,
  mov,
  zip,
  rar,
  tar,
  gz,
}

extension FileExtensionHelper on FileExtension {
  String get extension {
    switch (this) {
      case FileExtension.jpg:
        return 'jpg';
      case FileExtension.jpeg:
        return 'jpeg';
      case FileExtension.png:
        return 'png';
      case FileExtension.gif:
        return 'gif';
      case FileExtension.bmp:
        return 'bmp';
      case FileExtension.tiff:
        return 'tiff';
      case FileExtension.pdf:
        return 'pdf';
      case FileExtension.doc:
        return 'doc';
      case FileExtension.docx:
        return 'docx';
      case FileExtension.xls:
        return 'xls';
      case FileExtension.xlsx:
        return 'xlsx';
      case FileExtension.ppt:
        return 'ppt';
      case FileExtension.pptx:
        return 'pptx';
      case FileExtension.txt:
        return 'txt';
      case FileExtension.csv:
        return 'csv';
      case FileExtension.mp3:
        return 'mp3';
      case FileExtension.wav:
        return 'wav';
      case FileExtension.mp4:
        return 'mp4';
      case FileExtension.avi:
        return 'avi';
      case FileExtension.mkv:
        return 'mkv';
      case FileExtension.mov:
        return 'mov';
      case FileExtension.zip:
        return 'zip';
      case FileExtension.rar:
        return 'rar';
      case FileExtension.tar:
        return 'tar';
      case FileExtension.gz:
        return 'gz';
      // ignore: unreachable_switch_default
      default:
        return '';
    }
  }
}

class AppMediaPicker {
  static final shared = AppMediaPicker();

  Future<List<XFile>?> pickMedia({
    required List<FileExtension> fileExtensions,
    bool allowMultiple = false,
  }) async {
    final ImagePicker picker = ImagePicker();

    List<XFile>? pickedFiles;

    if (allowMultiple) {
      pickedFiles = await picker.pickMultiImage();
    } else {
      XFile? singleFile = await picker.pickImage(source: ImageSource.gallery);
      pickedFiles = singleFile != null ? [singleFile] : [];
    }

    if (pickedFiles.isNotEmpty) {
      return pickedFiles;
    } else {
      debugPrint('No file selected');
      return null;
    }
  }
}

class AppFilePicker {
  static final shared = AppFilePicker();

  Future<List<PlatformFile>?> pickFile(
      FileType fileType, List<FileExtension> fileExtension,
      {allowMultiple}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: fileType,
        allowedExtensions: fileType == FileType.custom
            ? fileExtension.map((e) => e.extension).toList()
            : [],
        allowMultiple: allowMultiple,
        compressionQuality: 30);
    if (result != null) {
      return result.files;
    } else {
      debugPrint('No file selected');
      return null;
    }
  }
}
